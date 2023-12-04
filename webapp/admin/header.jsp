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
<style>
    .navbar-default {
        background-color: #f8f8f8; /* Light gray background */
        border-color: #e7e7e7; /* Slightly darker gray border */
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.06); /* Subtle shadow for depth */
    }

    /* Style for the brand/logo */
    .navbar-brand {
        color: #5e5e5e; /* Dark gray text color */
        font-size: 24px; /* Larger font size */
        font-weight: bold; /* Bold font weight */
        padding: 15px 20px; /* Adjust padding */
    }

    .navbar-brand:hover, .navbar-brand:focus {
        color: #434343; /* Slightly darker gray for hover/focus */
        text-decoration: none; /* Remove underline */
    }

    /* Style for navigation links */
    .nav > li > a {
        color: #5e5e5e; /* Dark gray text color */
        font-size: 16px; /* Adjust font size */
        padding: 15px 20px; /* Adjust padding */
    }

    .nav > li > a:hover, .nav > li > a:focus {
        background-color: #e7e7e7; /* Slightly darker gray background on hover/focus */
        color: #434343; /* Darker gray text color on hover/focus */
    }

    /* Style for the active or current menu item */
    .nav .active > a, .nav .active > a:hover, .nav .active > a:focus {
        background-color: #e7e7e7; /* Slightly darker gray background for active item */
        color: #5e5e5e; /* Dark gray text color for active item */
    }

</style>
