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
		<th width="5%">ID</th>
		<th width="10%">User Name</th>
		<th width="10%">Email</th>
		<th width="10%">Name</th>
		<th width="10%">Phone</th>
		<th width="10%">Address</th>
		<th width="10%">Option</th>
	</tr>
	
	<c:forEach items="${p.list }" var="u">
         <tr>
         	<td><p>${u.id }</p></td>
         	<td><p>${u.username }</p></td>
         	<td><p>${u.email }</p></td>
         	<td><p>${u.name }</p></td>
         	<td><p>${u.phone }</p></td>
         	<td><p>${u.address }</p></td>
			<td>
				<a class="btn btn-info" href="${pageContext.request.contextPath }/admin/user_reset.jsp?id=${u.id }&username=${u.username }&email=${u.email }">Reset Password    </a>
				<a class="btn btn-primary" href="${pageContext.request.contextPath }/admin/user_editshow?id=${u.id }">Edit</a>
				<a class="btn btn-danger" href="${pageContext.request.contextPath }/admin/user_delete?id=${u.id }">Delete</a>
                                
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
