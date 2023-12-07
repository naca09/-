<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="com.sikiedu.dao.GoodsDao"%>
<%@ page import="com.sikiedu.dao.OrderDao, com.sikiedu.dao.UserDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://kit.fontawesome.com/4219c0e8dc.js" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Management</title>
        <link rel="stylesheet" href="css/bootstrap.css"/> 
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <!<!-- CSS của cả bài -->
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
            .chart-container {
                width: 80%;
                height: 80%;
                margin: auto;
                padding: 20px;
                box-shadow: 0px 0px 8px 2px rgba(0,0,0,0.1);
                background-color: #ffffff;
                border-radius: 5px;
            }

            .chart-canvas {
                width: 100% !important;
                height: auto !important;
            }

            .scrollBtn {
                position: fixed; /* Fixed position relative to the viewport */
                right: 10px; /* Distance from the right edge of the viewport */
                z-index: 1000; /* Ensure the button is above other elements */
                cursor: pointer; /* Change cursor on hover */
                /* Additional styling for the buttons */
            }

            /* Position the 'Go to top' button */
            #topBtn {
                background-color: #FD9F3E;
                color: white;
                cursor: pointer;
                padding: 15px;
                border-radius: 10px;
                border: none;
                outline: none;
                top: 50%; /* Align vertically at the center */
                transform: translateY(-60px); /* Adjust position to avoid overlapping with the bottom button */
            }

            /* Position the 'Go to bottom' button */
            #bottomBtn {
                background-color: #FD9F3E;
                color: white;
                cursor: pointer;
                padding: 15px;
                border-radius: 10px;
                border: none;
                outline: none;
                top: 50%; /* Align vertically at the center */
                transform: translateY(0px); /* No adjustment needed */
                border: none;
                outline: none;
            }



        </style>
    </head>
    <body>
        <!-- 2 button lên xuống -->
        <button onclick="topFunction()" id="topBtn" class="scrollBtn" title="Go to top"><i class="fa-solid fa-arrow-up"></i></button>
        <button onclick="bottomFunction()" id="bottomBtn" class="scrollBtn" title="Go to bottom"><i class="fa-solid fa-arrow-down"></i></button>
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

        <%
            // Gọi các phương thức DAO để lấy dữ liệu cho biểu đồ
            Map<String, Integer> topUsers = userDao.getTopUsers();
            Map<String, Integer> topGoods = goodsDao.getTopGoods();

            request.setAttribute("topUsers", topUsers);
            request.setAttribute("topGoods", topGoods);
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
        <br>
        <div class="container-fluid">
            <!-- Hiển thị Chart -->
            <div class="row">
                <div class="col-md-6" style="text-align: center;">
                    <div class="dashboard-stat">                             
                        <p><h4>Top Buyer</h4></p>
                    </div>
                    <div class="chart-container">
                        <canvas id="userChart" class="chart-canvas"></canvas>
                    </div>
                </div>
                <div class="col-md-6" style="text-align: center;">
                    <div class="dashboard-stat">                            
                        <p><h4>Top Cake Sell</h4> </p>
                    </div>
                    <div class="chart-container">
                        <canvas id="goodsChart" class="chart-canvas"></canvas>
                    </div>
                </div>
            </div>
        </div>
            <script>
<!-- JS để hiển thị Chart -->
var topUsers = <%= new Gson().toJson(request.getAttribute("topUsers"))%>;
var topGoods = <%= new Gson().toJson(request.getAttribute("topGoods"))%>;

// Xác định mảng màu
var colors = [
'#FF6384', '#36A2EB', '#FFCE56', '#cc65fe', '#ff6384',
'#36a2eb', '#ffce56', '#ff9f40', '#ffcd56', '#4bc0c0'
];

// Biểu đồ Top Users
        var userLabels = Object.keys(topUsers);
        var userData = Object.values(topUsers);
        
        var userChart = new Chart(document.getElementById('userChart'), {
                    type: 'pie',
                    data: {
                    labels: userLabels,
                            datasets: [{
                            data: userData,
                                    backgroundColor: colors
                            }]
                    }
                });
                
            // Biểu đồ Top Go            ods
                    var goodsLabels = Object.keys(top            Goods);
                    var goodsData = Object.values(topGoods);
             
                    var goodsChart = new Chart(document.getElementById('goodsChart'), {
                    type: 'pie',
                    data: {
                    labels: goodsLabels,
                            datasets: [{
                            data: goodsData,
                                    backgroundColor: colors
                            }]
              }
});

                    window.onscroll = function () {
                    scrollFunction()
                    };
            
                    function scrollFunction() {
                    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            document.getElementById("topBtn").style.display = "block";
            document.getElementById("bottomBtn").style.display = "block";
            } else {
            document.getElementById("topBtn").style.display = "none";
            document.getElementById("bottomBtn").style.display = "none";
            }
                    }
                
                    // Khi người dùng nhấp vào nút, cuộn lên đầu tài liệu
                    function topFunction() {
    document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
                    }
                
                    // Khi người dùng nhấp vào nút, cuộn xuống cuối tài liệu
                    function bottomFunction() {
                    window.scrollTo(0, document.body.scrollHeight);
                    }
                    //<script>
                function confirmDelete(url) {
                    if (confirm("Are you sure you want to delete?")) {
            window.location.href = url; // Redirect to the delete URL
      }
            }
</script>
    </body>
</html>
