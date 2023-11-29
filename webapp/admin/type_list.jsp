<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>Type List</title>
<meta charset="utf-8"/>
<link rel="stylesheet" href="css/bootstrap.css"/> 
</head>
<body>
<div class="container-fluid">

	<jsp:include page="/admin/header.jsp"></jsp:include>
	
	<br>
	
	<div>
		<form class="form-inline" method="post" action="${pageContext.request.contextPath }/admin/type_add">
			<input type="text" class="form-control" id="input_name" name="name" placeholder="Enter the type name" required="required" style="width: 500px">
			<input type="submit" class="btn btn-warning" value="Add"/>
		</form>
	</div>
	<br/>
	<c:if test="${!empty msg }">
			<div class="alert alert-success">${msg }</div>
		</c:if>
		<c:if test="${!empty failMsg }">
			<div class="alert alert-danger">${failMsg }</div>
		</c:if>
	<br>

	<table class="table table-bordered table-hover">

	<tr>
		<th width="5%">ID</th>
		<th width="10%">Name</th>
		<th width="10%">Option</th>
	</tr>
	
	<c:forEach items="${list }" var="t">
         <tr>
         	<td><p>${t.id }</p></td>
         	<td><p>${t.name }</p></td>
			<td>
				<a class="btn btn-primary" href="${pageContext.request.contextPath }/admin/type_edit.jsp?id=${t.id }&name=${t.encodeName }">Edit</a>
				<a class="btn btn-danger" href="${pageContext.request.contextPath }/admin/type_delete?id=${t.id }">Delete</a>
			</td>
       	</tr>
     </c:forEach>
        
     
</table>

</div>
</body>
</html>