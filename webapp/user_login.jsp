<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>User Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
        <link type="text/css" rel="stylesheet" href="css/style.css">
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/simpleCart.min.js"></script>
    </head>
    <body>



        <jsp:include page="/header.jsp"></jsp:include>
            <style>
                /* General styles for the form */
body {
  font-family: Arial, sans-serif;
}

form {
  width: 300px;
  margin: 0 auto;
}

h3 {
  text-align: center;
  color: #333;
}

.input {
  margin-bottom: 20px;
}

input[type="text"], input[type="password"] {
  width: 100%;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 5px;
}

button#togglePassword {
  position: absolute;
  padding: 5px;
  border: 5px;
  background-color: #FD9F3E;
  color: white;
  cursor: pointer;
}

input[type="submit"] {
  width: 100%;
  padding: 10px;
  border: none;
  background-color: #04AA6D;
  color: white;
  cursor: pointer;
}




            </style>

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

                    <form action="${pageContext.request.contextPath}/user_login" method="post"> 
                        <div class="register-top-grid">
                            <h3>User Login</h3>
                            <div class="input email-input">
                                <span>Email <label style="color:red;">*</label></span>
                                <input type="text" name="ue" placeholder="Please enter Email" required="required"> 
                            </div>
                            <div class="input password-input" style="position: relative;">
                                <span>Password <label style="color:red;">*</label></span>
                                <input type="password" name="password" placeholder="Please enter Password" id="password" required="required"> 
                                <button type="button" id="togglePassword" >Show</button>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="register-but text-center">
                            <input type="submit" value="Login">
                            <div class="clearfix"> </div>
                        </div>
                    </form>
                    <script>
                        document.getElementById('togglePassword').addEventListener('click', function (e) {
                            const password = document.getElementById('password');
                            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                            password.setAttribute('type', type);
                            this.textContent = type === 'password' ? 'Show' : 'Hide';
                        });
                    </script>


                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!--//account-->



        <jsp:include page="/footer.jsp"></jsp:include>

    </body>
</html>