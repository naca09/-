<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Order Management</title>
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

                <ul role="tablist" class="nav nav-tabs">  
                    <li <c:if test="${status==0 }">class="active"</c:if> role="presentation"><a href="${pageContext.request.contextPath }/admin/order_list">All Orders</a></li>
                <li <c:if test="${status==1 }">class="active"</c:if> role="presentation"><a href="${pageContext.request.contextPath }/admin/order_list?status=1"></a></li>
                <li <c:if test="${status==2 }">class="active"</c:if> role="presentation"><a href="${pageContext.request.contextPath }/admin/order_list?status=2"></a></li>
                <li <c:if test="${status==3 }">class="active"</c:if> role="presentation"><a href="${pageContext.request.contextPath }/admin/order_list?status=3"></a></li>
                <li <c:if test="${status==4 }">class="active"</c:if> role="presentation"><a href="${pageContext.request.contextPath }/admin/order_list?status=4"></a></li>
                </ul>

                <br>

                <table class="table table-bordered table-hover">

                    <tr>
                        <th width="5%" style="text-align: center;">ID</th>
                        <th width="5%" style="text-align: center;">Total</th>
                        <th width="15%" style="text-align: center;">Product Details</th>
                        <th width="20%" style="text-align: center;">Delivery Information</th>
                        <th width="10%" style="text-align: center;">Order Status</th>
                        <th width="10%" style="text-align: center;">Shipping Unit</th>
                        <th width="10%" style="text-align: center;">Username</th>
                        <th width="10%" style="text-align: center;">Edit</th>
                    </tr>

                <c:forEach items="${p.list }" var="order">
                    <tr>
                        <td><p style="text-align: center;">${order.id }</p></td>
                        <td><p style="text-align: center;">${order.total }</p></td>
                        <td style="text-align: center;">
                            <c:forEach items="${order.itemList }" var="item">
                                <p>${item.goodsName }(${item.price }) x ${item.amount}</p>
                            </c:forEach>
                        </td>
                        <td> 
                            <p style="text-align: center;">${order.name }</p>
                            <p style="text-align: center;">${order.phone }</p>
                            <p style="text-align: center;">${order.address }</p>
                        </td>
                        <td>
                            <p style="text-align: center;">
                                <c:if test="${order.status=='1' }"><span style="color:red;">Unpaid</span></c:if>
                                <c:if test="${order.status=='2' }"><span style="color:green;">Already paid</span></c:if>
                                <c:if test="${order.status=='3' }"><span style="color:blue;">Delivering</span></c:if>
                                <c:if test="${order.status=='4' }"><span style="color:black;">Completed</span></c:if>
                                </p>
                            </td>
                            <td>
                                <p style="text-align: center;">

                                <c:if test="${order.paytype=='1' }">Now Food</c:if>
                                <c:if test="${order.paytype=='2' }">Grab Food</c:if>
                                <c:if test="${order.paytype=='3' }">Shopee Food</c:if>
                                </p>
                            </td>
                            <td><p style="text-align: center;">${order.user.username }</p></td>
                        <td>
                            <c:if test="${order.status == '2'}">
                                <button class="btn btn-success" onclick="updateOrderStatus(${order.id}, 3)">Ship</button>
                            </c:if>
                            <c:if test="${order.status == '3'}">
                                <button class="btn btn-warning" onclick="updateOrderStatus(${order.id}, 4)">Finish</button>
                            </c:if>
                            <button class="btn btn-danger" onclick="deleteOrder(${order.id}, ${p.pageNo}, ${status})">Delete</button>
                        </td>

                    </tr>
                </c:forEach>




            </table>

            <br>
            <jsp:include page="/page.jsp">
                <jsp:param value="/admin/order_list" name="url"/>
                <jsp:param value="&status=${status}" name="param"/>
            </jsp:include>
            <br>
        </div>
        <script type="text/javascript">
            //
            function updateOrderStatus(orderId, newStatus) {
                //XMLHttpRequest, used to send a request to the server without reloading the page.
                var xhr = new XMLHttpRequest();
                //Get is created from the server's pageContext.request.contextPath value, along with the id and status parameters.
                xhr.open('GET', '${pageContext.request.contextPath}/admin/order_status?id=' + orderId + '&status=' + newStatus, true);
                xhr.onreadystatechange = function () {
                    //check the HTTP status code
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        if (xhr.status === 200) {
                            //If the status code is 200 (success), display the message "Status Updated".
                            alert('Status Updated');
                        } else {
                            //If not, display an error message.
                            alert('Error updating status');
                        }
                    }
                };
                xhr.send();
            }

            function deleteOrder(orderId, pageNo, status) {
                //This function creates and uses an XMLHttpRequest object.
                var xhr = new XMLHttpRequest();
                //Open a 'GET' request to another URL, with id, pageNo, and status parameters
                xhr.open('GET', '${pageContext.request.contextPath}/admin/order_delete?id=' + orderId + '&pageNo=' + pageNo + '&status=' + status, true);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        if (xhr.status === 200) {
                            //If the status code is 200 (success), display the message "Order Deleted".
                            alert('Order Deleted!');
                            // Tùy chọn: Cập nhật giao diện người dùng ở đây
                        } else {
                            //If not, display an error message.
                            alert('Error deleting order');
                        }
                    }
                };
                xhr.send();
            }
        </script>

    </body>
</html>
