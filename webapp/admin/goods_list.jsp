<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>List Cake</title>
<meta charset="utf-8"/>
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
	
	<div class="text-right"><a class="btn btn-warning" href="${pageContext.request.contextPath }/admin/goods_add.jsp">Add cake</a></div>
	
	<br>
		
	<ul role="tablist" class="nav nav-tabs">
        <li <c:if test="${type==0 }">class="active"</c:if> role="presentation"><a href="${pageContext.request.contextPath }/admin/goods_list">All Cake</a></li>
        <li <c:if test="${type==1 }">class="active"</c:if> role="presentation"><a href="${pageContext.request.contextPath }/admin/goods_list?type=1">Banner recommendations</a></li>
        <li <c:if test="${type==2 }">class="active"</c:if> role="presentation"><a href="${pageContext.request.contextPath }/admin/goods_list?type=2">Hot Recommend</a></li>
        <li <c:if test="${type==3 }">class="active"</c:if> role="presentation"><a href="${pageContext.request.contextPath }/admin/goods_list?type=3">New Cake</a></li>
    </ul>
    
    
    
    
	
	<br>

	<table class="table table-bordered table-hover">

	<tr>
		<th width="5%">ID</th>
		<th width="10%">Picture</th>
		<th width="10%">Name</th>
		<th width="20%">Introduce</th>
		<th width="10%">Price</th>
		<th width="10%">Type</th>
		<th width="25%">Option</th>
	</tr>
	
	<c:forEach items="${p.list }" var="g">
         <tr>
         	<td><p>${g.id }</p></td>
         	<td><p><a href="${pageContext.request.contextPath }/goods_detail?id=${g.id}" target="_blank"><img src="${pageContext.request.contextPath }${g.cover}" width="100px" height="100px"></a></p></td>
         	<td><p><a href="${pageContext.request.contextPath }/goods_detail?id=${g.id}" target="_blank">${g.name}</a></p></td>
         	<td><p>${g.intro}</p></td>
         	<td><p>${g.price}</p></td>
         	<td><p>${g.type.name}</p></td>
			<td>
				<p>
				<c:choose>
					<c:when test="${g.isScroll }">
						<a class="btn btn-info" href="${pageContext.request.contextPath }/admin/goods_recommend?id=${g.id }&method=remove&typeTarget=1&pageNo=${p.pageNo}&type=${type}">Remove Banner</a>
					</c:when>
					<c:otherwise>
						<a class="btn btn-primary" href="${pageContext.request.contextPath }/admin/goods_recommend?id=${g.id }&method=add&typeTarget=1&pageNo=${p.pageNo}&type=${type}">Add Banner</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${g.isHot }">
						<a class="btn btn-info" href="${pageContext.request.contextPath }/admin/goods_recommend?id=${g.id }&method=remove&typeTarget=2&pageNo=${p.pageNo}&type=${type}">Remove Hot</a>
					</c:when>
					<c:otherwise>
						<a class="btn btn-primary" href="${pageContext.request.contextPath }/admin/goods_recommend?id=${g.id }&method=add&typeTarget=2&pageNo=${p.pageNo}&type=${type}">Add Hot</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${g.isNew }">
						<a class="btn btn-info" href="${pageContext.request.contextPath }/admin/goods_recommend?id=${g.id }&method=remove&typeTarget=3&pageNo=${p.pageNo}&type=${type}">Remove New Cake</a>
					</c:when>
					<c:otherwise>
						<a class="btn btn-primary" href="${pageContext.request.contextPath }/admin/goods_recommend?id=${g.id }&method=add&typeTarget=3&pageNo=${p.pageNo}&type=${type}">Add New Cake</a>
					</c:otherwise>
				</c:choose>
				
				</p>
				<a class="btn btn-success" href="${pageContext.request.contextPath }/admin/goods_editshow?id=${g.id }&pageNo=${p.pageNo}&type=${type}">Edit</a>
				<a class="btn btn-danger" href="${pageContext.request.contextPath }/admin/goods_delete?id=${g.id }&pageNo=${p.pageNo}&type=${type}">Delete</a>
			</td>
       	</tr>
    </c:forEach> 
     
     
</table>

<br>
<jsp:include page="/page.jsp">
<jsp:param value="/admin/goods_list" name="url"/>
<jsp:param value="&type=${type }" name="param"/>
</jsp:include>
<br>
</div>
</body>
</html>
