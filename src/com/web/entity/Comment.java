package com.web.entity;

import java.sql.Timestamp;

/**
 * 商品评论
 */
public class Comment {
    private String productName;//商品名称
    private String userID;//评论用户ID
    private String commentContent;//评论内容
    private Timestamp time;//评论时间

    public Comment(String productName, String userID, String commentContent, Timestamp time) {
        this.productName = productName;
        this.userID = userID;
        this.commentContent = commentContent;
        this.time = time;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }
}
