function changeDiscount(obj) {
    var para1 = document.getElementById("dis").value;
    var para2 = document.getElementById("count").value;
    var discount = para1 + "." + para2;
    if(confirm("您即将把最NB商城的全局折扣为" + discount + "是否继续？")) {
        var href = obj.getAttribute("href");//获取超链接路径
        var hrefNew = href + para1 + "." + para2;//路径加参数
        obj.setAttribute("href", hrefNew);
    }
    else
        obj.setAttribute("href", "#");
}

function addTag(obj) {
    var tag = document.getElementById("tag").value;
   if(confirm("您将要在最NB商城中添加一个" + tag + "标签，是否继续？")) {
       var href = obj.getAttribute("href");
       var hrefNew = href + tag;
       obj.setAttribute("href", hrefNew);
   }
   else
       obj.setAttribute("href", "#");
}
function addTitle(obj) {
    var tag = document.getElementById("title").value;
    alert(tag);
        var href = obj.getAttribute("href");
        var hrefNew = href +tag;
        obj.setAttribute("href", hrefNew);
}