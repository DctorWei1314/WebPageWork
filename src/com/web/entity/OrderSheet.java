package com.web.entity;

/**
 * 订单
 */

public class OrderSheet {
    private int orderID;//订单编号
    private String saleID;//卖家ID
    private String productName;//商品名称
    private int buyNumber;//购买数量
    private String buyerID;//买家ID
    private double price;//商品价格
    private String dateTime;//交易时间
    private int status;//订单状态：0下单,1待付款,2已付款,3待发货,4已发货, 5己收货,-1已取消

    public OrderSheet(int orderID, String saleID, String productName, int buyNumber, String buyerID, double price, String dateTime, int status) {
        this.orderID = orderID;
        this.saleID = saleID;
        this.productName = productName;
        this.buyNumber = buyNumber;
        this.buyerID = buyerID;
        this.price = price;
        this.dateTime = dateTime;
        this.status = status;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getSaleID() {
        return saleID;
    }

    public void setSaleID(String saleID) {
        this.saleID = saleID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getBuyNumber() {
        return buyNumber;
    }

    public void setBuyNumber(int buyNumber) {
        this.buyNumber = buyNumber;
    }

    public String getBuyerID() {
        return buyerID;
    }

    public void setBuyerID(String buyerID) {
        this.buyerID = buyerID;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
