package com.web.entity;

/**
 * 管理员设置全局折扣
 */
public class GlobalDiscount {
    private double discount;//全局折扣

    public GlobalDiscount(double discount) {
        this.discount = discount;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }
}
