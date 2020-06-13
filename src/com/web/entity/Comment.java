package com.web.entity;

/**
 * 商品评论
 */
public class Comment {
    private String productName;//商品名称
    private String userID;//评论用户ID
    private String commentContent;//评论内容
    private String time;//评论时间

    public Comment(String productName, String userID, String commentContent, String time) {
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

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
