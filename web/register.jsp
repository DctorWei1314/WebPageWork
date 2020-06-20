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
    <script src="js/md5.js"></script>
    <script src="js/main.js"></script>
    <script src="js/buyer.js"></script>
</head>
<body>
<%@include file="common/header.jsp"%>
<div class="register">
    <form id="register-form"  class="register-table" action="BuyerRegister" method="post" >
        <div class="  register-top-grid">
            <h3><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">个人信息</font></font></h3>
            <div class="mation">
                <span>电子邮件地址</span>
                <input type="text" name="email" required pattern="^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$">
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="  register-bottom-grid">
            <h3><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">登录信息</font></font></h3>
            <div class="mation">
                <span>密码</span>
                <input type="password"  id="p1" required>
                <span>确认密码</span>
                <span class="info" style="display: none">两次输入的密码不一致</span>
                <input type="password" id="p2" required>
                <input type="hidden" name="password" id="realp">
            </div>
            <div class="register-but">
                <input type="submit" value="注册买家" onclick="settype('buyer')">
                <input type="submit" value="注册卖家" onclick="settype('saler')">
                <input type="hidden"  id="selectedtype" name="select" value="">
                <script>
                    function settype(type) {
                        document.getElementById("selectedtype").value=type;
                    }
                </script>
            </div>
        </div>
    </form>
    <div class="clearfix"> </div>
</div>
<%@include file="common/footer.jsp"%>
</body>
</html>
