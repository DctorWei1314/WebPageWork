<%@ page import="com.web.service.shopService" %>
<%@ page import="com.web.entity.SaleShop" %><%--
  Created by IntelliJ IDEA.
  User: 无索魏
  Date: 2020/6/15
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商家账户信息</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    <script src="js/main.js"></script>
    <script>
        $(function () {
            $("#test").click(function(){
                $("#file").trigger("click");
            });
            $("#file").change(function(){
                var fileimg = $(this)[0].files[0];
                // var reader = new FileReader();
                var URL = window.URL || window.webkitURL;
                // 通过 file 生成目标 url
                $(this)[0].state ="true";
                var imgURL = URL.createObjectURL(fileimg);
                $("#test").attr("src",imgURL);
            });
            $("#J_saveProfile").click(function () {
                $("#test").attr("src","imgs/wait.gif");
                var formData = new FormData();
                if (document.getElementById("file").state == "true"){
                    formData.append("image", document.getElementById("file").files[0]);
                }
                formData.append("saledescription", document.getElementById("J_realname-mask").value);
                formData.append("saleaddresss", document.getElementById("saleaddresss").value);
                $.ajax({
                    url: "ImageUploadServlet",
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
                        //alert(result);
                    },
                    error: function () {
                        alert("上传失败！");
                    }
                });
            });
        });
    </script>
</head>
<body>
<%@include file="common/header.jsp"%>
<div class="sns-nf">
    <form id="baseInfoForm" name="baseInfoForm" method="post" class="infoForm">
        <input name="_tb_token_" type="hidden" value="3bf0e5e737b13">
        <input type="hidden" name="action" value="user/baseInfoSetAction">
        <input type="hidden" name="event_submit_do_save_or_update_base_info_setting" value="1">
        <input type="hidden" name="redirectURL" value="">
        <input type="hidden" id="J_occupation_view" value="">
        <input type="hidden" id="J_home_url" value="$itaobaoServer.setTarget('json/school_json.htm')">
        <div id="main-profile" class="parts">
            <p>
                <label>当前头像：</label>
                <span >
                                <a class="pf-avatar">
                                    <input id="file"  state="false" type="file" accept="image/*"  class="file" style="display:none"/><br />
                                     <img id="test" style="width:100px;height:100px"src="<%=user.getImgFilePath()==null?"imgs/default_portrait.jpg":new String("imgs/"+user.getImgFilePath()) %>">
                                                                    </a>
                            </span>
            </p>
            <p>
                <label>ID:</label>
                <label id="name"><%=user.getName()%></label>
            </p>
            <%
                SaleShop saleShop = shopService.selectSaleInfoBySaleID(user.getName());
            %>
            <p>
                <label>商家描述：</label>
                <input name="saledescription" id="J_realname-mask" class="f-txt" type="text" value="<%=saleShop.getDescription()==null?"":saleShop.getDescription()%>" maxlength="6">
                <input id="J_realname" name="_fm.b._0.r" type="hidden" value="" maxlength="6">
            </p>
            <p>
                <label>商家地址：</label>
                <input  id="saleaddresss" class="f-txt" type="text" value="<%=saleShop.getSaleAddress()==null?"":saleShop.getSaleAddress()%>" maxlength="6">
                <input  name="_fm.b._0.r" type="hidden" value="" maxlength="6">
            </p>
            <p>
                <label>管理员授予头衔：</label>
                <input  id="saletitle" class="f-txt" type="text" readonly="readonly" value="<%=saleShop.getTitle()==null?"":saleShop.getTitle()%>" maxlength="6">
                <input  name="_fm.b._0.r" type="hidden" value="" maxlength="6">
            </p>
        </div>
        <div class="act skin-blue">
             <span class="btn n-btn">
                 <button type="submit" id="J_saveProfile">修改</button>
                 <div style="width:1px; height:1px; overflow:hidden; ">
                     <input type="submit">
                 </div>
             </span>
        </div>
    </form>
</div>
<%@include file="common/footer.jsp"%>
</body>
</html>
