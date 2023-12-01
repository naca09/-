<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>User Center</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
        <link type="text/css" rel="stylesheet" href="css/style.css">
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/simpleCart.min.js"></script>
    </head>
    <body>

        <jsp:include page="/header.jsp">
            <jsp:param value="4" name="flag"/>
        </jsp:include>

        <!--account-->
        <div class="account">
            <div class="container">
                <div class="register">
                    <c:if test="${!empty msg }">
                        <div class="alert alert-success">${msg }</div>
                    </c:if>
                    <c:if test="${!empty failMsg }">
                        <div class="alert alert-danger">${failMsg }</div>
                    </c:if>

                    <div class="register-top-grid">
                        <h3>User Center</h3>
                        <form action="${pageContext.request.contextPath }/user_changeaddress" method="post"> 
                            <!-- delivery information start -->
                            <h4>Delivery Information</h4>
                            <div class="input">
                                <span>Receiver's Name<label></label></span>
                                <input type="text" name="name" value="${user.name }" placeholder="name of receipt"> 
                            </div>
                            <div class="input">
                                <span>Receiver's Phone Number</span>
                                <input type="text" name="phone" value="${user.phone }" placeholder="phone of receipt"> 
                            </div>
                            <div class="input">
                                <span>Receiver's Address</span>
                                <input type="text" name="address" value="${user.address }" placeholder="address of receipt"> 
                            </div>
                            <div class="register-but text-center">
                                <input type="submit" value="Submit">
                            </div>	
                            <!-- delivery information end -->
                        </form>
                        <hr>
                        <form action="${pageContext.request.contextPath }/user_changepwd" method="post"> 
                            <h4>Change Password</h4>
                            <div class="register-bottom-grid input">
                                <span>Old Password</span>
                                <input type="password" name="password" placeholder="Please enter an old password"> 
                            </div>
                            <div class="register-bottom-grid input">
                                <span>New Password</span>
                                <input type="password" name="newPassword" placeholder="Please enter a new password"> 
                            </div>
                            <div class="clearfix"> </div>
                            <div class="register-but text-center">
                                <input type="submit" value="Sumit">
                            </div>	
                        </form>
                    </div>

                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!--//account-->




        <jsp:include page="/footer.jsp"></jsp:include>


    </body>
</html>
