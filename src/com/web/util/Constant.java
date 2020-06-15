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
        UPDATE_BALANCE_SUCCESS,                 //更新账户余额成功
        UPDATE_BALANCE_FAIL,                    //更新账户余额失败
        LOGIN_SUCCESS,                          // 登录成功
        LOGIN_FAIL,                             // 登录失败
        REGISTER_SUCCESS,                       // 注册成功
        REGISTER_FAIL,                          // 注册失败
    };

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
