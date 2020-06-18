<%@ page import="com.web.entity.Product" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: 无索魏
  Date: 2020/6/15
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商家</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery.min.js"></script>
    <script>
            $(function () {
                $("")
            })
    </script>
</head>
<body>

<%
%>
<%@include file="common/header.jsp"%>
<div class="product-big-title-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="list-group list-group-horizontal align-self-center">
                    <%
                        List<String> t_list=(List<String>)application.getAttribute(Constant.T_LIST);
                        if(t_list!=null){
                            t_list.add("全部商品");
                            for(String tag:t_list){
                    %>
                    <a onclick="location='BuyerQuery?type=label&condition=<%=tag%>';return false" href="#"  class="list-group-item" ><%=tag%></a>
                    <%
                            }}
                    %>
                    <!--tip动态获取标签-->
                </div>
            </div>
        </div>
    </div>
</div>
<div class="single-product-area">
    <!--下斜杠-->
    <div class="zigzag-bottom"></div>
    <div class="container">
        <!--主要内容-->
        <div class="row">
            <!--tip自动生成-->
            <%
                String saleID = request.getParameter("saleID");
                //                if(request.getAttribute(Constant.Q_TYPE)==null){
//                    request.setAttribute(Constant.P_LIST, productService.selectAllProduct(1,12));
//                    request.setAttribute(Constant.PAGE,1);
//                    request.setAttribute(Constant.PAGE_NUM,productService.selectAllProductCount()/12);
//                }
//                List<Product> p_list=(List<Product>)request.getAttribute(Constant.P_LIST);
//测试用代码important
                Product pt=new Product();
                pt.setName("bby");
                pt.setSaleID("了12");
                pt.setMainImgFilePath("/imgs/product-2");
                pt.setName("腾讯");
                pt.setPrice(100);
                pt.setSalePrice(200);
                List<Product> p_list=new ArrayList<Product>();
                p_list.add(pt);
                for(Product p:p_list){
            %>
            <div class="col-md-3 col-sm-6">
                <div class="single-shop-product">
                    <div class="product-upper">
                        <img src=<%=application.getContextPath()+p.getMainImgFilePath()%> alt=<%=p.getName()%>>
                    </div>
                    <h2><a href=<%=application.getContextPath()%>/SingleProduct?saleID=<%=p.getSaleID()%>&name=<%=p.getName()%>><%=p.getName()%></a></h2><!--tip单品链接-->
                    <div class="product-carousel-price">
                        <ins>￥<%=p.getPrice()%></ins> <del>￥<%=p.getSalePrice()%></del>
                    </div>

                    <div class="product-option-shop">
                            <%
                                if(user==null||user.getType()==Constant.MessageType.BUYER){
                            %>
                        <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow"
                           onclick="addcart(p,1)">
                            加入购物车
                            <%
                                }else if(user.getType()==Constant.MessageType.SELLER&&user.getUserID()==saleID)
                                {
                            %>
                            <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow"
                               onclick="addcart(p,1)">
                            修改信息
                            <%
                                }else{
                            %>
                            查看详细信息
                            <%
                                }
                            %>
                        </a>
                        <!--tip加入购物车链接-->
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <!--底部翻页-->
        <div class="row">
            <div class="col-md-12">
                <div class="product-pagination text-center">
                    <nav>
                        <ul class="pagination">
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="common/footer.jsp" %>
</body>
</html>