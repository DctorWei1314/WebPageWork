package com.web.util;

public class Constant {
    public static String USER_SESSION="USER_SESSION";
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
        INSERT_SALE_SHOP_FAIL,                  //添加店铺失败
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
