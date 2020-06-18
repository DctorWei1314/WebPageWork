function MD5() {
    var pwd=document.getElementById('password');
    var rpwd=document.getElementById('realpassword');
    rpwd.value=hex_md5(pwd.value);
    return true;
}
function encryption() {
    var pwd1=document.getElementById('p1');
    var pwd2=document.getElementById('p2');
    if (pwd1.value!=pwd2.value){
        document.getElementsByClassName('info')[0].style.display='inherit'
        return false;
    }
    else {
        var rpwd = document.getElementById('realp');
        rpwd.value = hex_md5(pwd1.value);
        document.getElementsByClassName('info')[0].style.display='none'
        return true;
    }
}
function queryl(obj) {
    let t=obj.id;
    let  condition=document.getElementById("searchCondition").value;
    QueryProduct(1,t,condition);
}
function addcart(obj,num) {

}
//评论
function score_1() {
    document.getElementById("commentscore").value=parseInt($("#stars").attr("data-default-index"))
    $("#commentForm").ajaxSubmit(function(result) {
        // 对于表单提交成功后处理，result为表单正常提交后返回的内容
        console.log(result);
    });
    document.getElementById("comment").value=""
    return false;
}
//投诉
function complaint() {
    $("#complaint").ajaxSubmit(function(result) {
        // 对于表单提交成功后处理，result为表单正常提交后返回的内容
        console.log(result);
    });
    document.getElementById("Comtext").value=""
    Querycomment(1);
    return false;
}
function commentLoad(data){
    let pathName = window.document.location.pathname;
    let projectName = pathName
        .substring(0, pathName.substr(1).indexOf('/') + 1);
    let jsonObject= jQuery.parseJSON(data);
    let pageHtml="";
    let allpages=jsonObject[0]['allpages'];
    let pageID=jsonObject[0]['pageID'];
    for (let i=1;i<=allpages;i++){
        pageHtml+="<li"+  (i==pageID?' '+'class="active"':'')  +"><a href=\"javascript:Querycomment("+i+")\">"+i+"</a></li>"
    }
    document.getElementById("page").innerHTML=pageHtml;

    let commentHtml="";
    for(let j=1;j<jsonObject.length;j++){
        commentHtml+="<div class=\"comment "+(j==jsonObject.length-1?' '+'comment-bottom'+' ':'')+"row\">\n" +
            "                        <span class=\"comment-avatar col-sm-2\">\n" +
            "                            <img src=\" "+projectName+jsonObject[j]['filePath']+ " \" alt=\"head portrait\">\n" +
            "                        </span>\n" +
            "                        <div class=\"comment-content col-sm10\">\n" +
            "                            <p class=\"comment-content-name\">"+jsonObject[j]['userId']+"</p>\n" +
            "                            <p class=\"comment-content-article\"> "+jsonObject[j]['commentContent']+" </p>\n" +
            "                            <p class=\"comment-content-footer\">\n" +
            "                                <span class=\"comment-content-footer-id\"> #"+ (((pageID-1)*20)+j) +" </span>\n" +
            "                                <span class=\"comment-content-footer-timestamp\"> "+jsonObject[j]['Timestamp']+" </span>\n" +
            "                            </p>\n" +
            "                        </div>\n" +
            "                        <div class=\"cls\"></div>\n" +
            "                    </div>"
    }
    document.getElementById("commentList").innerHTML=commentHtml;
}
function Querycomment(pageID) {
    let saleID=document.getElementById("saleID").value;
    let productname=document.getElementById("productname").value;
    let pathName = window.document.location.pathname;
    let projectName = pathName
        .substring(0, pathName.substr(1).indexOf('/') + 1);
    $.ajax({
        type: "get", // 以get方式发起请求
        url: projectName+"/getComment?saleID="+saleID+"&productname="+productname+"&pageID="+pageID, // 将你的请求参数以问号拼接到url中进行参数传递
        success(data) {
            console.log(data);
            commentLoad(data);//调用
        }
    })
}
function QueryProduct(pageID) {
    let type;
    let condition;
    let pathName = window.document.location.pathname;
    let projectName = pathName
        .substring(0, pathName.substr(1).indexOf('/') + 1);
    if(arguments.length>1){
        type=arguments[1];
        condition=arguments[2];
        if(document.getElementById("pageLabel")==null){
            window.location.href=projectName+"/shop.jsp?type="+type+"&condition="+condition;
            return;
        }
    }
    else {
        type=document.getElementById("type").value;
        condition=document.getElementById("condition").value;
    }
    $.ajax({
        type: "post", // 以get方式发起请求
        url: projectName+"/BuyerQuery",
        data:{
            "type": type,
            "condition": condition,
            "pageID": pageID,
        },
        success(data) {
            ProductLoad(data);//调用
        }
    })
}
function ProductLoad(data) {
    console.log(data);
    let pathName = window.document.location.pathname;
    let projectName = pathName
        .substring(0, pathName.substr(1).indexOf('/') + 1);
    let jsonObject= jQuery.parseJSON(data);
    let ProductPageHtml="";
    let type=jsonObject[0]['type']
    let condition=jsonObject[0]['condition']
    document.getElementById("type").value=type;
    document.getElementById("condition").value=condition;
    let allpages=jsonObject[0]['allpages'];
    let pageID=jsonObject[0]['pageID'];
    for (let i=1;i<=allpages;i++){
        ProductPageHtml+="<li"+  (i==pageID?' '+'class="active"':'')  +"><a href=\"javascript:QueryProduct("+i+")\">"+i+"</a></li>"
    }
    document.getElementById("product-page").innerHTML=ProductPageHtml;

    let ProductHtml="";
    for (let j=1;j<jsonObject.length;j++){
        ProductHtml+="            <div class=\"col-md-3 col-sm-6\">\n" +
            "                <div class=\"single-shop-product\">\n" +
            "                    <div class=\"product-upper\">\n" +
            "                        <img src="+projectName+(jsonObject[j]['mainImgFilePath'])+" alt="+(jsonObject[j]['name'])+" >\n" +
            "                    </div>\n" +
            "                    <h2><a href="+projectName+"/SingleProduct?saleID="+(jsonObject[j]['saleID'])+"&name="+(jsonObject[j]['name'])+"> "+(jsonObject[j]['name'])+" </a></h2><!--tip单品链接-->\n" +
            "                    <div class=\"product-carousel-price\">\n" +
            "                        <ins>￥"+(jsonObject[j]['price'])+"</ins> <del>￥"+(jsonObject[j]['salePrice'])+"</del>\n" +
            "                    </div>\n" +
            "                    <div class=\"product-option-shop\">\n" +
            "                        <a class=\"add_to_cart_button\" data-quantity=\"1\" data-product_sku=\"\" data-product_id=\"70\" rel=\"nofollow\"\n" +
            "                        onclick=\"addcart( " +(1)+ " ,1)\">加入购物车</a>\n" +
            "                        <!--tip加入购物车链接-->\n" +
            "                    </div>\n" +
            "                </div>\n" +
            "            </div>"
    }
    document.getElementById("product-list").innerHTML=ProductHtml;
}
function QueryAdress() {
    let pathName = window.document.location.pathname;
    let projectName = pathName
        .substring(0, pathName.substr(1).indexOf('/') + 1);
    let username=document.getElementById("username").value;
    $.ajax({
        type: "get", // 以get方式发起请求
        url: projectName+"/user/QueryAddress?username="+username,
        success(data) {
            AddressLoad(data);//调用
        }
    })
}
function AddressLoad(data) {
    console.log(data);
    let pathName = window.document.location.pathname;
    let projectName = pathName
        .substring(0, pathName.substr(1).indexOf('/') + 1);
    let jsonObject= jQuery.parseJSON(data);
    let AddressHtml="";
    for (let i=0;i<jsonObject.length;i++){
        AddressHtml+="<tr class=\"next-table-row \" role=\"row\">\n" +
            "                            <td data-next-table-col=\"0\" data-next-table-row=\"0\" class=\"next-table-cell first\"\n" +
            "                                role=\"gridcell\">\n" +
            "                                <div class=\"next-table-cell-wrapper\" data-next-table-row=\"0\" id=\"contact\">"+(jsonObject[i]['contact'])+" </div>\n" +
            "                            </td>\n" +
            "                            <td data-next-table-col=\"2\" data-next-table-row=\"0\" class=\"next-table-cell\" role=\"gridcell\">\n" +
            "                                <div class=\"next-table-cell-wrapper\" data-next-table-row=\"0\" id=\"street\"> "+(jsonObject[i]['street'])+" </div>\n" +
            "                            </td>\n" +
            "                            <td data-next-table-col=\"4\" data-next-table-row=\"0\" class=\"next-table-cell\" role=\"gridcell\">\n" +
            "                                <div class=\"next-table-cell-wrapper\" data-next-table-row=\"0\">\n" +
            "                                    <span id=\"mobile\">"+(jsonObject[i]['mobile'])+" </span></div>\n" +
            "                            </td>\n" +
            "                            <td data-next-table-col=\"5\" data-next-table-row=\"0\" class=\"next-table-cell\" role=\"gridcell\">\n" +
            "                                <div class=\"next-table-cell-wrapper\" data-next-table-row=\"0\">\n" +
            "                                    <div class=\"tAction\"><a class=\"t-change\"\n" +
            "                                                            href=\"javascript:modifyAddress($(this))\"\n" +
            "                                                            target=\"_self\">修改</a><span class=\"t-line\">|</span><a href=\"javascript:deleteAddress(this)\" \n" +
            "                                            class=\"t-delete\">删除</a></div>\n" +
            "                                </div>\n" +
            "                            </td>\n" +
            "                        </tr>"
    }
    document.getElementById("address-list").innerHTML=AddressHtml;
}
function addAddress() {
    alert("增加")
    document.getElementById("fullName").value=""
    document.getElementById("phonenumber").value=""
    document.getElementById("street").value=""
}
function modifyAddress(obj) {
    alert("修改")
    let tr=obj.parents('tr')
    let contact=tr.find("#contact").text();
    alert(contact)
    let street=tr.find("#street").text();
    let mobile=tr.find("#mobile").text();
    document.getElementById("fullName").value=contact;
    document.getElementById("phonenumber").value=mobile;
    document.getElementById("street").value=street;
}
function deleteAddress(obj) {
    alert("删除")
}
function QueryOrder(pageID) {
    let pathName = window.document.location.pathname;
    let projectName = pathName
        .substring(0, pathName.substr(1).indexOf('/') + 1);
    let username=document.getElementById("username").value;
    $.ajax({
        type: "get", // 以get方式发起请求
        url: projectName+"/user/QueryOrder?username="+username+"&pageID="+pageID,
        success(data) {
            OrderLoad(data);//调用
        }
    })
}
function OrderLoad(data) {
    console.log(data);
    let pathName = window.document.location.pathname;
    let projectName = pathName
        .substring(0, pathName.substr(1).indexOf('/') + 1);
    let jsonObject= jQuery.parseJSON(data);
    let pageHtml="";
    let allpages=jsonObject[0]['allpages'];
    let pageID=jsonObject[0]['pageID'];
    for (let i=1;i<=allpages;i++){
        pageHtml+="<li"+  (i==pageID?' '+'class="active"':'')  +"><a href=\"javascript:QueryOrder("+i+")\">"+i+"</a></li>"
    }
    document.getElementById("order-page").innerHTML=pageHtml;
    let OrdertHtml="";
    for (let j=1;j<jsonObject.length;j++){
        OrdertHtml+="<tr class=\"cart_item\">\n" +
            "                                    <td class=\"product-ID\">\n" +
            "                                        <span class=\"amount\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">"+(jsonObject[j]['orderID'])+"</font></font></span>\n" +
            "                                    </td>\n" +
            "                                    <td class=\"product-thumbnail\">\n" +
            "                                        <a href=\"single-product.html\"><img width=\"145\" height=\"145\" alt=\"商品图片\" class=\"shop_picture\" src="+projectName+(jsonObject[j]['mainImgFilePath'])+"></a>\n" +
            "                                    </td>\n" +
            "\n" +
            "                                    <td class=\"product-name\">\n" +
            "                                        <span class=\"amount\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">"+(jsonObject[j]['productName'])+"</font></font></span>\n" +
            "                                    </td>\n" +
            "\n" +
            "                                    <td class=\"product-price\">\n" +
            "                                        <span class=\"amount\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">￥"+(jsonObject[j]['price'])+"</font></font></span>\n" +
            "                                    </td>\n" +
            "\n" +
            "                                    <td class=\"product-quantity\">\n" +
            "                                        <span class=\"quantity\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">"+(jsonObject[j]['buyNumber'])+"</font></font></span>\n" +
            "                                    </td>\n" +
            "\n" +
            "                                    <td class=\"seller-ID\">\n" +
            "                                        <span class=\"S-ID\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">"+(jsonObject[j]['saleID'])+"</font></font></span>\n" +
            "                                    </td>\n" +
            "\n" +
            "                                    <td class=\"product-time\">\n" +
            "                                        <span class=\"time\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">"+(jsonObject[j]['Timestamp'])+"</font></font></span>\n" +
            "                                    </td>\n" +
            "\n" +
            "                                    <td class=\"product-status\">\n" +
            "                                        <span class=\"status\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">"+(jsonObject[j]['status'])+"</font></font></span>\n" +
            "                                    </td>\n" +
            "                                </tr>"
    }
    document.getElementById("order-list").innerHTML=OrdertHtml;
}