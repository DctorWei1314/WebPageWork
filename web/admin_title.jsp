<%--
  Created by IntelliJ IDEA.
  User: 无索魏
  Date: 2020/6/17
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>店家处理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/style3.css" rel="stylesheet" type="text/css" media="all" />
    <script src="js/jquery1.min.js"></script>
    <script type="text/javascript" src="js/go.js"></script>
    <script type="text/javascript" src="js/jquery.lightbox.js"></script>
    <link rel="stylesheet" type="text/css" href="css/lightbox.css" media="screen" />
    <script type="text/javascript">
        $(function() {
            $('.gallery a').lightBox();
        });
    </script>
</head>
<body>
<div class="wrap">
    <div class="pages-top">
        <div class="logo">
            <a href="index.html">最NB商城<br/>管理员中心</a>
        </div>
        <div class="photo">
            <img src="images/pig.png" alt=""/>
        </div>
        <div class="h_menu4"><!-- start h_menu4 -->
            <a class="toggleMenu" href="#">Menu</a>
            <ul class="nav">
                <li><a href="admin_center.jsp">主页</a></li>
                <li><a href="admin_dis.jsp">折扣</a>
                </li>
                <li class="active"><a href="admin_tag.jsp">标签</a>
                </li>
                <li><a href="admin_report.jsp">投诉</a>
                </li>
                <li><a href="#">处理</a>
                </li>
            </ul>
            <script type="text/javascript" src="js/nav.js"></script>
        </div><!-- end h_menu4 -->
        <div class="clear"></div>
    </div><!-- end header_main4 -->
</div>

<div class="main">
    <br/>
    <div id="current">
        <p><b>店铺：</b></p><br/>
        <div  style="height: 320px; overflow-x: hidden; overflow-y: auto; border: 0.5px dashed rgba(156,156,156,1.00); padding-top: 5px;">
        <%=request.getParameter("salerID")%>
        </div>
    </div>
    <div id="future">
        <p>赋予头衔</p><br/>
        <input id="title" type="text" style="height: 40px; width: 310px; font-size: x-large;"><br/>
        <div class="btn">
            <a href="AddTitleServlet?salerID=<%=request.getParameter("salerID")%>&title=" class="da-link" style="text-decoration: none;" onclick="addTitle(this)">确认</a>
        </div>
    </div>
</div>

<div class="footer">
    <div class="wrap">
        <div class="footer-grid footer-grid1">
            <div class="f-logo" style="color: rgba(255,255,255,1)">
                最NB商城
            </div>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最NB商城是由最NB小组创建的网站，是深受大众欢迎的二手交易网购平台，拥有近5的注册用户数和每天超过6的固定访客。NB网每天的在线商品数已经超过了8件，平均每年能售出4.8件商品。</p>
        </div>
        <div class="footer-grid footer-grid2">
            <h4>联系我们</h4>
            <ul>
                <li><i class="pin"> </i>
                    <div class="extra-wrap">
                        <p>吉林大学</p>
                    </div>
                </li>
                <li><i class="phone"> </i>
                    <div class="extra-wrap">
                        <p>16688207028</p>
                    </div>
                </li>
                <li><i class="mail"> </i>
                    <div class="extra-wrap1">
                        <p>1577190811@qq.com</p>
                    </div>
                </li>
            </ul>
        </div>
        <div class="clear"> </div>
    </div>
</div>
<div class="footer-bottom">
    <div class="wrap">
        <div class="copy">
            <p>Copyright &copy; 2020.最NB网页设计小组</p>
        </div>
        <div class="social">
            <ul>
                <li class="facebook"><a href="#"><span> </span></a></li>
                <li class="linkedin"><a href="#"><span> </span></a></li>
                <li class="twitter"><a href="#"><span> </span></a></li>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>
