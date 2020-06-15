<%--
  Created by IntelliJ IDEA.
  User: 无索魏
  Date: 2020/6/14
  Time: 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.web.entity.Product" %>
<%@ page import="com.web.entity.Tag" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Title</title>
    <script src="js/jquery.min.js">
        // 要用jquery用src="js/jquery.min.js"
    </script>
    <script>
        $(function () {
            $("#submit").click(function () {
                var formData = new FormData();
                var files = document.getElementsByClassName("upload");
                alert(files.length);
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
                    formData.append(tag[i].class,tag[i].innerHTML)
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
    </style>
</head>
<body>
<%@include file="common/header_saler.jsp"%>
<%
    String product_name = request.getParameter("product_name");
    String product_saleID = request.getParameter("product_saleID");
    if(product_name != null){
        Product product = new Product();
    }else {

    }
%>
<div>
    <input class="upload" type="file" id="mainImgFilePath"  state="false" style="display:none" name="mainImgFilePath0" accept="image/*"/><br/>
    <img id="mainImgFilePath0" src="imgs/upload.png" />
    <input class="upload" type="file" id="image1" state="false" style="display:none" name="image10" accept="image/*"/><br/>
    <img id="image10" src="imgs/upload.png"/>
    <input class="upload" type="file" id="image2" state="false" style="display:none" name="image20" accept="image/*"/><br/>
    <img id="image20" src="imgs/upload.png"/>
    <input class="upload" type="file" id="image3" state="false" style="display:none" name="image30" accept="image/*"/><br/>
    <img id="image30" src="imgs/upload.png"/>
    <input class="upload" type="file" id="image4" state="false" style="display:none" name="image40" accept="image/*"/><br/>
    <img id="image40" src="imgs/upload.png"/>
    <input class="info" type="number" id="price" state="false"/><br/>
    <input class="info" type="number" id="discount" state="false"/><br/>
    <input class="info" type="number" id="number" state="false"/><br/>
    <input class="info" type="text" id="description" state="false"/><br/>
    <input type="text" id="name" /><br/>
    <input type="button" id="sumbit" value="提交" name="false" state="<%=product_saleID%>">
</div>
<%
    List<Tag> allTag ;
    List<Tag> ownTag;
%>
<div>
    <ul id="ownTag" >
        <li><strong class="mytag">我的账户</strong></li>
        <li><strong class="mytag">女装</strong></li>
    </ul>
</div>
<div>
    <ul id="allTag" >
        <li><strong class="alltag">女装</strong></li>
        <li><strong class="alltag">女装</strong></li>
    </ul>
</div>
<%@include file="common/footer_saler.jsp" %>
</body>
</html>