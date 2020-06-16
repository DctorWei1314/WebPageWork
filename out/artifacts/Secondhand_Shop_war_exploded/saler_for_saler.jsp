<%--
  Created by IntelliJ IDEA.
  User: 无索魏
  Date: 2020/6/16
  Time: 0:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商店</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery.min.js"></script>
</head>
<body>
<%@include file="common/header_saler.jsp" %>
<% request.getParameter("saleID") %>
<div class="product-big-title-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="list-group list-group-horizontal align-self-center">
                    <a href="#" class="list-group-item">女装</a>
                    <a href="#" class="list-group-item">女装</a>
                    <a href="#" class="list-group-item">女装</a>
                    <!--tip动态获取标签-->
                </div>
            </div>
        </div>
    </div>
</div>
<div class="single-product-area">
    <!--下斜杠-->
    <div class="zigzag-bottom"></div>
    <div class="container">
        <!--主要内容-->
        <div class="row">
            <!--tip自动生成-->
            <div class="col-md-3 col-sm-6">
                <div class="single-shop-product">
                    <div class="product-upper">
                        <img src="imgs/product-2.jpg" alt="">
                    </div>
                    <h2><a href="">Apple new mac book 2015 March :P</a></h2>
                    <div class="product-carousel-price">
                        <ins>$899.00</ins> <del>$999.00</del>
                    </div>

                    <div class="product-option-shop">
                        <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">修改页面信息</a>
                    </div>
                </div>
            </div>
            <!--底部翻页-->
            <div class="row">
                <div class="col-md-12">
                    <div class="product-pagination text-center">
                        <nav>
                            <ul class="pagination">
                                <li>
                                    <a href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <!--tip根据商品数量来计算-->
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li>
                                    <a href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@include file="common/footer_saler.jsp" %>
</body>
</html>
