package com.web.entity;

/**
 * 商品标签
 */
public class ProductTag {
    private String productName;//商品名称
    private String saleID;//卖家ID
    private String tag;//商品所属标签

    public ProductTag(String productName, String saleID, String tag) {
        this.productName = productName;
        this.saleID = saleID;
        this.tag = tag;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getSaleID() {
        return saleID;
    }

    public void setSaleID(String saleID) {
        this.saleID = saleID;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }
}
