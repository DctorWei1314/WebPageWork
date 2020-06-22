<%--
  Created by IntelliJ IDEA.
  User: 无索魏
  Date: 2020/6/15
  Time: 23:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.web.entity.Product" %>
<%@ page import="com.web.entity.Tag" %>
<%@ page import="java.util.List" %>
<%@ page import="com.web.service.productService" %>
<html>
<head>
    <title>修改商品信息</title>
    <script src="js/jquery.min.js">
        // 要用jquery用src="js/jquery.min.js"
    </script>
    <script>
        $(function () {
            $("#submit").click(function () {
                var formData = new FormData();
                var files = document.getElementsByClassName("upload");
                formData.append("modify","true");
                for(var i=0;i<files.length;i++){
                    if (files[i].state == "true"){
                        $("#"+files[i].name).attr("src","imgs/wait.gif");
                        formData.append("image"+i, files[i].files[0]);
                    }
                }
                var info = document.getElementsByClassName("info");
                for(var i=0;i<info.length;i++){
                    if (info[i].state == "true"){
                        formData.append(info[i].id, info[i].value);
                    }
                }
                var tag = document.getElementsByClassName("mytag");
                for(var i=0;i<tag.length;i++){
                    if (tag[i].state == "true"){
                        formData.append(tag[i].class,tag[i].innerHTML)
                    }
                }
                $.ajax({
                    url: "UploadHandleServlet",
                    type: "POST",
                    data: formData,
                    /**
                     *必须false才会自动加上正确的Content-Type
                     */
                    contentType: false,
                    /**
                     * 必须false才会避开jQuery对 formdata 的默认处理
                     * XMLHttpRequest会对 formdata 进行正确的处理
                     */
                    processData: false,
                    success: function (result) {
                        var files = document.getElementsByClassName("upload");
                        for(var i=0;i<files.length;i++){
                            if (files[i].state == "true"){
                                var fileimg = files[i].files[0];
                                var URL = window.URL || window.webkitURL;
                                // 通过 file 生成目标 url
                                var imgURL = URL.createObjectURL(fileimg);
                                $("#"+files[i].name).attr("src",imgURL);
                            }
                        }
                        if (result!=null){
                            alert(resul);
                        }
                    },
                    error: function () {
                        alert("错误！");
                    }
                });
            });
            $(".upload").change(function(){
                //$(this).css("background-image", "url(\"imgs/wait.gif\")");
                // $(this).css("background-image", imgURL);
                // $(this).css("background-color", "blue");
                //$(this).attr('src',URL.createObjectURL($(this)[0].files[0]));
                var fileimg = $(this)[0].files[0]
                $(this)[0].state="true";
                // var reader = new FileReader();
                var URL = window.URL || window.webkitURL;
                // 通过 file 生成目标 url
                var imgURL = URL.createObjectURL(fileimg);
                // $(this).removeClass
                // $(this).removeClass("onweek");
                // $(this).addClass("onweek");
                // $(this).css("background-color", "red");
                $("#"+$(this)[0].name).attr("src",imgURL);
                // console.log(imgURL);
                //reader.readAsDataURL(fileimg);
                // reader.readAsDataURL(fileimg);
                // reader.onloadend = function () {
                //     alert("xxxxxx");
                //     console.log(reader.result);
                //     $(this).css("background-image", reader.result);
                // }
            });

            //点击装换
            $("#mainImgFilePath0").click(function(){
                $("#mainImgFilePath").trigger("click");
            });
            $("#image10").click(function(){
                $("#image1").trigger("click");
            });
            $("#image20").click(function(){
                $("#image2").trigger("click");
            });
            $("#image30").click(function(){
                $("#image3").trigger("click");
            });
            $("#image40").click(function(){
                $("#image4").trigger("click");
            });
            $(".allTag").click(function () {
                $("#ownTag").append("<li><strong class=\"owntag\" state=\"true\">"+$(this)[0].innerHTML+"</strong></li>");
                $(this).remove();
            })
            //...........
        });
    </script>
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
    <style>
        img{
            width: 150px;
            height: 150px;
            border: 1px solid #ccc;
            background-color: transparent;
        }
        #mian{
            position: relative;
            left: 600px;
        }
        #mainImgFilePath{
            float: left;
        }
        .div{
            margin-bottom: 20px;
        }
        li{
            list-style: none;
        }
    </style>
</head>
<body>
<%@include file="common/header.jsp"%>
<%
    String product_name = request.getParameter("product_name");
    Product product = productService.selectProductByProductNameSaleID(product_name,user.getUserID());
%>
<div id="mian" >
    <div>
        <strong>主图片：</strong>
        <input class="upload" type="file" id="mainImgFilePath"  state="false" style="display:none" name="mainImgFilePath0" accept="image/*"/><br/>
        <img id="mainImgFilePath0" src="<%="imgs/"+product.getMainImgFilePath()%>" />
        <br/>
        <strong>副图片：</strong>
        <input class="upload" type="file" id="image1" state="false" style="display:none" name="image10" accept="image/*"/>
        <img id="image10" src="<%=product.getImage1()==null?"imgs/upload.png":new String("imgs/"+product.getImage1())%>"/>
        <input class="upload" type="file" id="image2" state="false" style="display:none" name="image20" accept="image/*"/>
        <img id="image20" src="<%=product.getImage2()==null?"imgs/upload.png":new String("imgs/"+product.getImage2())%>"/>
        <input class="upload" type="file" id="image3" state="false" style="display:none" name="image30" accept="image/*"/>
        <img id="image30" src="<%=product.getImage3()==null?"imgs/upload.png":new String("imgs/"+product.getImage3())%>"/>
        <input class="upload" type="file" id="image4" state="false" style="display:none" name="image40" accept="image/*"/>
        <img id="image40" src="<%=product.getImage4()==null?"imgs/upload.png":new String("imgs/"+product.getImage4())%>"/>
    </div>
    <br/>
    <div class="div">
        <strong>价格：</strong>
        <input class="info" type="number" id="price" state="false" onchange="this.state='true'"value="<%=product.getPrice()%>"/><br/>
    </div>
    <div class="div">
        <strong>折扣(折)：</strong>
        <input class="info" type="number" typ id="discount" state="false" onchange="this.state='true'" value="<%=product.getDiscount()*10%>"/><br/>
    </div>
    <div class="div">
        <strong>剩余数量：</strong>
        <input class="info" type="text" id="number" readonly="readonly" value="<%=product.getLeftNumber()%>" /><br/>
    </div>
    <div class="div">
        <strong>加货数量：</strong>
        <input class="info" type="number" typ id="add" state="false" onchange="this.state='true'" value="0"/><br/>
    </div>
    <div class="div">
        <strong>商品描述：</strong>
        <input class="info" type="text" id="description" state="false" value="<%=product.getDescription()%>" onchange="this.state='true'"/><br/>
    </div>
    <div class="div">
        <strong>商品名：</strong>
        <input type="text" readonly="readonly" id="name" readonly="readonly"/><br/>
    </div>
    <%
        List<String> allTag = (List<String>) application.getAttribute(Constant.T_LIST);
        List<String> ownTag = (List<String>)productService.selectTagByProduct(user.getUserID(),product_name);
    %>
    <div>
        <strong>商品标签：</strong>
        <ul id="ownTag" >
            <%
                if(ownTag.size() > 0) {
                    for(String tag : ownTag) {
            %>
            <li class="ownTag" status="false"><%=tag%></li>
            <%
                    }
                }
            %>
        </ul>
    </div>
    <div>
        <strong>标签库：</strong>
        <ul id="allTag" >
            <%
                if(ownTag.size() > 0) {
                    for(String tag : ownTag) {
                        if(!ownTag.contains(tag)){
            %>
            <li class="allTag"><%=tag%></li>
            <%
                        }
                    }
                }
            %>
        </ul>
    </div>
    <input type="button" id="sumbit" value="提交" name="<%=product_name%>">
</div>
<%@include file="common/footer.jsp" %>
</body>
</html>
