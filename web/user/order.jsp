<%--
  Created by IntelliJ IDEA.
  User: administrator-PC
  Date: 2020/6/15
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>订单历史</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="../css/font-awesome.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/jquery-1.8.3.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.sticky.js"></script>
    <script src="../js/main.js"></script>
    <script src="../js/buyer.js"></script>
    <script>
        $(document).ready(function () {
            QueryOrder(1);
        });
    </script>
</head>
<body>
<%@include file="../common/header.jsp"%>
<input type="hidden" id="username" value=<%=user.getName()%>>"
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
                                    <th class="product-seller-ID"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">卖家ID</font></font></th>
                                    <th class="product-time"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">交易时间</font></font></th>
                                    <th class="product-status"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">订单状态</font></font></th>
                                </tr>
                                </thead>
                                <tbody id="order-list">
                                <!--tip自动添加订单-->
                                <tr class="cart_item">
                                    <td class="product-ID">
                                        <span class="amount"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">JD-101</font></font></span>
                                    </td>
                                    <td class="product-thumbnail">
                                        <a href="single-product.html"><img width="145" height="145" alt="商品图片" class="shop_picture" src="../imgs/product-2.jpg"></a>
                                    </td>

                                    <td class="product-name">
                                        <span class="amount"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">商品名称</font></font></span>
                                    </td>

                                    <td class="product-price">
                                        <span class="amount"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">￥700.00</font></font></span>
                                    </td>

                                    <td class="product-quantity">
                                        <span class="quantity"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">1</font></font></span>
                                    </td>

                                    <td class="seller-ID">
                                        <span class="S-ID"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">11111</font></font></span>
                                    </td>

                                    <td class="product-time">
                                        <span class="time"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">2020-6-15</font></font></span>
                                    </td>

                                    <td class="product-status">
                                        <span class="status"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">待发货</font></font></span>
                                    </td>
                                </tr>

                                </tbody>
                            </table>
                    </div>
                </div>
                <div class="product-pagination text-center">
                    <nav>
                        <ul class="pagination" id="order-page">
                            <!--tip根据商品数量来计算-->
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../common/footer.jsp"%>
</body>
</html>
