<%--
  Created by IntelliJ IDEA.
  User: 无索魏
  Date: 2020/6/9
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--这只是一个例子，写商家提交物品图片等信息的人可以融合并把它删了,看不太懂去看ajax，视频里面有--%>
<html>
<head>
    <title>图片上传</title>
    <script src="js/jquery.min.js">
        // 要用jquery用src="js/jquery.min.js"
    </script>
    <script>
    $(function () {
    $("#upload").click(function () {
    $("#imgWait").show();
    $("#test").attr("src","imgs/wait.gif");
    var formData = new FormData();
    formData.append("image", document.getElementById("file").files[0]);
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
        var fileimg = $("#file")[0].files[0];
        // var reader = new FileReader();
        var URL = window.URL || window.webkitURL;
        // 通过 file 生成目标 url
        var imgURL = URL.createObjectURL(fileimg);
        // $(this).removeClass
        // $(this).removeClass("onweek");
        // $(this).addClass("onweek");
        // $(this).css("background-color", "red");
        $("#test").attr("src",imgURL);
    alert(result);
    $("#imgWait").hide();
    },
    error: function () {
    alert("上传失败！");
    $("#imgWait").hide();
    }
    });
    });
        $("#file").change(function(){
            //$(this).css("background-image", "url(\"imgs/wait.gif\")");
            // $(this).css("background-image", imgURL);
            // $(this).css("background-color", "blue");
            //$(this).attr('src',URL.createObjectURL($(this)[0].files[0]));
            var fileimg = $(this)[0].files[0]
            // var reader = new FileReader();
            var URL = window.URL || window.webkitURL;
            // 通过 file 生成目标 url
            var imgURL = URL.createObjectURL(fileimg);
            // $(this).removeClass
            // $(this).removeClass("onweek");
            // $(this).addClass("onweek");
            // $(this).css("background-color", "red");
            $("#test").attr("src",imgURL);
            // console.log(imgURL);
            //reader.readAsDataURL(fileimg);
            // reader.readAsDataURL(fileimg);
            // reader.onloadend = function () {
            //     alert("xxxxxx");
            //     console.log(reader.result);
            //     $(this).css("background-image", reader.result);
            // }
        });
        $("#test").click(function(){
            $("#file").trigger("click");
        });
    });
     </script>
     <style>
         /*#file{*/
         /*    background-image: url("imgs/upload.png");*/
         /*}*/
        #test{
            width: 150px;
            height: 150px;
            border: 1px solid #ccc;
            background-color: transparent;
        }
    </style>
</head>
<body>
上传图片:
    <input id="file"  type="file" accept="image/*"  class="file" style="display:none"/><br />
<img id="test" src="imgs/upload.png"/>
<input type="button" id="upload" value="上传" />
<img src="imgs/wait.gif" style="display:none" id="imgWait"/>
</body>
</html>