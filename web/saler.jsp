<%@ page import="java.util.List" %>
<%@ page import="com.web.service.tagService" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="com.web.service.productService" %>
<%@ page import="com.web.entity.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.web.service.userService" %>
<%@ page import="com.web.util.Constant" %>
<%--
  Created by IntelliJ IDEA.
  User: administrator-PC
  Date: 2020/6/11
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>最NB商城</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    <script src="js/main.js"></script>
    <script src="js/buyer.js"></script>
    <script>
        $(document).ready(function () {
            QueryProduct(1);
        });
    </script>>
</head>
<body>
<!--通用头部-->
<%@include file="common/header.jsp"%>
<!--标签栏-->
<%if(request.getParameter("type")!=null&&request.getParameter("condition")!=null)
{
%>
<input type="hidden" id="type" value=<%=request.getParameter("type")%>>
<input type="hidden" id="condition" value=<%=request.getParameter("condition")%>>
<input type="hidden" id="role" value=<%=Constant.MessageType.insertUserType(user.getType())%>>
<%
}
else
{
%>
<input type="hidden" id="type" value="">
<input type="hidden" id="condition" value="">
<%
    }
%>
<input type="hidden" id="pageLabel">
<div class="product-big-title-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="list-group list-group-horizontal align-self-center">

                    <%
                        List<String> t_list=(List<String>)application.getAttribute(Constant.T_LIST);
                        if(t_list!=null){
                            for(String tag:t_list){
                    %>
                    <a  href="javascript:QueryProduct(1,'label',<%=tag%>)"  class="list-group-item" ><%=tag%></a>
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
        <div class="row" id="product-list">
            <!--tip自动生成-->
        </div>
        <!--底部翻页-->
        <div class="row">
            <div class="col-md-12">
                <div class="product-pagination text-center">
                    <nav>
                        <ul class="pagination" id="product-page">
                            <!--自动生成页码-->
                        </ul>
                    </nav>
                </div>
            </div>
        </div>


    </div>
</div>
<!--通用尾部-->
<%@include file="common/footer.jsp"%>

</body>
</html>