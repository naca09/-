<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Sweet Cake</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
        <link type="text/css" rel="stylesheet" href="css/style.css">
        <link type="text/css" rel="stylesheet" href="css/jquery.convform.css">
        <script type="text/javascript" src="js/jquery.convform.js"></script>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="layer/layer.js"></script>
        <script type="text/javascript" src="js/cart.js"></script>
        <script type="text/javascript" src="js/custom.js"></script>
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    </head>
    <body>
        <script src="https://kit.fontawesome.com/4219c0e8dc.js" crossorigin="anonymous"></script>
        <!-- header -->
        <jsp:include page="/header.jsp">
            <jsp:param value="1" name="flag"/>
        </jsp:include>


        <!--banner-->

        <div class="banner">
            <div class="container">
                <h2 class="hdng"><a href="${pageContext.request.contextPath }/goods_detail?id=${scroll.id }">${scroll.name }</a><span></span></h2>
                <p>Today's featured recommendations</p>
                <a class="banner_a" href="javascript:;" onclick="buy(${scroll.id })">Buy Now!</a>
                <div class="banner-text">		
                    <a href="${pageContext.request.contextPath }/goods_detail?id=${scroll.id }">
                        <img src="${pageContext.request.contextPath }${scroll.cover}" alt="${scroll.name }" width="350" height="350">
                    </a>	
                </div>
            </div>
        </div>

        <!--//banner-->

        <div class="subscribe2"></div>

        <!--gallery-->
        <div class="gallery">
            <div class="container">
                <div class="alert alert-danger">Hot Recommend</div>
                <div class="gallery-grids">

                    <c:forEach items="${hotList }" var="g">
                        <div class="col-md-4 gallery-grid glry-two">
                            <a href="${pageContext.request.contextPath }/goods_detail?id=${g.id}">
                                <img src="${pageContext.request.contextPath }${g.cover}" class="img-responsive" alt="${g.name}" width="350" height="350"/>
                            </a>
                            <div class="gallery-info galrr-info-two">
                                <p>
                                    <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                    <a href="${pageContext.request.contextPath }/goods_detail?id=${g.id}">Check the details</a>
                                </p>
                                <a class="shop" href="javascript:;" onclick="buy(${g.id})">Buy Now!</a>
                                <div class="clearfix"> </div>
                            </div>
                            <div class="galy-info">
                                <p>${g.typeName } > ${g.name }</p>
                                <div class="galry">
                                    <div class="prices">
                                        <h5 class="item_price">$ ${g.price }</h5>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>


                </div>

                <div class="clearfix"></div>
                <div class="alert alert-info">New Product</div>
                <div class="gallery-grids">	

                    <c:forEach items="${newList }" var="g">
                        <div class="col-md-3 gallery-grid ">
                            <a href="${pageContext.request.contextPath }/goods_detail?id=${g.id}">
                                <img src="${pageContext.request.contextPath }${g.cover}" class="img-responsive" alt="${g.name }"/>
                            </a>
                            <div class="gallery-info">
                                <p>
                                    <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> 
                                    <a href="${pageContext.request.contextPath }/goods_detail?id=${g.id}">Check the details</a>
                                </p>
                                <a class="shop" href="javascript:;" onclick="buy(${g.id})">Buy Now!</a>
                                <div class="clearfix"> </div>
                            </div>
                            <div class="galy-info">
                                <p>${g.typeName } > ${g.name }</p>
                                <div class="galry">
                                    <div class="prices">
                                        <h5 class="item_price">$ ${g.price }</h5>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>





                </div>	
            </div>
        </div>
        <!--//gallery-->

        <!--subscribe-->
        <div class="subscribe"></div>
        <!--//subscribe-->
        <!-- Title ICON -->
        <link rel="icon" href="iconmonstr-speech-bubble-1.svg">


        <!-- Font Awesome -->
        <script src="js/all.js"></script>

        <!-- External CSS -->
        <link rel="stylesheet" href="css/index.css">

        <link rel="stylesheet" href="css/jquery.convform.css">
        <!-- Chat-icon -->
        <div class="chat-icon">

            <i class="fa fa-comments fa-3x text-warning"></i>

        </div>
        <!-- End of Chat-icon -->

        <!-- Chat-box -->
        <div class="chat-box">

            <div class="conv-form-wrapper">

                <form action="" method="GET" class="hidden">

                    <select name="test" data-conv-question="Hello,What are you find?" >

                        <option value="best">Best Seller</option>

                        <option value="noel">New</option>     

                        <option value="contact">Information</option>   
                    </select>

                    <div data-conv-fork="test">

                        <div data-conv-case="best">
                            <input type="text" name="best" data-conv-question="Here is list best seller:<br>-Tiramisu<br>-Donut<br>-Chrismas Candy<br>-Crostini">

                        </div>

                        <div data-conv-case="noel">
                            <input type="text" name="noel" data-conv-question="New cake for Noel:<br>-White Snow Cake<br>-Xmas Cherry Cake<br>-Christmas Log Cake<br> ">
                        </div>

                        <div data-conv-case="contact">
                            <input type="text" name="tool name" data-conv-question="You can find us:<br>Address: 10 FPT University, Sweet City.<br>Phone: 0945766777 ">
                        </div>

                    </div>



                </form>

            </div>    

        </div>
        <!-- End of Chat-box -->

        <!-- jQuery -->
        <script src="js/jquery-3.5.1.min.js"></script>

        <!-- convform jQuery -->
        <script src="js/jquery.convform.js"></script>

        <!-- External JS -->
        <script src="js/main.js"></script>

        <!-- footer -->
        <jsp:include page="/footer.jsp"></jsp:include>



    </body>
</html>