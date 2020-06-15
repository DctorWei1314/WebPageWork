<%--
  Created by IntelliJ IDEA.
  User: administrator-PC
  Date: 2020/6/13
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
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
<div class="account_grid">
    <div class=" login-right">
        <h3><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">已注册客户</font></font></h3>
        <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">如果您拥有我们的帐户，请登录。</font></font></p>
        <form>
            <div>
                <span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">账号</font></font><label><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">*</font></font></label></span>
                <input type="text">
            </div>
            <div>
                <span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">密码</font></font><label><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">*</font></font></label></span>
                <input type="text">
            </div>
            <font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><input type="submit" value="登录"></font></font>
        </form>
    </div>
    <div class=" login-left">
        <h3><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">新客户</font></font></h3>
        <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">通过在我们的商店中创建帐户，您将能够更快地完成结帐流程，存储多个送货地址，查看和跟踪帐户中的订单。</font></font></p>
        <a class="acount-btn" href="register.jsp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">创建一个帐户</font></font></a>
    </div>
    <div class="clearfix"> </div>
</div>
<%@include file="common/footer.jsp"%>

</body>
</html>
