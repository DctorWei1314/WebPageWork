package com.web.entity;

import com.web.util.Constant;

import javax.jms.Message;

/**
 * 用户类
 */

public class User {
    private String name; //用户ID
    private String userPassword; //密码
    private String imgFilePath; //头像地址
    private String email;//电子邮件
    private String deFaultAddress;//买家默认地址卖家为NULL
    private Constant.MessageType type;//1为买家2为卖家3为管理员

    public User() {

    }

    public User(String name, String userPassword, String imgFilePath, String email, String deFaultAddress, Constant.MessageType type) {
        this.name = name;
        this.userPassword = userPassword;
        this.imgFilePath = imgFilePath;
        this.email = email;
        this.deFaultAddress = deFaultAddress;
        this.type = type;
    }

    public String getUserID() {
        return name;
    }

    public void setUserID(String name) {
        this.name = name;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getImgFilePath() {
        return imgFilePath;
    }

    public void setImgFilePath(String imgFilePath) {
        this.imgFilePath = imgFilePath;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Constant.MessageType getType() {
        return type;
    }

    public void setType(Constant.MessageType type) {
        this.type = type;
    }

    public String getDeFaultAddress() {
        return deFaultAddress;
    }

    public void setDeFaultAddress(String deFaultAddress) {
        this.deFaultAddress = deFaultAddress;
    }
}
