<%--
  Created by IntelliJ IDEA.
  User: administrator-PC
  Date: 2020/6/13
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>个人账户</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="../css/font-awesome.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/jquery-1.8.3.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.sticky.js"></script>
    <script src="../js/main.js"></script>
    <script src="../js/buyer.js"></script>
</head>
<body>
<%@include file="../common/header.jsp" %>
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
                <span class="pf-avatar-box">
                                <a class="pf-avatar">
                                    <img src="../imgs/product-2.jpg">
                                                                    </a>
                                <a href="//i.taobao.com/user/headset.htm" class="pf-edit-avatar" style="display: none;">编辑头像</a>
                            </span>
            </p>
            <p>
                <label>ID:</label>
                <label id="name">开心快乐每一天</label>
            </p>
            <p>
                <label>Eamil：</label>
                <input id="J_realname-mask" class="f-txt" type="text" value="" maxlength="6">
                <input id="J_realname" name="_fm.b._0.r" type="hidden" value="" maxlength="6">
            </p>
        </div>
        <div class="act skin-blue">
             <span class="btn n-btn">
                 <button type="submit" id="J_saveProfile">保存</button>
                 <div style="width:1px; height:1px; overflow:hidden; ">
                     <input type="submit">
                 </div>
             </span>
            <span class="btn n-btn">
                <a href="/user/Buyerlogout">
                 <button type="submit" id="exit_load" >退出登录</button>
                </a>
                 <div style="width:1px; height:1px; overflow:hidden; ">
                     <input type="submit">
                 </div>
             </span>
        </div>
        <div class="page-index">
            <div class="head"><span class="h-text">收货地址</span></div>
            <div class="cndzkEntrance" id="cndzkEntrance">
                <div>
                    <div class="cndzk-entrance-associate "><span class="cndzk-entrance-associate-title"><div
                            class="next-form-item-label"><label required="">详细地址:</label></div></span>
                        <div class="cndzk-entrance-associate-area"><textarea
                                class="cndzk-entrance-associate-area-textarea" rows="2" cols="20"
                                placeholder="请输入详细地址信息，如道路、门牌号、小区、楼栋号、单元等信息"></textarea></div>
                    </div>
                </div>
            </div>
            <form role="grid" id="myForm" class="next-form next-medium" style="width: 50%;">
                <div dir="ltr" role="row" class="next-row next-form-item next-left next-medium">
                    <div dir="ltr" role="gridcell" class="next-col next-form-item-label"><label for="fullName"
                                                                                                required="">收货人姓名:</label>
                    </div>
                    <div dir="ltr" role="gridcell" class="next-col next-col-19 next-form-item-control"><span
                            data-meta="Field" class="next-input next-medium"><input id="fullName"
                                                                                    name="fullName" height="100%"
                                                                                    autocomplete="off" value=""></span>
                    </div>
                </div>
                <div dir="ltr" role="row" class="next-row next-form-item next-left next-medium">
                    <div dir="ltr" role="gridcell" class="next-col next-form-item-label"><label for="fullName"
                                                                                                required="">电话号码:</label>
                    </div>
                    <div dir="ltr" role="gridcell" class="next-col next-col-19 next-form-item-control"><span
                            data-meta="Field" class="next-input next-medium"><input id="phonenumber"
                                                                                    name="fullName" height="100%"
                                                                                    autocomplete="off" value=""></span>
                    </div>
                </div>
                <div dir="ltr" role="row" class="next-row next-form-item next-left next-medium">
                    <div dir="ltr" role="gridcell" class="next-col next-form-item-label"><label> </label></div>
                    <div dir="ltr" role="gridcell" class="next-col next-col-19 next-form-item-control">
                        <button type="submit" class="next-btn next-medium next-btn-primary"><span
                                class="next-btn-helper">保存地址</span></button>
                    </div>
                </div>
            </form>
            <div class="addressList">
                <div class="next-table next-table-medium">
                    <table role="table">
                        <colgroup>
                            <col style="width: 70px;">
                            <col>
                            <col style="width: 200px;">
                            <col style="width: 100px;">
                            <col style="width: 140px;">
                            <col style="width: 110px;">
                            <col style="width: 90px;">
                        </colgroup>
                        <thead class="next-table-header">
                        <tr>
                            <th rowspan="1" class="next-table-cell next-table-header-node" role="gridcell">
                                <div class="next-table-cell-wrapper" data-next-table-col="0">收货人</div>
                            </th>
                            <th rowspan="1" class="next-table-cell next-table-header-node" role="gridcell">
                                <div class="next-table-cell-wrapper" data-next-table-col="2">详细地址</div>
                            </th>
                            <th rowspan="1" class="next-table-cell next-table-header-node" role="gridcell">
                                <div class="next-table-cell-wrapper" data-next-table-col="4">电话/手机</div>
                            </th>
                            <th rowspan="1" class="next-table-cell next-table-header-node" role="gridcell">
                                <div class="next-table-cell-wrapper" data-next-table-col="5">操作</div>
                            </th>

                        </tr>
                        </thead>
                        <tbody class="next-table-body"><!--tip动态增加-->
                        <tr class="next-table-row " role="row">
                            <td data-next-table-col="0" data-next-table-row="0" class="next-table-cell first"
                                role="gridcell">
                                <div class="next-table-cell-wrapper" data-next-table-row="0">蔡珍珠</div>
                            </td>
                            <td data-next-table-col="2" data-next-table-row="0" class="next-table-cell" role="gridcell">
                                <div class="next-table-cell-wrapper" data-next-table-row="0">三里街中辉凯旋城1栋2单元</div>
                            </td>
                            <td data-next-table-col="4" data-next-table-row="0" class="next-table-cell" role="gridcell">
                                <div class="next-table-cell-wrapper" data-next-table-row="0">
                                    <span>13870260868<br></span></div>
                            </td>
                            <td data-next-table-col="5" data-next-table-row="0" class="next-table-cell" role="gridcell">
                                <div class="next-table-cell-wrapper" data-next-table-row="0">
                                    <div class="tAction"><a class="t-change"
                                                            href="https://member1.taobao.com/member/fresh/deliver_address.htm?addrId=11934869224"
                                                            target="_self">修改</a><span class="t-line">|</span><span
                                            class="t-delete">删除</span></div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </form>
</div>
<%@include file="../common/footer.jsp" %>
</body>
</html>
