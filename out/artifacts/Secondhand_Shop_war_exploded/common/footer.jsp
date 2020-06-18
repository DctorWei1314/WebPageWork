<%@ page import="com.web.entity.User" %>
<%@ page import="com.web.util.Constant" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: administrator-PC
  Date: 2020/6/11
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--通用脚部-->
<div class="footer-top-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="footer-about-us">
                    <h2>NB<span>商城</span></h2>
                    <p>NB商城是由最NB的网页小组创建的网站。NB网是深受欢迎的网购零售平台，拥有近5的注册用户数，每天有超过6的固定访客，同时
                        每天的在线商品数已经超过了8件，平均每年售出4.8件商品</p>
                    <div class="footer-social">
                        <a href="http://wpa.qq.com/msgrd?v=3&uin=&site=qq&menu=yes" target="_blank"><i
                                class="fa fa-qq"></i></a>
                        <a href="https://wx.qq.com/" target="_blank"><i class="fa fa-weixin"></i></a>
                        <a href="https://weibo.com/" target="_blank"><i class="fa fa-weibo"></i></a>
                    </div>
                    <img src="imgs/Qrcode.png" />
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="footer-menu">
                    <h2 class="footer-wid-title">用户导航 </h2>
                    <ul>
                        <%
                            if (user == null) {
                        %>
                        <li><a href=<%=application.getContextPath()%>/login.jsp>登录</a></li><!--tip登陆后为账户叶面-->
                        <li><a href=<%=application.getContextPath()%>/register.jsp>注册</a></li><!--tip登陆后为账户叶面-->
                        <%
                        } else if(user.getType()==Constant.MessageType.BUYER){
                        %>
                        <li><a href=<%=application.getContextPath()%>/user/account.jsp>我的账户</a></li><!--tip登陆后为账户叶面-->
                        <li><a href=<%=application.getContextPath()%>/user/order.jsp>订单历史</a></li><!--tip登陆后为账户叶面-->
                        <li><a href=<%=application.getContextPath()%>/user/cart.jsp>购物车</a></li><!--tip登陆后为账户叶面-->
                        <li><a href=<%=application.getContextPath()%>/user/checkout.jsp>结账</a></li>
                        <%
                            }
                            else if(user.getType()==Constant.MessageType.SELLER){

                        %>
                        <li><a href=<%=application.getContextPath()%>/saler_account.jsp><i class="fa fa-list-ul"></i> 我的账户</a></li><!--tip登陆后为账户叶面-->
                        <li><a href=<%=application.getContextPath()%>/saler_order.jsp><i class="fa fa-list-ul"></i> 订单管理</a></li><!--tip登陆后为账户叶面-->
                        <li><a href=<%=application.getContextPath()%>/product_upload.jsp><i class="fa fa-credit-card"></i> 商品上架</a></li><!--tip登陆后为账户叶面-->
                        <li><a href=<%=application.getContextPath()%>/saler.jsp><i class="fa fa-user"></i> 个人首页</a></li><!--tip登陆后为账户叶面-->
                        <%
                            }
                            else{
                            }
                        %>
                    </ul>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="footer-menu">
                    <h2 class="footer-wid-title">分类目录</h2>
                    <%
                        List<String> b_list = (List<String>) application.getAttribute(Constant.T_LIST);
                        if (b_list != null) {
                            b_list.add("全部商品");
                            int t = 0;
                            for (String tag : b_list) {
                                if (t % 6 == 0) {
                    %>
                    <ul>
                        <%
                            }
                        %>
                        <li>
                            <a onclick="location='<%=application.getContextPath()%>/BuyerQuery?type=label&condition=<%=tag%>';return false"
                               href="#"><%=tag%>
                            </a></li>
                        <%
                            if (t % 6 == 0) {
                        %>
                    </ul>
                    <%
                                }
                            }
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</div>
<!--脚部的脚部-->
<div class="footer-bottom-area">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="copyright">
                    <p>版权所有 &copy; 2020 NB小组成员.<a target="_blank" href="#">localhost:8080</a></p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="footer-card-icon">
                    <i class="fa fa-cc-discover"></i>
                    <i class="fa fa-cc-mastercard"></i>
                    <i class="fa fa-cc-paypal"></i>
                    <i class="fa fa-cc-visa"></i>
                </div>
            </div>
        </div>
    </div>
</div>
