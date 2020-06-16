package com.web.util;

public class Constant {
    public static String USER_SESSION="USER_SESSION";
    public static String P_LIST="P_LIST";
    public static String Q_TYPE="Q_TYPE";
    public static String T_LIST="T_LIST";
    public static String CONDITION="CONDITION";
    public static String PAGE="PAGE";
    public static String PAGE_NUM="PAGE_NUM";
    public static String SINGLE_PRODUCT="SINGLE_PRODUCT";
    public static String SHOP_CART="SHOP_CART";
    public enum Querytype{
        PRODUCT,
        SELLERID,
        LABEL,
        ALL
    }
    //返回信息类型
    public enum MessageType {
        BUYER,                                  //买家
        SELLER,                                 //卖家
        ADMIN,                                  //管理员
        UNKNOWN,                                //身份不明确
        USER_NAME_EXIST,                        //存在此用户
        USER_NAME_NOT_EXIST,                    //不存在此用户名
        UPDATE_USER_INFO_SUCCESS,               //更新用户信息成功
        UPDATE_USER_INFO_FAIL,                  //更新用户信息失败
        UPDATE_PRODUCT_STATE_SUCCESS,           //更新商品状态成功
        UPDATE_PRODUCT_STATE_FAIL,              //更新商品状态失败
        UPDATE_SALE_INFO_SUCCESS,               //更新店铺信息成功
        UPDATE_SALE_INFO_FAIL,                  //更新店铺信息失败
        LOGIN_SUCCESS,                          //登录成功
        LOGIN_FAIL,                             //登录失败
        REGISTER_SUCCESS,                       //注册成功
        REGISTER_FAIL,                          //注册失败
        INSERT_TAG_SUCCESS,                     //管理员添加商品标签成功
        INSERT_TAG_FAIL,                        //管理员添加商品标签失败
        UPDATE_GLOBAL_DISCOUNT_SUCCESS,         //管理员更新全局折扣成功
        UPDATE_GLOBAL_DISCOUNT_FAIL,            //管理员更新全局折扣失败
        INSERT_COMMENT_SUCCESS,                 //买家用户添加商品评论成功
        INSERT_COMMENT_FAIL,                    //买家用户添加商品评论失败
        INSERT_ORDER_SUCCESS,                   //添加订单成功
        INSERT_ORDER_FAIL,                      //添加订单失败
        INSERT_SALE_SHOP_SUCCESS,               //添加店铺成功
        INSERT_SALE_SHOP_FAIL;                  //添加店铺失败

        public static MessageType getUserType(String result) {
            switch (result) {
                case "buyer":
                    return MessageType.BUYER;
                case "saler":
                    return MessageType.SELLER;
                case "admin":
                    return MessageType.ADMIN;
                default:
                    return MessageType.UNKNOWN;
            }
        }

        public static String insertUserType(MessageType messageType) {
            switch (messageType) {
                case BUYER:
                    return "buyer";
                case SELLER:
                    return "saler";
                case ADMIN:
                    return "admin";
                default:
                    return "unknown";
            }
        }
    }

    private static MessageType testLogin() {
        return MessageType.LOGIN_SUCCESS;
    }

    public static void main(String[] args) {
        System.out.println(MessageType.LOGIN_SUCCESS);
        System.out.println(MessageType.LOGIN_FAIL);
        if (MessageType.LOGIN_SUCCESS == testLogin()) {
            System.out.println(MessageType.LOGIN_SUCCESS);
        } else {
            System.out.println(MessageType.LOGIN_FAIL);
        }
    }
}
