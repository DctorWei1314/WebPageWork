<%--
  Created by IntelliJ IDEA.
  User: administrator-PC
  Date: 2020/6/11
  Time: 22:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header-area">
    <div class="container">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="user-menu">
                        <ul>
                            <li><a href="#"><i class="fa fa-user"></i> 登录</a></li><!--tip登陆后为账户叶面-->
                            <li><a href="#"><i class="fa fa-list-ul"></i> 订单历史</a></li><!--tip登陆后为账户叶面-->
                            <li><a href="#"><i class="fa fa-shopping-cart"></i> 购物车</a></li><!--tip登陆后为账户叶面-->
                            <li><a href="#"><i class="fa fa-credit-card"></i> 结算</a></li><!--tip登陆后为账户叶面-->
                            <li><a href="#"><i class="fa fa-user"></i> 卖家中心</a></li><!--tip登陆后为账户叶面-->
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End header area -->
    <!--标志栏-->
    <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="logo">
                        <h1>NB<span>商城</span></h1>
                    </div>
                </div>
                <div class=" search col-sm-4">
                        <form class="navbar-form navbar-left" role="search"><!--提交搜索表单-->
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="搜索商品名称">
                            </div>
                            <button type="submit" class="btn btn-default">搜索</button>
                        </form>
                </div>
                <div class="col-sm-4">
                    <div class="shopping-item">
                        <a href="#">购物车 - <span class="cart-amunt">￥0<!--tip session中的金额--></span> <i
                                class="fa fa-shopping-cart"></i> <span class="product-count">0
                            <!--tip session中的数量--></span></a>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End site branding area -->
    <!--商城导航栏-->
    <div class="mainmenu-area">
        <div class="container">
            <div class="row">
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">商品</a></li><!--tip登陆后为账户叶面-->
                        <li><a href="#">购物车</a></li><!--tip登陆后为账户叶面-->
                        <li><a href="#">结算</a></li><!--tip登陆后为账户叶面-->
                    </ul>
                </div>
            </div>
        </div>
    </div> <!-- End mainmenu area -->
</div>
