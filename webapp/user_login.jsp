<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>用户登录</title>
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
				
				<form action="${pageContext.request.contextPath }/user_login" method="post"> 
					<div class="register-top-grid">
						<h3>Log-in</h3>
						<div class="input">
							<span>Email:<label style="color:red;">*</label></span>
							<input type="text" name="ue" placeholder="please enter your email" required="required"> 
						</div>
						<div class="register-bottom-grid input">
							<span>Password <label style="color:red;">*</label></span>
							<input type="password" name="password" placeholder="please enter your password" required="required"> 
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="register-but text-center">
					   <input type="submit" value="Log-in">
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
