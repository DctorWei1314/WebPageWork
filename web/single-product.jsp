<%@ page import="com.web.entity.Product" %>
<%@ page import="com.web.service.productService" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: administrator-PC
  Date: 2020/6/12
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商品</title><!--tip动态商品名称-->    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/etalage.css">
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    <script src="js/jquery.etalage.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/buyer.js"></script>
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
        $(document).ready(function () {
            Querycomment(1);
        });
    </script>
</head>
<body>
<%@include file="common/header.jsp" %>
<%
//Product p=(Product) request.getAttribute(Constant.SINGLE_PRODUCT);
Product p=new Product();
p.setSalePrice(100);
p.setPrice(200);
p.setName("华为P20");
p.setMainImgFilePath("/images/arrow.png");p.setDescription("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
p.setLeftNumber(100);
p.setSaleNumber(222);
p.setScore(3.75);
p.setScoreNumber(100);
p.setSaleID("华为");
%>
<input type="hidden" id="saleID" value=<%=p.getSaleID()%>>
<input type="hidden" id="productname" value=<%=p.getName()%>>
<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="product-content-right">
                    <div class="product-breadcroumb">
                        <a href="javascript:QueryProduct(1,'ALL','ALL')">首页</a>
                        <a href="javascript:QueryProduct(1,'label',<%=p.getSaleID()%>)"><%=p.getSaleID()%></a>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <!--tip自动图片-->
                            <div class="single_grid">
                                <div class="grid images_3_of_2">
                                    <ul id="etalage">
                                        <li>
                                                <img class="etalage_thumb_image" src=<%=application.getContextPath()+p.getMainImgFilePath()%>
                                                     class="img-responsive"/>
                                                <img class="etalage_source_image" src=<%=application.getContextPath()+p.getMainImgFilePath()%>
                                                     class="img-responsive" title=""/>
                                        </li>
                                        <%if(p.getImage1()!=null){%>
                                        <li>
                                            <img class="etalage_thumb_image" src=<%=application.getContextPath()+p.getImage1()%>
                                                    class="img-responsive"/>
                                            <img class="etalage_source_image" src=<%=application.getContextPath()+p.getImage1()%>
                                                    class="img-responsive" title=""/>
                                        </li>
                                        <%
                                            }
                                        %>
                                        <%if(p.getImage2()!=null){%>
                                        <li>
                                            <img class="etalage_thumb_image" src=<%=application.getContextPath()+p.getImage2()%>
                                                    class="img-responsive"/>
                                            <img class="etalage_source_image" src=<%=application.getContextPath()+p.getImage2()%>
                                                    class="img-responsive" title=""/>
                                        </li>
                                        <%
                                            }
                                        %>
                                        <%if(p.getImage3()!=null){%>
                                        <li>
                                            <img class="etalage_thumb_image" src=<%=application.getContextPath()+p.getImage3()%>
                                                    class="img-responsive"/>
                                            <img class="etalage_source_image" src=<%=application.getContextPath()+p.getImage3()%>
                                                    class="img-responsive" title=""/>
                                        </li>
                                        <%
                                            }
                                        %>
                                        <%if(p.getImage4()!=null){%>
                                        <li>
                                            <img class="etalage_thumb_image" src=<%=application.getContextPath()+p.getImage4()%>
                                                    class="img-responsive"/>
                                            <img class="etalage_source_image" src=<%=application.getContextPath()+p.getImage4()%>
                                                    class="img-responsive" title=""/>
                                        </li>
                                        <%
                                            }
                                        %>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="product-inner">
                                <h2 class="product-name"><%=p.getName()%></h2><!--tip商品名称-->
                                <div class="product-inner-price">
                                    <ins>￥<%=p.getSalePrice()%></ins><!--tip商品价格-->
                                    <del>￥<%=p.getPrice()%></del><!--tip折扣价格-->
                                </div>

                                <form action="" class="cart">
                                    <div class="quantity">
                                        <input id="num" type="number" size="4" class="input-text qty text" title="数量" value="1"
                                               name="quantity" min="1" max=<%=p.getLeftNumber()%> step="1"><!--tipmax为数量-->
                                    </div>
                                    <label>(库存<%=p.getLeftNumber()%>件)</label><!--tipmax为数量-->
                                    <button class="add_to_cart_button" type="submit" onclick="addcart(<%=p.getSaleID()%>,<%=p.getName()%>)">加入购物车</button>
                                </form>
                                <%
                                    double a=p.getScore();//输入正浮点数a
                                    int b=(int)a;//将a取整赋给b，强制转型正整数只能向下取整
                                    double c=a-b;//将a-b赋给c，如：5.5-5=0.5或5.1234-5=0.1234赋给c
                                    if(c<=0.25)
                                        a=b;
                                    else if (c>0.25&&c<0.75)
                                        a=b+0.5;
                                    else
                                        a=b+1;
                                %>
                                <span class=allstar<%=c*10%> id="rate"><!--tip动态改变类型--></span>
                                <span class="s1"><%=p.getSaleNumber()%>人评价</span>
                                <span class="s1"><%=p.getSaleNumber()%>&nbsp交易成功</span><!--tip获取交易数量-->
                                <div class="product-inner-category">
                                    <!--tip标签动态更新-->
                                    标签:
                                    <%
                                        //测试代码important
                                        List<String> t_list= productService.selectTagByProduct(p.getName(),p.getSaleID());
//                                        List<String> t_list=new ArrayList<String>();
//                                        t_list.add("手机");
                                        for (String tag:t_list){
                                    %>
                                    <a href=<%=application.getContextPath()%>/BuyerQuery?type=label&condition=<%=tag%>><%=tag%></a>,
                                    <%
                                        }
                                    %>
                                </div>

                                <div role="tabpanel">
                                    <ul class="product-tab" role="tablist">
                                        <li role="presentation" class="active"><a href="#home" aria-controls="home"
                                                                                  role="tab" data-toggle="tab">描述</a>
                                        </li>
                                        <li role="presentation" class=""><a href="#profile" aria-controls="profile"
                                                                            role="tab" data-toggle="tab">投诉商家</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane fade in active" id="home">
                                            <h2>商品描述</h2>
                                            <p id="s2">
                                                <%=p.getDescription()%>
                                            </p>
                                        </div>
                                        <div role="tabpanel" class="tab-pane fade" id="profile">
                                            <h2>投诉信息</h2>
                                            <form id="complaint" action=<%=application.getContextPath()%>user/Complaint method="post" onsubmit="return complaint()"><!--important投诉-->
                                            <div class="submit-review">
                                                <textarea name="description" id="Comtext"
                                                          cols="30"
                                                          rows="10"></textarea>
                                                <input type="hidden" name="saleID" value=<%=p.getSaleID()%>
                                                <p><input type="submit" value="提交"></p>
                                            </div>
                                            </form>
                                        </div>
                                    </div>

                                </div>


                            </div>
                            <div class=" single_top">
                                <!--tip教训记得看源码-->
                                <ul id="flexiselDemo1">
                                    <%
                                        //important测试代码
                                        List<Product> p_list=productService.selectRelatedProduct(p.getName(),p.getSaleID(),1,8);
//                                        List<Product> p_list=new ArrayList<Product>();
                                        for(Product rp:p_list){
                                    %>
                                    <li><img src=<%=application.getContextPath()+rp.getMainImgFilePath()%>/>
                                        <div class="grid-flex"><a href=<%=application.getContextPath()%>/SingleProduct?saleID=<%=p.getSaleID()%>&name=<%=p.getName()%> ><%=p.getName()%></a>
                                            <p><%=p.getSalePrice()%></p></div>
                                    </li>
                                    <%
                                        }
                                    %>
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

                    <form id="commentForm" method="post" action=<%=application.getContextPath()%>/user/Comment onsubmit="return score_1()">
                        <div class="row">
                            <div class="col-sm-2">
                            <span class="comment-avatar">
                                <img src="imgs/product-2.jpg" alt="avatar">
                            </span>
                            </div>
                            <div class="col-sm-6">
                            <textarea class="comment-send-input" name="comment" form="commentForm" id="comment" cols="80" rows="5"
                                      placeholder="请自觉遵守互联网相关的政策法规，严禁发布色情、暴力、反动的言论。"></textarea>
                            </div>
                            <div class="col-sm-2">
                                <span id="stars" data-default-index="0" >
                                <img src="imgs/stard.png" id="star1" width="16" height="16">
                                <img src="imgs/stard.png" id="star2" width="16" height="16">
                                <img src="imgs/stard.png" id="star3" width="16" height="16">
                                <img src="imgs/stard.png" id="star4" width="16" height="16">
                                <img src="imgs/stard.png" id="star5" width="16" height="16">
                                </span>
                                <input type="hidden" id="commentscore" name="score">
                                <input type="hidden" name="productname" value=<%=p.getName()%>>
                                <input type="hidden" name="saleID" value=<%=p.getSaleID()%>>
                            </div>
                            <div class="col-sm-2">
                                <input class="comment-send-button" type="submit" value="发表评论" >
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
                        <ul class="pagination" id="page">
                            <!--tip根据商品数量来计算-->
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>
    </div>
</div>
</div>
<%@include file="common/footer.jsp" %>
</body>
</html>
