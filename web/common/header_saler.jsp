<%--
  Created by IntelliJ IDEA.
  User: 无索魏
  Date: 2020/6/15
  Time: 14:22
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
                            <li><a href="#"><i class="fa fa-user"></i> 注册</a></li><!--tip登陆后为账户叶面-->
                            <li><a href="#"><i class="fa fa-list-ul"></i> 订单管理</a></li><!--tip登陆后为账户叶面-->
                            <li><a href="#"><i class="fa fa-credit-card"></i> 商品上架</a></li><!--tip登陆后为账户叶面-->
                            <li><a href="#"><i class="fa fa-user"></i> 个人首页</a></li><!--tip登陆后为账户叶面-->
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
                <div class="col-sm-3">
                    <div class="logo">
                        <h1>NB<span>商城</span></h1>
                    </div>
                </div>
                <div class=" search col-sm-6">
                    <form class="navbar-form navbar-left" role="search"><!--提交搜索表单-->
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="搜索商品名称">
                        </div>
                        <button type="submit" class="btn btn-default">搜索</button>
                    </form>
                </div>
                <div class="col-sm-3">
                    <div class="shopping-item">
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End site branding area -->
</div>
