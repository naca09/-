<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>User Management</title>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href="css/bootstrap.css"/> 
    </head>
    <body>
        <style>
            .container-fluid {
                padding: 30px; /* More padding around the content */
            }
        </style>
        <script>
            function confirmDelete(url) {
                if (confirm("Are you sure you want to delete?")) {
                    window.location.href = url; // Redirect to the delete URL
                }
            }
        </script>
        <div class="container-fluid">

            <jsp:include page="/admin/header.jsp"></jsp:include>

                <div class="text-right"><a class="btn btn-warning" href="${pageContext.request.contextPath }/admin/user_add.jsp">Add New User</a></div>
            <c:if test="${!empty msg }">
                <div class="alert alert-success">${msg }</div>
            </c:if>
            <c:if test="${!empty failMsg }">
                <div class="alert alert-danger">${failMsg }</div>
            </c:if>
            <br>



            <table class="table table-bordered table-hover">

                <tr>
                    <th width="5%" style="text-align: center;">ID</th>
                    <th width="10%" style="text-align: center;">User Name</th>
                    <th width="10%" style="text-align: center;">Email</th>
                    <th width="10%" style="text-align: center;">Name</th>
                    <th width="10%" style="text-align: center;">Phone</th>
                    <th width="10%" style="text-align: center;">Address</th>
                    <th width="10%">Option</th>
                </tr>

                <c:forEach items="${p.list }" var="u">
                    <tr>
                        <td><p style="text-align: center;">${u.id }</p></td>
                        <td><p style="text-align: center;">${u.username }</p></td>
                        <td><p style="text-align: center;">${u.email }</p></td>
                        <td><p style="text-align: center;">${u.name }</p></td>
                        <td><p style="text-align: center;">${u.phone }</p></td>
                        <td><p style="text-align: center;">${u.address }</p></td>
                        <td>
                            <a class="btn btn-info" href="${pageContext.request.contextPath }/admin/user_reset.jsp?id=${u.id }&username=${u.username }&email=${u.email }">Reset Password    </a>
                            <a class="btn btn-primary" href="${pageContext.request.contextPath }/admin/user_editshow?id=${u.id }">Edit</a>
                            <a class="btn btn-danger" href="javascript:confirmDelete('${pageContext.request.contextPath}/admin/user_delete?id=${u.id}')">Delete</a>


                        </td>
                    </tr>
                </c:forEach>
            </table>
            <br>
            <jsp:include page="/page.jsp">
                <jsp:param value="/admin/user_list" name="url"/>
            </jsp:include>
            <br>
        </div>
    </body>
</html>
