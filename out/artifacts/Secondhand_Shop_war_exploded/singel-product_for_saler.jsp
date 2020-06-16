<%--
  Created by IntelliJ IDEA.
  User: 无索魏
  Date: 2020/6/16
  Time: 0:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/etalage.css">
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    <script src="js/jquery.etalage.min.js"></script>
    <script src="js/main.js"></script>
    <script>
        jQuery(document).ready(function ($) {

            $('#etalage').etalage({
                thumb_image_width: 300,
                thumb_image_height: 400,
                source_image_width: 900,
                source_image_height: 1200,
                show_hint: true,
                click_callback: function (image_anchor, instance_id) {
                    alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
                }
            });

        });
    </script>
</head>
<body>
<%@include file="common/header_saler.jsp" %>
<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="product-content-right">

                    <div class="row">
                        <div class="col-sm-6">
                            <!--tip自动图片-->
                            <div class="single_grid">
                                <div class="grid images_3_of_2">
                                    <ul id="etalage">
                                        <li>
                                            <a href="optionallink.html">
                                                <img class="etalage_thumb_image" src="imgs/product-2.jpg"
                                                     class="img-responsive"/>
                                                <img class="etalage_source_image" src="imgs/product-2.jpg"
                                                     class="img-responsive" title=""/>
                                            </a>
                                        </li>
                                        <li>
                                            <img class="etalage_thumb_image" src="imgs/product-2.jpg"
                                                 class="img-responsive"/>
                                            <img class="etalage_source_image" src="imgs/product-2.jpg"
                                                 class="img-responsive" title=""/>
                                        </li>
                                        <li>
                                            <img class="etalage_thumb_image" src="imgs/product-2.jpg"
                                                 class="img-responsive"/>
                                            <img class="etalage_source_image" src="imgs/product-2.jpg"
                                                 class="img-responsive"/>
                                        </li>
                                        <li>
                                            <img class="etalage_thumb_image" src="imgs/product-2.jpg"
                                                 class="img-responsive"/>
                                            <img class="etalage_source_image" src="imgs/product-2.jpg"
                                                 class="img-responsive"/>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="product-inner">
                                <h2 class="product-name">商品名称</h2><!--tip商品名称-->
                                <div class="product-inner-price">
                                    <ins>$700.00</ins><!--tip商品价格-->
                                    <del>$800.00</del><!--tip折扣价格-->
                                </div>

                                <form action="" class="cart">
                                    <div class="quantity">
                                        <input type="number" size="4" class="input-text qty text" title="数量" value="1"
                                               name="quantity" min="1" max="100" step="1"><!--tipmax为数量-->
                                    </div>
                                    <label>(库存xxx件)</label><!--tipmax为数量-->
                                </form>
                                <span class="allstar30" id="rate"><!--tip动态改变类型--></span>
                                <span class="s1">89人评价</span>
                                <span class="s1">27&nbsp交易成功</span><!--tip获取交易数量-->
                                <div class="product-inner-category">
                                    <!--tip标签动态更新-->
                                    标签: <a href="">帅</a>, <a
                                        href="">最好</a>, <a href="">打折</a>. </p>
                                </div>

                                <div role="tabpanel">
                                    <ul class="product-tab" role="tablist">
                                        <li role="presentation" class="active"><a href="#home" aria-controls="home"
                                                                                  role="tab" data-toggle="tab">描述</a>
                                        </li>
                                        <li role="presentation" class=""><a href="#profile" aria-controls="profile"
                                                                            role="tab" data-toggle="tab">投诉</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane fade in active" id="home">
                                            <h2>商品描述</h2>
                                            <p id="s2">aaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA aaaaaaaaaaaaa
                                                aaaaaaaaa
                                                aaaaaaaaa
                                                aaaaaaaaa
                                                aaaaaaaaa
                                                aaaaaaaaa
                                                aaaaaaaaa
                                                aaaaaaaaa
                                                aaaaaaaaa
                                                aaaaaaaaa
                                            </p>
                                        </div>
                                        <div role="tabpanel" class="tab-pane fade" id="profile">
                                            <h2>投诉信息</h2>
                                            <div class="submit-review">
                                                <textarea name="review" id=""
                                                          cols="30"
                                                          rows="10"></textarea>
                                                </p>
                                                <p><input type="submit" value="提交"></p>
                                            </div>
                                        </div>
                                    </div>

                                </div>


                            </div>
                            <div class=" single_top">
                                <!--tip教训记得看源码-->
                                <ul id="flexiselDemo1">
                                    <li><img src="imgs/product-2.jpg"/>
                                        <div class="grid-flex"><a href="#">Bloch</a>
                                            <p>Rs 850</p></div>
                                    </li>
                                    <li><img src="imgs/product-2.jpg"/>
                                        <div class="grid-flex"><a href="#">Capzio</a>
                                            <p>Rs 850</p></div>
                                    </li>
                                    <li><img src="imgs/product-2.jpg"/>
                                        <div class="grid-flex"><a href="#">Zumba</a>
                                            <p>Rs 850</p></div>
                                    </li>
                                    <li><img src="imgs/product-2.jpg"/>
                                        <div class="grid-flex"><a href="#">Bloch</a>
                                            <p>Rs 850</p></div>
                                    </li>
                                    <li><img src="imgs/product-2.jpg"/>
                                        <div class="grid-flex"><a href="#">Capzio</a>
                                            <p>Rs 850</p></div>
                                    </li>
                                </ul>
                                <script type="text/javascript">
                                    $(window).load(function () {
                                        $("#flexiselDemo1").flexisel({
                                            visibleItems: 4,
                                            animationSpeed: 1000,
                                            autoPlay: true,
                                            autoPlaySpeed: 3000,
                                            pauseOnHover: true,
                                            enableResponsiveBreakpoints: true,
                                            responsiveBreakpoints: {
                                                portrait: {
                                                    changePoint: 480,
                                                    visibleItems: 1
                                                },
                                                landscape: {
                                                    changePoint: 640,
                                                    visibleItems: 2
                                                },
                                                tablet: {
                                                    changePoint: 768,
                                                    visibleItems: 3
                                                }
                                            }
                                        });

                                    });
                                </script>
                                <script type="text/javascript" src="js/jquery.flexisel.js"></script>

                            </div>

                        </div>
                    </div>
                </div>
                <div class="comment-send">

                    <form id="commentForm" method="GET" action="http://127.0.0.1:8888/comment">
                        <div class="row">
                            <div class="col-sm-2">
                            <span class="comment-avatar">
                                <img src="imgs/product-2.jpg" alt="avatar">
                            </span>
                            </div>
                            <div class="col-sm-6">
                            <textarea class="comment-send-input" name="comment" form="commentForm" cols="80" rows="5"
                                      placeholder="请自觉遵守互联网相关的政策法规，严禁发布色情、暴力、反动的言论。"></textarea>
                            </div>
                            <div class="col-sm-2">
                                <span id="stars" data-default-index="0">
                                <img src="imgs/stard.png" id="star1" width="16" height="16">
                                <img src="imgs/stard.png" id="star2" width="16" height="16">
                                <img src="imgs/stard.png" id="star3" width="16" height="16">
                                <img src="imgs/stard.png" id="star4" width="16" height="16">
                                <img src="imgs/stard.png" id="star5" width="16" height="16">
                                </span>
                            </div>
                            <div class="col-sm-2">
                                <input class="comment-send-button" type="submit" value="发表评论">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="comment-list" id="commentList">
                    <div class="comment row">
                        <span class="comment-avatar col-sm-2">
                            <img src="imgs/product-2.jpg" alt="avatar">
                        </span>
                        <div class="comment-content col-sm10">
                            <p class="comment-content-name">EdmundDZhang</p>
                            <p class="comment-content-article">惊了</p>
                            <p class="comment-content-footer">
                                <span class="comment-content-footer-id">#2</span>
                                <span class="comment-content-footer-device">来自安卓客户端</span>
                                <span class="comment-content-footer-timestamp">2018-01-20 14:05</span>
                            </p>
                        </div>
                        <div class="cls"></div>
                    </div>
                    <div class="comment comment-bottom row">
                        <span class="comment-avatar col-sm-2">
                            <img src="imgs/product-2.jpg" alt="avatar">
                        </span>
                        <div class="comment-content col-sm-10">
                            <p class="comment-content-name">bilibili英雄联盟赛事</p>
                            <p class="comment-content-article">Hello World!</p>
                            <p class="comment-content-footer">
                                <span class="comment-content-footer-id">#1</span>
                                <span class="comment-content-footer-device">来自安卓客户端</span>
                                <span class="comment-content-footer-timestamp">2018-01-20 13:10</span>
                            </p>
                        </div>
                        <div class="cls"></div>
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
</div>
<%@include file="common/footer_saler.jsp" %>
</body>
</html>
