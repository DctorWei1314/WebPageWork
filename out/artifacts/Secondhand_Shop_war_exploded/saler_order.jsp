<%--
  Created by IntelliJ IDEA.
  User: 无索魏
  Date: 2020/6/15
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.web.service.orderService" %>
<%@ page import="com.web.entity.User" %>
<%@ page import="com.web.entity.OrderSheet" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>订单管理</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    <script src="js/main.js"></script>
    <script>
        $(function () {
                $(".agree").click(
                    function () {
                        $("#"+$(this)[0].parentNode.parentNode.id).remove();
                        $.ajax({
                            url:"SalerOrderServlet",
                            type:"POST",
                            data:"orderID=" +$(this)[0].parentNode.parentNode.id+"&status=2",
                            success: function (result) {
                                if (result!=null){
                                    alert(result);
                                }
                            },
                            error: function () {
                                alert("失败！");
                            }
                        });
                    }
                );
            $(".reject").click(
                function () {
                    $("#"+$(this)[0].parentNode.parentNode.id).remove();
                    $.ajax({
                        url:"SalerOrderServlet",
                        type:"POST",
                        data:"orderID=" +$(this)[0].parentNode.parentNode.id+"&status=3",
                        success: function (result) {
                            if (result!=null){
                                alert(result);
                            }
                        },
                        error: function () {
                            alert("失败！");
                        }
                    });
                }
            );
            }
        )
    </script>
</head>
<body>
<%@include file="common/header_saler.jsp"%>
<%! boolean flag = false;%>
<% String status = request.getParameter("status");
if(status == null || status == "1")
    flag = true;
User user = (User)session.getAttribute("user");
%>
<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">


            <div class="col-md-12">
                <div class="product-content-right">
                    <div class="woocommerce">
                        <table cellspacing="0" class="shop_table cart">
                            <thead>
                            <tr>
                                <th class="product-ID"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">订单编号</font></font></th>
                                <th class="product-thumbnail"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">产品图片</font></font></th>
                                <th class="product-name"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">产品名称</font></font></th>
                                <th class="product-price"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">价钱</font></font></th>
                                <th class="product-quantity"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">数量</font></font></th>
                                <th class="product-time"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">订购时间</font></font></th>
                                <th class="product-status"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">订单状态</font></font></th>
                                <th class="product-button"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">同意订单</font></font></th>
                                <th class="product-button"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">残忍拒绝</font></font></th>
                            </tr>
                            </thead>
                            <tbody>
                            <!--tip自动添加订单-->
                            <%
                                if(flag == true){
                                    List<OrderSheet> list = orderService.selectOrderListByOrderIDSaleID(user.getUserID());
                                }
                                else{

                                }
                                while (){
                                    orderService.selectOrderListByOrderIDSaleID(user.getUserID());
                                }
                                out.print("                            <tr class=\"cart_item\" id=\"2222\">\n" +
                                        "                                <td class=\"product-ID\">\n" +
                                        "                                    <span class=\"amount\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">2222</font></font></span>\n" +
                                        "                                </td>\n" +
                                        "                                <td class=\"product-thumbnail\">\n" +
                                        "                                    <a href=\"single-product.html\"><img width=\"145\" height=\"145\" alt=\"商品图片\" class=\"shop_picture\" src=\"\"></a>\n" +
                                        "                                </td>\n" +
                                        "\n" +
                                        "                                <td class=\"product-name\">\n" +
                                        "                                    <span class=\"amount\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">22</font></font></span>\n" +
                                        "                                </td>\n" +
                                        "\n" +
                                        "                                <td class=\"product-price\">\n" +
                                        "                                    <span class=\"amount\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">￥22</font></font></span>\n" +
                                        "                                </td>\n" +
                                        "\n" +
                                        "                                <td class=\"product-quantity\">\n" +
                                        "                                    <span class=\"quantity\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">22</font></font></span>\n" +
                                        "                                </td>\n" +
                                        "\n" +
                                        "                                <td class=\"product-time\">\n" +
                                        "                                    <span class=\"time\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">22</font></font></span>\n" +
                                        "                                </td>\n" +
                                        "\n" +
                                        "                                <td class=\"product-status\">\n" +
                                        "                                    <span class=\"status\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">22</font></font></span>\n" +
                                        "                                </td>\n" +
                                        "\n" +
                                        "                                <td class=\"product-status\">\n" +
                                        "                                    <button class=\"agree\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">同意订单</font></font></button>\n" +
                                        "                                </td>\n" +
                                        "                                <td class=\"product-status\">\n" +
                                        "                                    <button class=\"reject\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">残忍拒绝</font></font></button>\n" +
                                        "                                </td>\n" +
                                        "                            </tr>");
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="product-pagination text-center">
                    <nav>
                        <ul class="pagination">
                            <li>
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">«</span>
                                </a>
                            </li>
                            <!--tip根据商品数量来计算-->
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li>
                                <a href="#" aria-label="Next">
                                    <span aria-hidden="true">»</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="common/footer_saler.jsp"%>
</body>
</html>
