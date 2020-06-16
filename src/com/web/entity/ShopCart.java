package com.web.entity;

import java.util.List;

/**
 * 购物车实体类
 */

public class ShopCart {
    String buyer;//购买者
    List<Product> products;//购物车中的商品

    public ShopCart() {
    }

    public ShopCart(String buyer, List<Product> products) {
        this.buyer = buyer;
        this.products = products;
    }

    public String getBuyer() {
        return buyer;
    }

    public void setBuyer(String buyer) {
        this.buyer = buyer;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }
}
