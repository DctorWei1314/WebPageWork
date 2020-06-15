<%--
  Created by IntelliJ IDEA.
  User: administrator-PC
  Date: 2020/6/13
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>付款</title>
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
<%@include file="common/header.jsp" %>
<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">


            <div class="col-md-12">
                <div class="product-content-right">
                    <div class="woocommerce">
                        <!--tip倒是有默认值-->
                        <form enctype="multipart/form-data" action="#" class="checkout" method="post" name="checkout">

                            <div id="customer_details" class="col2-set">
                                <div class="col-1">
                                    <div class="woocommerce-billing-fields">
                                        <h3><font style="vertical-align: inherit;"><font
                                                style="vertical-align: inherit;">结算明细</font></font></h3>

                                        <p id="billing_address_1_field"
                                           class="form-row form-row-wide address-field validate-required">
                                            <label class="" for="billing_address_1"><font
                                                    style="vertical-align: inherit;"><font
                                                    style="vertical-align: inherit;">详细地址</font></font><abbr title="必填"
                                                                                                             class="required"><font
                                                    style="vertical-align: inherit;"><font
                                                    style="vertical-align: inherit;">*</font></font></abbr>
                                            </label>
                                            <select  value=""  id="billing_address_1"
                                                   name="billing_address_1" class="input-text ">
                                                <option value=""></option><!--tip获取地址-->
                                            </select>
                                        </p>
                                        <p id="order_comments_field" class="form-row notes">
                                            <label class="" for="order_comments"><font style="vertical-align: inherit;"><font
                                                    style="vertical-align: inherit;">备注</font></font></label>
                                            <textarea cols="5" rows="2" placeholder="有关您订单的备注，例如交货的特殊备注。"
                                                      id="order_comments" class="input-text "
                                                      name="order_comments"></textarea>
                                        </p>
                                        <div class="clear"></div>


                                    </div>
                                </div>


                            </div>

                            <h3 id="order_review_heading"><font style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">你的订单</font></font></h3>

                            <div id="order_review" style="position: relative;">
                                <table class="shop_table">
                                    <thead>
                                    <tr>
                                        <th class="product-name"><font style="vertical-align: inherit;"><font
                                                style="vertical-align: inherit;">商品</font></font></th>
                                        <th class="product-total"><font style="vertical-align: inherit;"><font
                                                style="vertical-align: inherit;">金额</font></font></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <!--tip动态添加-->
                                    <tr class="cart_item">
                                        <td class="product-name"><font style="vertical-align: inherit;"><font
                                                style="vertical-align: inherit;">
                                            传达您的想法</font></font><strong class="product-quantity"><font
                                                style="vertical-align: inherit;"><font style="vertical-align: inherit;">×1</font></font></strong>
                                        </td>
                                        <td class="product-total">
                                            <span class="amount"><font style="vertical-align: inherit;"><font
                                                    style="vertical-align: inherit;">£15.00</font></font></span></td>
                                    </tr>
                                    </tbody>
                                    <tfoot>

                                    <tr class="order-total">
                                        <th><font style="vertical-align: inherit;"><font
                                                style="vertical-align: inherit;">合计金额</font></font></th>
                                        <td><strong><span class="amount"><font style="vertical-align: inherit;"><font
                                                style="vertical-align: inherit;">£15.00</font></font></span></strong>
                                        </td>
                                    </tr>

                                    </tfoot>
                                </table>


                                <div id="payment">
                                    <ul class="payment_methods methods">
                                        <li class="payment_method_bacs">
                                            <input type="radio" data-order_button_text="" checked="checked" value="bacs"
                                                   name="payment_method" class="input-radio" id="payment_method_bacs">
                                            <label for="payment_method_bacs"><font
                                                    style="vertical-align: inherit;"><font
                                                    style="vertical-align: inherit;">支付宝 </font></font></label>
                                        </li>
                                        <li class="payment_method_cheque">
                                            <input type="radio" data-order_button_text="" value="cheque"
                                                   name="payment_method" class="input-radio" id="payment_method_cheque">
                                            <label for="payment_method_cheque"><font
                                                    style="vertical-align: inherit;"><font
                                                    style="vertical-align: inherit;">微信 </font></font></label>
                                        </li>
                                        <li class="payment_method_cheque">
                                            <input type="radio" data-order_button_text="" value="bank"
                                                   name="payment_method" class="input-radio" id="payment_method_bank">
                                            <label for="payment_method_cheque"><font
                                                    style="vertical-align: inherit;"><font
                                                    style="vertical-align: inherit;">银行卡 </font></font></label>
                                        </li>
                                    </ul>

                                    <div class="form-row place-order">

                                        <font style="vertical-align: inherit;"><font
                                                style="vertical-align: inherit;"><input type="submit"
                                                                                        data-value="Place order"
                                                                                        value="下订单" id="place_order"
                                                                                        name="woocommerce_checkout_place_order"
                                                                                        class="button alt"></font></font>


                                    </div>

                                    <div class="clear"></div>

                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="common/footer.jsp" %>
</body>
</html>
