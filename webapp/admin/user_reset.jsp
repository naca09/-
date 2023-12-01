<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Reset Password</title>
<meta charset="utf-8"/>
<link rel="stylesheet" href="css/bootstrap.css"/> 
</head>
<body>
<div class="container-fluid">
<jsp:include page="/admin/header.jsp"></jsp:include>

	<br><br>
	
	<form class="form-horizontal" action="${pageContext.request.contextPath }/admin/user_reset" method="post">
		<input type="hidden" name="id" value="${param.id }">
		<div class="form-group">
			<label for="input_name" class="col-sm-1 control-label">Username</label>
			<div class="col-sm-5">${param.username }</div>
		</div>
		<div class="form-group">
			<label for="input_name" class="col-sm-1 control-label">Email</label>
			<div class="col-sm-5">${param.email }</div>
		</div>
		<div class="form-group">
    <label for="input_password" class="col-sm-1 control-label">Password</label>
    <div class="col-sm-6">
        <input type="password" class="form-control" id="input_password" name="password" required="required">
        <button type="button" id="show_hide_password_btn">Show</button>
    </div>
</div>

		<div class="form-group">
			<div class="col-sm-offset-1 col-sm-10">
				<button type="submit" class="btn btn-success">Submit</button>
			</div>
		</div>
	</form>
	
	<span style="color:red;"></span>
	
</div>	
</body>
<script>
document.getElementById('show_hide_password_btn').addEventListener('click', function (e) {
    var passwordInput = document.getElementById('input_password');
    if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        this.textContent = 'Hide';
    } else {
        passwordInput.type = 'password';
        this.textContent = 'Show';
    }
});
</script>

</html>
