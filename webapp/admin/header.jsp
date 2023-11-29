<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="${pageContext.request.contextPath }/admin/admin_index.jsp">Cake Shop Management</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li ><a href="${pageContext.request.contextPath }/admin/order_list">Order Management</a></li>
					<li ><a href="${pageContext.request.contextPath }/admin/user_list">Customer Management</a></li>
					<li ><a href="${pageContext.request.contextPath }/admin/goods_list">Cake Management</a></li>
					<li ><a href="${pageContext.request.contextPath }/admin/type_list">Type Management</a></li>
				
					<li><a href="${pageContext.request.contextPath }/user_logout">Quit</a></li>
				</ul>
			</div>
		</div>
	</nav>