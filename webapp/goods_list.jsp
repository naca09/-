<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>All Cake</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
        <link type="text/css" rel="stylesheet" href="css/style.css">
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/simpleCart.min.js"></script>
        <script type="text/javascript" src="layer/layer.js"></script>
        <script type="text/javascript" src="js/cart.js"></script>
    </head>
    <body>
        <!<!-- header -->
        <jsp:include page="/header.jsp">
            <jsp:param value="2" name="flag"/>
        </jsp:include>
        <!--products-->
        <div class="products">	 
            <div class="container">
                <h2><c:choose> <c:when test="${empty t }">All Series</c:when><c:otherwise>${t.name }</c:otherwise> </c:choose>  </h2>

                        <div class="col-md-12 product-model-sec">

                    <c:forEach items="${p.list }" var="g">
                        <div class="product-grid">
                            <a href="${pageContext.request.contextPath }/goods_detail?id=${g.id}">				
                                <div class="more-product"><span> </span></div>						
                                <div class="product-img b-link-stripe b-animate-go  thickbox">
                                    <img src="${pageContext.request.contextPath }${g.cover}" class="img-responsive" alt="${g.name }" width="240" height="240">
                                    <div class="b-wrapper">
                                        <h4 class="b-animate b-from-left  b-delay03">							
                                            <button>Check the details</button>
                                        </h4>
                                    </div>
                                </div>
                            </a>				
                            <div class="product-info simpleCart_shelfItem">
                                <div class="product-info-cust prt_name">
                                    <h4>${g.name }</h4>								
                                    <span class="item_price">$ ${g.price }</span>
                                    <input type="button" class="item_add items" value="Add to cart" onclick="buy(${g.id})">
                                    <div class="clearfix"> </div>
                                </div>												
                            </div>
                        </div>
                    </c:forEach>
                    <div class="clearfix"> </div>
                </div>
                <div>
                    <div style='text-align:center;'>
                        <a class='btn btn-info'   <c:if test="${p.pageNo==1 }">disabled</c:if>  <c:if test="${p.pageNo!=1 }">href="${pageContext.request.contextPath }/goods_list?pageNo=1&id=${id}"</c:if>>Front page</a>
                        <a class='btn btn-info' <c:if test="${p.pageNo==1 }">disabled</c:if> <c:if test="${p.pageNo!=1 }">href="${pageContext.request.contextPath }/goods_list?pageNo=${p.pageNo-1}&id=${id}"</c:if>>Previous page</a>
                        <h3 style='display:inline;'>[${p.pageNo }/${p.totalPage }]</h3>
                        <h3 style='display:inline;'>[${p.totalCount }]</h3>
                        <a class='btn btn-info' <c:if test="${p.totalPage==0 || p.pageNo==p.totalPage }">disabled</c:if> <c:if test="${p.pageNo!=p.totalPage }">href="${pageContext.request.contextPath }/goods_list?pageNo=${p.pageNo+1}&id=${id}"</c:if>>Next page</a>
                        <a class='btn btn-info' <c:if test="${p.totalPage==0 || p.pageNo==p.totalPage }">disabled</c:if> <c:if test="${p.pageNo!=p.totalPage }">href="${pageContext.request.contextPath }/goods_list?pageNo=${p.totalPage}&id=${id}"</c:if>>Last page</a>
                        <input type='text' class='form-control' style='display:inline;width:60px;' value=''/><a class='btn btn-info' href='javascript:void(0);' onclick='location.href = "${pageContext.request.contextPath }/goods_list?id=${id}&pageNo=" + (this.previousSibling.value)'>Go</a>
                    </div>
                </div>
            </div>
        </div>
        <!--//products-->
        <!<!-- buttonn to scroll Start -->
        <button onclick="topFunction()" id="topBtn" class="scrollBtn" title="Go to top"><i class="fa-solid fa-arrow-up"></i></button>
        <button onclick="bottomFunction()" id="bottomBtn" class="scrollBtn" title="Go to bottom"><i class="fa-solid fa-arrow-down"></i></button>
        <style>

        </style>
        <script>
            // Khi người dùng cuộn xuống 20px từ đầu tài liệu, hiển thị nút
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
        </script>
        <style>
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
        <script src="https://kit.fontawesome.com/4219c0e8dc.js" crossorigin="anonymous"></script>

        <!<!-- buttonn to scroll End -->
        <jsp:include page="/footer.jsp"></jsp:include>
    </body>
</html>
