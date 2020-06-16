<%--
  Created by IntelliJ IDEA.
  User: 无索魏
  Date: 2020/6/15
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商家账户信息</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    <script src="js/main.js"></script>
</head>
<body>
<%@include file="common/header_saler.jsp"%>
<div class="sns-nf">
    <form id="baseInfoForm" name="baseInfoForm" method="post" class="infoForm">
        <input name="_tb_token_" type="hidden" value="3bf0e5e737b13">
        <input type="hidden" name="action" value="user/baseInfoSetAction">
        <input type="hidden" name="event_submit_do_save_or_update_base_info_setting" value="1">
        <input type="hidden" name="redirectURL" value="">
        <input type="hidden" id="J_occupation_view" value="">
        <input type="hidden" id="J_home_url" value="$itaobaoServer.setTarget('json/school_json.htm')">
        <div id="main-profile" class="parts">
            <p>
                <label>当前头像：</label>
                <span class="pf-avatar-box">
                                <a class="pf-avatar">
                                    <img src="imgs/product-2.jpg">
                                                                    </a>
                                <a href="//i.taobao.com/user/headset.htm" class="pf-edit-avatar" style="display: none;">编辑头像</a>
                            </span>
            </p>
            <p>
                <label>ID:</label>
                <label id="name">开心快乐每一天</label>
            </p>
            <p>
                <label>商家描述：</label>
                <input id="J_realname-mask" class="f-txt" type="text" value="" maxlength="6">
                <input id="J_realname" name="_fm.b._0.r" type="hidden" value="" maxlength="6">
            </p>
            <p>
                <label>商家地址：</label>
                <input  class="f-txt" type="text" value="" maxlength="6">
                <input  name="_fm.b._0.r" type="hidden" value="" maxlength="6">
            </p>
        </div>
        <div class="act skin-blue">
             <span class="btn n-btn">
                 <button type="submit" id="J_saveProfile">保存</button>
                 <div style="width:1px; height:1px; overflow:hidden; ">
                     <input type="submit">
                 </div>
             </span>
        </div>
    </form>
</div>
<%@include file="common/footer_saler.jsp"%>
</body>
</html>
