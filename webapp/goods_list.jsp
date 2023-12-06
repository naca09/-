<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://kit.fontawesome.com/4219c0e8dc.js" crossorigin="anonymous"></script>

<!DOCTYPE html>
<html>
    <head>
        <title>Cake Management</title>
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

                <div class="text-right"><a class="btn btn-warning" href="${pageContext.request.contextPath }/admin/goods_add.jsp">Add cake</a></div>

            <br>

            <ul role="tablist" class="nav nav-tabs">
                <li <c:if test="${type==0 }">class="active"</c:if> role="presentation"><a href="${pageContext.request.contextPath }/admin/goods_list">All Cake</a></li>
                <li <c:if test="${type==1 }">class="active"</c:if> role="presentation"><a href="${pageContext.request.contextPath }/admin/goods_list?type=1">Banner Recommend</a></li>
                <li <c:if test="${type==2 }">class="active"</c:if> role="presentation"><a href="${pageContext.request.contextPath }/admin/goods_list?type=2">Hot Recommend</a></li>
                <li <c:if test="${type==3 }">class="active"</c:if> role="presentation"><a href="${pageContext.request.contextPath }/admin/goods_list?type=3">New Cake</a></li>
                </ul>	
                <br>
                <table class="table table-bordered table-hover">

                    <tr>
                        <th width="5%" style="text-align: center;">ID</th>
                        <th width="10%" style="text-align: center;">Picture</th>
                        <th width="10%" style="text-align: center;">Name</th>
                        <th width="20%" style="text-align: center;">Introduce</th>
                        <th width="5%" style="text-align: center;">Price</th>
                        <th width="10%" style="text-align: center;">Type</th>
                        <th width="25%" style="text-align: center;">Option</th>
                    </tr>

                <c:forEach items="${p.list }" var="g">
                    <tr>
                        <td><p style="text-align: center;">${g.id }</p></td>
                        <td><p style="text-align: center;"><a href="${pageContext.request.contextPath }/goods_detail?id=${g.id}" target="_blank"><img src="${pageContext.request.contextPath }${g.cover}" width="100px" height="100px"></a></p></td>
                        <td><p style="text-align: center;"><a href="${pageContext.request.contextPath }/goods_detail?id=${g.id}" target="_blank">${g.name}</a></p></td>
                        <td><p>${g.intro}</p></td>
                        <td><p style="text-align: center;">${g.price}</p></td>
                        <td><p style="text-align: center;">${g.type.name}</p></td>
                        <td>
                            <p>
                                <c:choose>
                                    <c:when test="${g.isScroll }">
                                        <a class="btn btn-info" href="${pageContext.request.contextPath }/admin/goods_recommend?id=${g.id }&method=remove&typeTarget=1&pageNo=${p.pageNo}&type=${type}">Remove Banner</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="btn btn-primary" href="${pageContext.request.contextPath }/admin/goods_recommend?id=${g.id }&method=add&typeTarget=1&pageNo=${p.pageNo}&type=${type}">Add Banner</a>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${g.isHot }">
                                        <a class="btn btn-info" href="${pageContext.request.contextPath }/admin/goods_recommend?id=${g.id }&method=remove&typeTarget=2&pageNo=${p.pageNo}&type=${type}">Remove Hot</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="btn btn-primary" href="${pageContext.request.contextPath }/admin/goods_recommend?id=${g.id }&method=add&typeTarget=2&pageNo=${p.pageNo}&type=${type}">Add Hot</a>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${g.isNew }">
                                        <a class="btn btn-info" href="${pageContext.request.contextPath }/admin/goods_recommend?id=${g.id }&method=remove&typeTarget=3&pageNo=${p.pageNo}&type=${type}">Remove New Cake</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="btn btn-primary" href="${pageContext.request.contextPath }/admin/goods_recommend?id=${g.id }&method=add&typeTarget=3&pageNo=${p.pageNo}&type=${type}">Add New Cake</a>
                                    </c:otherwise>
                                </c:choose>

                            </p>
                            <a class="btn btn-success" href="${pageContext.request.contextPath }/admin/goods_editshow?id=${g.id }&pageNo=${p.pageNo}&type=${type}">Edit</a>
                            <a class="btn btn-danger" href="javascript:confirmDelete('${pageContext.request.contextPath}/admin/goods_delete?id=${g.id}&pageNo=${p.pageNo}&type=${type}')">Delete</a>

                        </td>
                    </tr>
                </c:forEach> 


            </table>

            <br>
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
                
                //Delete Action
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
            <jsp:include page="/page.jsp">
                <jsp:param value="/admin/goods_list" name="url"/>
                <jsp:param value="&type=${type }" name="param"/>
            </jsp:include>
            <br>
        </div>
    </body>
</html>
