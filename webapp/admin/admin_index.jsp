    <%@page import="com.sikiedu.dao.GoodsDao"%>
    <%@ page import="com.sikiedu.dao.OrderDao, com.sikiedu.dao.UserDao" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!DOCTYPE html>
    <html>
        <head>
            <title>Admin Management</title>
            <link rel="stylesheet" href="css/bootstrap.css"/> 
            <!<!-- CSS of container display data -->
            <style>
                .dashboard-stat {
    background: #f9f9f9; /* Lighter background */
    border: 1px solid #eaeaea; /* Lighter border */
    padding: 20px;
    margin: 10px 0;
    border-radius: 6px; /* Slightly rounded corners */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05); /* Softer shadow */
    transition: all 0.3s ease; /* Smooth transition for hover effect */
}

.dashboard-stat:hover {
    transform: translateY(-5px); /* Slight lift effect on hover */
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1); /* Increased shadow on hover */
}

.count {
    display: block;
    font-size: 2.5em; /* Larger font size */
    font-weight: bold;
    margin-bottom: 5px;
    color: #333; /* Darker font color for better contrast */
}

.dashboard-stat p {
    margin: 0;
    font-size: 1.2em;
    color: #666; /* Slightly darker text color */
}
.container-fluid {
    padding: 30px; /* More padding around the content */
}

/* Additional styles for the container and alert */


.alert-success {
    background-color: #dff0d8; /* Standard success color */
    border-color: #d6e9c6; /* Matching border color */
    color: #3c763d; /* Text color that stands out */
    padding: 15px; /* Padding inside the alert box */
    border-radius: 4px; /* Rounded corners for the alert box */
    margin-bottom: 20px; /* Space below the alert box */
}

            </style>
        </head>
        <body>
            <!--Create new object to display data from OrderDAO, UserDAO, GoodsDAO    -->
            <%
                OrderDao orderDao = new OrderDao();
                UserDao userDao = new UserDao();
                GoodsDao goodsDao = new GoodsDao();

                int totalUsers = userDao.getTotalUserCount();
                double totalSales = orderDao.getTotalSalesAmount();
                int totalGoods = goodsDao.getTotalGoodsCount();

                request.setAttribute("totalUsers", totalUsers);
                request.setAttribute("totalSales", totalSales);
                request.setAttribute("totalGoods", totalGoods);
            %>
            <!--Create new object to display data from   -->
            <div class="container-fluid">
                <jsp:include page="/admin/header.jsp"></jsp:include>

                    <br><br>

                    <div class="alert alert-success" role="alert">Congratulations! Login Successful</div>

                    <div class="dashboard">
                        <div class="row text-center">
                            <div class="col-md-4">
                                <div class="dashboard-stat">
                                    <span class="count">${totalGoods}</span>
                                <p>Total Cake In Shop</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="dashboard-stat">
                                <span class="count">${totalUsers}</span>
                                <p>Total Users</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="dashboard-stat">
                                <span class="count">$${totalSales}</span>
                                <p>Total Sales</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <br><br>
        </body>
    </html>
