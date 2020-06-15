<%--
  Created by IntelliJ IDEA.
  User: administrator-PC
  Date: 2020/6/13
  Time: 17:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>购物车</title>
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
<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">


            <div class="col-md-12">
                <div class="product-content-right">
                    <div class="woocommerce">
                        <form method="post" action="#">
                            <table cellspacing="0" class="shop_table cart">
                                <thead>
                                <tr>
                                    <th class="product-remove">&nbsp;</th>
                                    <th class="product-thumbnail">&nbsp;</th>
                                    <th class="product-name"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">产品</font></font></th>
                                    <th class="product-price"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">价钱</font></font></th>
                                    <th class="product-quantity"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">数量</font></font></th>
                                    <th class="product-subtotal"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">总</font></font></th>
                                </tr>
                                </thead>
                                <tbody>
                                <!--自动添加购物车-->
                                <tr class="cart_item">
                                    <td class="product-remove">
                                        <a title="删除该项目" class="remove" href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">×</font></font></a>
                                    </td>

                                    <td class="product-thumbnail">
                                        <a href="single-product.html"><img width="145" height="145" alt="poster_1_up" class="shop_thumbnail" src="imgs/product-2.jpg"></a>
                                    </td>

                                    <td class="product-name">
                                        <a href="single-product.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">传达您的想法</font></font></a>
                                    </td>

                                    <td class="product-price">
                                        <span class="amount"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">£15.00</font></font></span>
                                    </td>

                                    <td class="product-quantity">
                                        <div class="quantity buttons_added">
                                            <font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><input type="button" class="minus" value="--"></font></font>
                                            <input type="number" size="4" class="input-text qty text" title="数量" value="1" min="0" step="1">
                                            <font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><input type="button" class="plus" value="+"></font></font>
                                        </div>
                                    </td>

                                    <td class="product-subtotal">
                                        <span class="amount"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">£15.00</font></font></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="actions" colspan="6">
                                        <font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><input type="submit" value="更新购物车" name="update_cart" class="button"></font></font>
                                        <font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><input type="submit" value="继续进行结帐" name="proceed" class="checkout-button button alt wc-forward"></font></font>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </form>


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="common/footer.jsp"%>
</body>
</html>
