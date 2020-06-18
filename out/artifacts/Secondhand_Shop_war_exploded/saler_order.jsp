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
<%@ page import="com.web.service.productService" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
            $(".reject").click(
                function () {
                    $("#"+$(this)[0].parentNode.parentNode.id).remove();
                    $.ajax({
                        url:"SalerOrderServlet",
                        type:"POST",
                        data:"orderID=" +$(this)[0].parentNode.parentNode.id+"&status=4",
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
<%@include file="common/header.jsp"%>
<%! boolean flag = false;%>
<% String status = request.getParameter("status");
if(status == null || status == "1")
    flag = true;
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
                                <%
                                    if(flag){
                                %>
                                <th class="product-button"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">同意订单</font></font></th>
                                <th class="product-button"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">残忍拒绝</font></font></th>
                                <%
                                    }
                                %>
                            </tr>
                            </thead>
                            <tbody>
                            <!--tip自动添加订单-->
                            <%
                                List<OrderSheet> list = null;
                                if(flag == true){
                                    list = orderService.selectOrderListBySaleIDState(user.getUserID(),2);
                                }
                                else{
                                    list.addAll(orderService.selectOrderListBySaleIDState(user.getUserID(),3));
                                    list.addAll(orderService.selectOrderListBySaleIDState(user.getUserID(),4));
                                }
                                for(OrderSheet order:list){
                                    String icon = productService.selectProductByProductNameSaleID(order.getProductName(),order.getSaleID()).getMainImgFilePath();
                                    %>
                            <tr class="cart_item">
                                <td class="product-ID">
                                    <span class="amount"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">JD-101</font></font></span>
                                </td>
                                <td class="product-thumbnail">
                                    <a href="single-product.html"><img width="145" height="145" alt="商品图片" class="shop_picture" src="<%="D:/NB/"+icon%>"></a>
                                </td>

                                <td class="product-name">
                                    <span class="amount"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><%=order.getProductName()%></font></font></span>
                                </td>

                                <td class="product-price">
                                    <span class="amount"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">￥<%=order.getPrice()%></font></font></span>
                                </td>

                                <td class="product-quantity">
                                    <span class="quantity"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><%=order.getBuyNumber()%></font></font></span>
                                </td>

                                <td class="product-time">
                                    <span class="time"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(order.getDateTime())%></font></font></span>
                                </td>

                                <td class="product-status">
                                    <span class="status"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><%=OrderSheet.statusToSalerString(order.getStatus())%></font></font></span>
                                </td>
                                <%
                                    if(flag){
                                        %>
                                <td class="product-status">
                                    <button class="agree"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">同意订单</font></font></button>
                                </td>
                                <td class="product-status">
                                    <button class="reject"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">残忍拒绝</font></font></button>
                                </td>

                            <%
                                    }
                            %>

                            </tr>
                            <%
                                }
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
<%@include file="common/footer.jsp"%>
</body>
</html>
