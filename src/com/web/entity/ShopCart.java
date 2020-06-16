package com.web.entity;

import java.util.ArrayList;
import java.util.List;
import com.web.service.globalDiscountService;
import com.web.service.orderService;
import com.web.service.productService;



/**
 * 购物车实体类
 */

public class ShopCart {
    private int size;//单页尺寸
    private String buyer;//购买者
    private List<Product> products = new ArrayList<>();//购物车中商品列表
    private List<OrderSheet> orderSheets;//订单列表
    private int pageCount;//总共的页数量

    /**
     * 返回购买商品数量
     * @param product 商品实体类
     * @return 购买数量
     */
    public int buyNumber(Product product) {
        for (OrderSheet orderSheet :orderSheets) {
            if (orderSheet.getProductName().equals(product.getName()) &&
            orderSheet.getSaleID().equals(product.getSaleID())) {
                return orderSheet.getBuyNumber();
            }
        }
        return 0;
    }

    public static void main(String[] args){
        ShopCart shopCart = new ShopCart("1", 10);
        for (Product product : shopCart.productPage(1)) {
            System.out.println(shopCart.buyNumber(product) + "\n" +
                    shopCart.price(product) +"\n"
            + shopCart.productTotalPrice(product));
        }
        System.out.println(shopCart.cartTotalPrice());
    }

    /**
     * 获得分页商品
     * @param number 页码
     * @return 分页商品列表
     */
    public List<Product> productPage(int number) {
        assert number <= pageCount;
        int begin = (number - 1) * size, end = number * size;
        List<Product> productPageList = new ArrayList<>();
        for (int i = begin; i < end && i < products.size(); i++) {
            productPageList.add(products.get(i));
        }
        return productPageList;
    }

    /**
     * 某个商品总价格
     * @param product 商品
     * @return 某个商品总价格
     */
    public double productTotalPrice(Product product) {
        return buyNumber(product) * price(product);
    }

    /**
     * 购物车总价格
     * @return 购物车总价格
     */
    public double cartTotalPrice() {
        double res = 0;
        for (Product product : products) {
            res += productTotalPrice(product);
        }
        return res;
    }

    /**
     * 折扣后的价格
     * @return 折扣后的价格
     */
    public double price(Product product) {
        double discount = globalDiscountService.selectGlobalDiscount();
        return product.getDiscount() * product.getPrice() * discount;
    }

    public ShopCart() {
    }

    public ShopCart(String buyer, int size) {
        this.size = size;
        this.buyer = buyer;
        orderSheets = orderService.selectAllOrdeByBuyerID(buyer);
        for (OrderSheet orderSheet : orderSheets) {
            Product product = productService.selectProductByProductNameSaleID(orderSheet.getProductName(),orderSheet.getSaleID());
            products.add(product);
        }
        if (products.size() % size == 0) {
            pageCount = products.size() / size;
        } else {
            pageCount = products.size() / size + 1;
        }
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
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

    public List<OrderSheet> getOrderSheets() {
        return orderSheets;
    }

    public void setOrderSheets(List<OrderSheet> orderSheets) {
        this.orderSheets = orderSheets;
    }
}
