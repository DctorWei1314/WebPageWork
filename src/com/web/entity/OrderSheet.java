package com.web.entity;

import java.sql.Timestamp;

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
    private Timestamp dateTime;//交易时间
    private int status;//订单状态：1,2,3,4,

    public OrderSheet(int orderID, String saleID, String productName, int buyNumber, String buyerID, double price, Timestamp dateTime, int status) {
        this.orderID = orderID;
        this.saleID = saleID;
        this.productName = productName;
        this.buyNumber = buyNumber;
        this.buyerID = buyerID;
        this.price = price;
        this.dateTime = dateTime;
        this.status = status;
    }

    public static String statusToSalerString(int status) {
        switch (status) {
            case 2:
                return "未处理";
            case 3:
                return "已同意";
            case 4:
                return "已拒绝";
            default:
                return "unknown";
        }
    }

    public static String statusToBuyerString(int status) {
        switch (status) {
            case 1:
                return "未交易";
            case 2:
                return "待确认";
            case 3:
                return "成功出货";
            case 4:
                return "拒绝出货,金额已退";
            default:
                return "unknown";
        }
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

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
