<%--
  Created by IntelliJ IDEA.
  User: administrator-PC
  Date: 2020/6/13
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册</title>
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
<%@include file="common/header.jsp"%>
<div class="register">
    <form class="register-table">
        <div class="  register-top-grid">
            <h3><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">个人信息</font></font></h3>
            <div class="mation">
                <span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">电子邮件地址</font></font><label><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">*</font></font></label></span>
                <input type="text">
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="  register-bottom-grid">
            <h3><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">登录信息</font></font></h3>
            <div class="mation">
                <span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">密码</font></font><label><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">*</font></font></label></span>
                <input type="text">
                <span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">确认密码</font></font><label><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">*</font></font></label></span>
                <input type="text">
            </div>
        </div>
    </form>
    <div class="clearfix"> </div>
    <div class="register-but">
        <form>
            <font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><input type="submit" value="注册"></font></font>
            <div class="clearfix"> </div>
        </form>
    </div>
</div>
<%@include file="common/footer.jsp"%>
</body>
</html>
