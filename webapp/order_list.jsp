<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Order</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
        <link type="text/css" rel="stylesheet" href="css/style.css">
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="layer/layer.js"></script>
        <script type="text/javascript" src="js/cart.js"></script>
    </head>
    <body>


        <jsp:include page="/header.jsp">
            <jsp:param value="5" name="flag"/>
        </jsp:include>


        <!--cart-items-->
        <div class="cart-items">
            <div class="container">



                <h2>My Order</h2>

                <table class="table table-bordered table-hover">

                    <tr>
                        <th width="5%" style="text-align: center;">ID</th>
                        <th width="25%" style="text-align: center;">Product Details</th>
                        <th width="5%" style="text-align: center;">Total</th>               
                        <th width="5%" style="text-align: center;">Amount</th>
                        <th width="15%" style="text-align: center;">Status</th>
                        <th width="10%" style="text-align: center;">Shipping Unit</th>
                        <th width="20%" style="text-align: center;">Delivery Information</th>


                    </tr>

                    <c:forEach items="${orderList }" var="order">
                        <tr>
                            <td><p style="text-align: center;">${order.id }</p></td>
                            <td>
                                <c:forEach items="${order.itemList }" var="item">
                                    <p>${item.goodsName }(${item.price }) x ${item.amount}</p>
                                </c:forEach>
                            </td>
                            <td><p style="text-align: center;">${order.total }</p></td>
                                <td><p style="text-align: center;">${order.amount }</p></td>

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
                                <td>
                                    <p>${order.name }</p>
                                <p>${order.phone }</p>
                                <p>${order.address }</p>
                            </td>
                        </tr>
                    </c:forEach>



                </table>
            </div>
        </div>
        <!--//cart-items-->	
        <jsp:include page="/footer.jsp"></jsp:include>


    </body>
</html>
