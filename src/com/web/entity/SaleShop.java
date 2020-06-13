package com.web.entity;

/**
 * 卖家商店实体类
 */
public class SaleShop {
    private String saleID;//商店ID
    private String saleAddress;//商店地址
    private String description;//商家描述
    private String title;//商店头衔

    public SaleShop(String saleID, String saleAddress, String description, String title) {
        this.saleID = saleID;
        this.saleAddress = saleAddress;
        this.description = description;
        this.title = title;
    }

    public String getSaleID() {
        return saleID;
    }

    public void setSaleID(String saleID) {
        this.saleID = saleID;
    }

    public String getSaleAddress() {
        return saleAddress;
    }

    public void setSaleAddress(String saleAddress) {
        this.saleAddress = saleAddress;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
