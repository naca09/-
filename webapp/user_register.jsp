<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>User Register</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
        <link type="text/css" rel="stylesheet" href="css/style.css">
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/simpleCart.min.js"></script>
    </head>
    <script type="text/javascript">
        function check_mail(e) {
            if (!/(\S)+[@]{1}(\S)+[.]{1}(\w)+/.test(e))
            {
                alert("Please enter the correct format e-mail address！");
            }
        }
    </script>
    <body>



        <jsp:include page="/header.jsp"></jsp:include>


            <!--account-->
            <div class="account">
                <div class="container">
                    <div class="register">
                    <c:if test="${!empty msg }">
                        <div class="alert alert-danger">${msg }</div>
                    </c:if>
                    <form action="${pageContext.request.contextPath }/user_register" method="post"> 
                        <div class="register-top-grid">
                            <h3>Register New Account</h3>
                            <div class="input">
                                <span>Username<label style="color:red;">*</label></span>
                                <input type="text" name="username" placeholder="please enter user name" required="required"> 
                            </div>
                            <div class="input">
                                <span>Email<label style="color:red;">*</label></span>
                                <input type="text" name="email" placeholder="please enter your email" required="required" onblur="check_mail(this.value)">
                            </div>
                            <div class="input">
                                <span>Password <label style="color:red;">*</label></span>
                                <input type="text" name="password" placeholder="please enter your password" required="required"> 
                            </div>
                            <div class="input">
                                <span>Name of Customer<label></label></span>
                                <input type="text" name="name" placeholder="please enter name of customer"> 
                            </div>
                            <div class="input">
                                <span>Phone Number<label></label></span>
                                <input type="text" name="phone" placeholder="please enter your phone number"> 
                            </div>
                            <div class="input">
                                <span>Shipping Address<label></label></span>
                                <input type="text" name="address" placeholder="please enter your address"> 
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="register-but text-center">
                            <input type="submit" value="Submit">
                            <div class="clearfix"> </div>
                        </div>
                    </form>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!--//account-->

        <jsp:include page="/footer.jsp"></jsp:include>


    </body>
</html>