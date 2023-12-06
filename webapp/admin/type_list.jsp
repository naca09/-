<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Type Management</title>
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

                <br>

                <div>
                    <form class="form-inline" method="post" action="${pageContext.request.contextPath }/admin/type_add">
                    <input type="text" class="form-control" id="input_name" name="name" placeholder="Enter the type name" required="required" style="width: 500px">
                    <input type="submit" class="btn btn-warning" value="Add"/>
                </form>
            </div>
            <br/>
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
                    <th width="10%">Name</th>
                    <th width="10%">Option</th>
                </tr>

                <c:forEach items="${list }" var="t">
                    <tr>
                        <td><p>${t.id }</p></td>
                        <td><p>${t.name }</p></td>
                        <td>
                            <a class="btn btn-primary" href="${pageContext.request.contextPath }/admin/type_edit.jsp?id=${t.id }&name=${t.encodeName }">Edit</a>
                           <a class="btn btn-danger" href="javascript:confirmDelete('${pageContext.request.contextPath}/admin/type_delete?id=${t.id}')">Delete</a>

                        </td>
                    </tr>
                </c:forEach>


            </table>

        </div>
    </body>
    <!<!-- buttonn to scroll Start -->
        <button onclick="topFunction()" id="topBtn" class="scrollBtn" title="Go to top"><i class="fa-solid fa-arrow-up"></i></button>
        <button onclick="bottomFunction()" id="bottomBtn" class="scrollBtn" title="Go to bottom"><i class="fa-solid fa-arrow-down"></i></button>
        <style>

        </style>
        <script>
            // Khi người dùng cuộn xuống 20px từ đầu tài liệu, hiển thị nút
            window.onscroll = function () {
                scrollFunction()
            };

            function scrollFunction() {
                if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                    document.getElementById("topBtn").style.display = "block";
                    document.getElementById("bottomBtn").style.display = "block";
                } else {
                    document.getElementById("topBtn").style.display = "none";
                    document.getElementById("bottomBtn").style.display = "none";
                }
            }

            // Khi người dùng nhấp vào nút, cuộn lên đầu tài liệu
            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }

            // Khi người dùng nhấp vào nút, cuộn xuống cuối tài liệu
            function bottomFunction() {
                window.scrollTo(0, document.body.scrollHeight);
            }
            
            //Button to Delete 
            function confirmDelete(url) {
                    if (confirm("Are you sure you want to delete?")) {
                        window.location.href = url; // Redirect to the delete URL
                    }
                }
        </script>
        <style>
            .scrollBtn {
                position: fixed; /* Fixed position relative to the viewport */
                right: 10px; /* Distance from the right edge of the viewport */
                z-index: 1000; /* Ensure the button is above other elements */
                cursor: pointer; /* Change cursor on hover */
                /* Additional styling for the buttons */
            }

            /* Position the 'Go to top' button */
            #topBtn {
                background-color: #FD9F3E;
                color: white;
                cursor: pointer;
                padding: 15px;
                border-radius: 10px;
                border: none;
                outline: none;
                top: 50%; /* Align vertically at the center */
                transform: translateY(-60px); /* Adjust position to avoid overlapping with the bottom button */
            }

            /* Position the 'Go to bottom' button */
            #bottomBtn {
                background-color: #FD9F3E;
                color: white;
                cursor: pointer;
                padding: 15px;
                border-radius: 10px;
                border: none;
                outline: none;
                top: 50%; /* Align vertically at the center */
                transform: translateY(0px); /* No adjustment needed */
                border: none;
                outline: none;
            }

        </style>
        <script src="https://kit.fontawesome.com/4219c0e8dc.js" crossorigin="anonymous"></script>

        <!<!-- buttonn to scroll End -->
</html>
