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
                                    <p style="text-align: center;">${item.goodsName }(${item.price }) x ${item.amount}</p>
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
                                <td style="text-align: center;">
                                    <p>${order.name }</p>
                                <p>${order.phone }</p>
                                <p>${order.address }</p>
                            </td>
                        </tr>
                    </c:forEach>



                </table>
            </div>
        </div>
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
        <!--//cart-items-->	
        <jsp:include page="/footer.jsp"></jsp:include>


    </body>
</html>
