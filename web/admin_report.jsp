<%@ page import="com.web.entity.Report" %>
<%@ page import="java.util.List" %>
<%@ page import="com.web.service.reportService" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: h'm'l
  Date: 2020/6/16
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>投诉处理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/style4.css" rel="stylesheet" type="text/css" media="all" />
    <script src="js/jquery1.min.js"></script>
    <script type="text/javascript" src="js/jquery.lightbox.js"></script>
    <link rel="stylesheet" type="text/css" href="css/lightbox.css" media="screen" />
    <script type="text/javascript">
        $(function() {
            $('.gallery a').lightBox();
        });
    </script>
    <style type="text/css">
        #customers
        {
            font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
            width:95%;
            border-collapse:collapse;
            margin: auto;
        }

        #customers td, #customers th
        {
            font-size:1em;
            border:1px solid #98bf21;
            padding:3px 7px 2px 7px;
        }

        #customers th
        {
            font-size:1.1em;
            text-align:left;
            padding-top:5px;
            padding-bottom:4px;
            background-color:#245269;
            color:#ffffff;
        }

        #customers tr.alt td
        {
            color:#000000;
            background-color:#EAF2D3;
        }
    </style>
</head>
<body>
<%
    List<Report> reportList = reportService.selectAllReport();
%>
<div class="wrap">
    <div class="pages-top">
        <div class="logo">
            <a href="admin_center.jsp">最NB商城<br/>管理员中心</a>
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
                <li><a href="admin_tag.jsp">标签</a>
                </li>
                <li class="active"><a href="admin_report.jsp">投诉</a>
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
    <div id="title">
        <p style="font-size: x-large;font-family: '黑体';">查看用户投诉</p>
        <p style="font-size: medium;font-style: italic;font-family: '微软雅黑 Light';">忠言逆耳利于行</p>
    </div>
    <div style="margin-top: 20px; text-align: center">
        <table id="customers">
            <tr>
                <th style="font-weight: bolder">投诉用户&nbsp;</th>
                <th style="font-weight: bolder">被投诉商家&nbsp;</th>
                <th style="font-weight: bolder">投诉内容&nbsp;</th>
                <th style="font-weight: bolder">投诉时间&nbsp;</th>
            </tr>
            <%
                if(reportList.size() > 0) {
                    for(Report report : reportList) {
            %>
            <tr>
                <td><%=report.getReportUserID()%></td>
                <td ><a onclick="location='admin_title.jsp?salerID=<%=report.getReportedShopID()%>';return false" href="#" >
                    <%=report.getReportedShopID()%>
                </a></td>
                <td><%=report.getDescription()%></td>
                <td><%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(report.getReportTime())%></td>
            </tr>
            <%
                    }
                }
            %>
        </table>
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
