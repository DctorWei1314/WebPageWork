<%@ page import="com.web.entity.User" %>
<%@ page import="com.web.util.Constant" %>
<%@ page import="com.web.entity.ShopCart" %><%--
  Created by IntelliJ IDEA.
  User: administrator-PC
  Date: 2020/6/11
  Time: 22:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%ShopCart shopCart=(ShopCart) pageContext.getAttribute(Constant.SHOP_CART);%>
<div class="header-area">
    <div class="container">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="user-menu">
                        <ul>
                            <%
                                User user=(User) session.getAttribute(Constant.USER_SESSION);
                                //User user=new User();
                                if(user==null){
                            %>
                            <li><a href=<%=application.getContextPath()%>/login.jsp><i class="fa fa-user"></i> 登录</a></li>
                            <li><a href=<%=application.getContextPath()%>/register.jsp><i class="fa fa-user"></i> 注册</a></li>
                            <%
                                }
                            else if(user.getType()==Constant.MessageType.BUYER)
                                {
                                %>
                            <li><a href=<%=application.getContextPath()%>/user/account.jsp><img id="head" src=<%=application.getContextPath()+user.getImgFilePath()%> ></img> 我的账户</a></li>
                            <li><a href=<%=application.getContextPath()%>/user/order.jsp><i class="fa fa-list-ul"></i> 订单历史</a></li>
                            <li><a href=<%=application.getContextPath()%>/user/cart.jsp><i class="fa fa-shopping-cart"></i> 购物车</a></li>
                            <li><a href=<%=application.getContextPath()%>/user/checkout.jsp><i class="fa fa-credit-card"></i> 结算</a></li>
                            <%
                                }
                            else if(user.getType()==Constant.MessageType.SELLER)
                                {
                            %>
                            <li><a href=<%=application.getContextPath()%>/saler_account.jsp><img id="salerhead" src=<%=application.getContextPath()+user.getImgFilePath()%> ></img> 我的账户</a></li><!--tip登陆后为账户叶面-->
                            <li><a href=<%=application.getContextPath()%>/saler_order.jsp><i class="fa fa-list-ul"></i> 订单管理</a></li><!--tip登陆后为账户叶面-->
                            <li><a href=<%=application.getContextPath()%>/product_upload.jsp><i class="fa fa-credit-card"></i> 商品上架</a></li><!--tip登陆后为账户叶面-->
                            <li><a href=<%=application.getContextPath()%>/saler.jsp><i class="fa fa-user"></i> 个人首页</a></li><!--tip登陆后为账户叶面-->
                            <%
                                }
                            else{

                                }
                            %>
                            <li><a href="#"><i class="fa fa-user"></i> 卖家中心</a></li><!--tip等待填充-->
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
                        <div class="navbar-form navbar-left" role="search" ><!--提交搜索表单-->
                            <div class="form-group">
                                <input type="text" class="form-control"  id="searchCondition" required>
                            </div>
                            <button type="submit" class="btn btn-default" id="product" onclick="queryl(this)">搜索产品</button>
                            <button type="submit" class="btn btn-default" id="sellerid" onclick="queryl(this)">搜索商家</button>
                        </div>
                </div>
                <%
                    if(user==null||user.getType()!=Constant.MessageType.SELLER){
                %>
                <div class="col-sm-3">
                    <div class="shopping-item">
                        <%
                            if(user!=null){
                        %>
                        <a href=<%=application.getContextPath()%>/user/account.jsp>购物车 - <span class="cart-amunt" id="totalprice">￥<%=shopCart.cartTotalPrice()%><!--tip session中的金额--></span> <i
                                class="fa fa-shopping-cart"></i> <span class="product-count" id="totalnum"><%=shopCart.getProducts().size()%>
                            <!--tip session中的数量--></span></a>
                        <%
                            }
                        %>
                    </div>
                </div>
                <%}
                %>
            </div>
        </div>
    </div> <!-- End site branding area -->
    <!--商城导航栏-->
    <div class="mainmenu-area">
        <div class="container">
            <div class="row">
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="javascript:QueryProduct(1,'ALL','ALL')" >商品</a></li><!--tip登陆后为账户叶面-->
                        <%
                            if(user!=null&&user.getType()!=Constant.MessageType.BUYER){
                        %>
                        <li><a onclick="location='<%=application.getContextPath()%>/user/account.jsp';return false" href="#" >购物车</a></li><!--tip登陆后为账户叶面-->
                        <li><a onclick="location='<%=application.getContextPath()%>/user/checkout.jsp>';return false" href="#" >结算</a></li><!--tip登陆后为账户叶面-->
                        <%
                            }
                        %>
                    </ul>
                </div>
            </div>
        </div>
    </div> <!-- End mainmenu area -->
</div>
