<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Order Submit</title>
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


        <jsp:include page="/header.jsp"></jsp:include>

            <div class="cart-items">
                <div class="container">
                    <h2>Confirm receipt information</h2>
                    <form class="form-horizontal" action="${pageContext.request.contextPath }/order_confirm" method="post" id="payform">
                    <div class="row">
                        <label class="control-label col-md-1">Receiver</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="name" value="${user.name }" style="height:auto;padding:10px;" placeholder="enter receiver's name" required="required"><br>
                        </div>
                    </div>
                    <div class="row">
                        <label class="control-label col-md-1">Phone number</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="phone" value="${user.phone }" style="height:auto;padding:10px;" placeholder="enter receiver's phone required="required"><br>
                        </div>
                    </div>
                    <div class="row">
                        <label class="control-label col-md-1">Address</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" name="address" value="${user.address }" style="height:auto;padding:10px;" placeholder="enter receiver's address" required="required"><br>
                        </div>
                    </div>

                    <br><hr><br>

                    <h2>Select shipping units</h2>
                    <h3>Total: ${order.total }</h3><br><br>


                    <div class="col-sm-6 col-md-4 col-lg-3 ">
                        <label>
                            <div class="thumbnail">
                                <input type="radio" name="paytype" value="1" checked="checked" />
                                <img src="images/now.png" alt="now_food">
                            </div>
                        </label>
                    </div>
                    <div class="col-sm-6 col-md-4 col-lg-3 ">
                        <label>
                            <div class="thumbnail">
                                <input type="radio" name="paytype" value="2"  />
                                <img src="images/grab.png" alt="grab_food">
                            </div>
                        </label>
                    </div>
                    <div class="col-sm-6 col-md-4 col-lg-3 ">
                        <label>
                            <div class="thumbnail">
                                <input type="radio" name="paytype" value="3"  />
                                <img src="images/shopee.png" alt="shopee_food">
                            </div>
                        </label>
                    </div>
                    <div class="clearfix"> </div>
                    <div class="register-but text-center">
                        <input type="submit" value="Submit">
                        <div class="clearfix"> </div>
                    </div>
                </form>
            </div>
        </div>



        <jsp:include page="/footer.jsp"></jsp:include>


        <script type="text/javascript">
            function dopay(paytype) {
                $("#paytype").val(paytype);
                $("#payform").submit();
            }
        </script>

    </body>
</html>
