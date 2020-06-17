<%--
  Created by IntelliJ IDEA.
  User: h'm'l
  Date: 2020/6/15
  Time: 18:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>主页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/style1.css" rel="stylesheet" type="text/css" media="all" />
    <link href="http://fonts.googleapis.com/css?family=Lato:400,300,600,700,800" rel="stylesheet" type="text/css">
    <script src="js/jquery1.min.js"></script>
    <!---strat-slider---->
    <link rel="stylesheet" type="text/css" href="css/slider.css" />
    <script type="text/javascript" src="js/modernizr.custom.28468.js"></script>
    <script type="text/javascript" src="js/jquery.cslider.js"></script>
    <script type="text/javascript">
        $(function() {

            $('#da-slider').cslider({
                autoplay	: true,
                bgincrement	: 450
            });

        });
    </script>
    <!---//strat-slider---->
    <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
    <link href="css/magnific-popup.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        a:link {
            text-decoration: none;
        }
        a:visited {
            text-decoration: none;
        }
        a:hover {
            text-decoration: none;
        }
        a:active {
            text-decoration: none;
        }
    </style>
    <script>
        $(document).ready(function() {
            $('.popup-with-zoom-anim').magnificPopup({
                type: 'inline',
                fixedContentPos: false,
                fixedBgPos: true,
                overflowY: 'auto',
                closeBtnInside: true,
                preloader: false,
                midClick: true,
                removalDelay: 300,
                mainClass: 'my-mfp-zoom-in'
            });
        });
    </script>

</head>
<body>
<div class="wrap">
    <div class="header-top">
        <div class="logo">
            <a href="admin_center.jsp" style="text-decoration: none;">最NB商城<br/>管理员中心</a>
        </div>
        <div class="h_menu4"><!-- start h_menu4 -->
            <a class="toggleMenu" href="#">Menu</a>
            <ul class="nav">
                <li class="active"><a href="admin_center.jsp">主页</a></li>
                <li><a href="admin_dis.jsp">折扣</a>
                </li>
                <li><a href="admin_tag.jsp">标签</a>
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
    <div class="slider">
        <!---start-da-slider----->
        <div id="da-slider" class="da-slider">
            <div class="da-slide">
                <h1>折扣设置</h1>
                <p>带慈善家还是带恶人？</p>
                <a href="admin_dis.jsp" class="da-link" style="text-decoration: none;">进入</a>
            </div>
            <div class="da-slide">
                <h1>标签设置</h1>
                <p>让我康康还能卖什么？</p>
                <a href="admin_tag.jsp" class="da-link" style="text-decoration: none;">进入</a>
            </div>
            <div class="da-slide">
                <h1>投诉处理</h1>
                <p>谁敢造次?</p>
                <a href="admin_report.jsp" class="da-link" style="text-decoration: none;">进入</a>
            </div>
            <div class="da-slide">
                <h1>店家处理</h1>
                <p>坏店就该有坏名</p>
                <a href="#" class="da-link" style="text-decoration: none;">进入</a>
            </div>
            <nav class="da-arrows">
                <span class="da-arrows-prev"></span>
                <span class="da-arrows-next"></span>
            </nav>
        </div>
        <!---//End-da-slider----->
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
