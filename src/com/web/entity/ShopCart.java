package com.web.entity;

import java.util.*;

import com.web.service.globalDiscountService;
import com.web.service.orderService;
import com.web.service.productService;
import com.web.util.Constant;


/**
 * 购物车实体类
 */

public class ShopCart {
    private int size;//单页尺寸
    private String buyer;//购买者
    private List<Product> products = new ArrayList<>();//购物车中商品列表
    private Map<String, Integer> orderIDlist = new HashMap<>();
    //private List<OrderSheet> orderSheets;//订单列表

    private int pageCount;//总共的页数量

    /**
     * 返回购买商品数量
     * @param product 商品实体类
     * @return 购买数量
     */
    public int buyNumber(Product product) {
        if(orderIDlist==null)
            return 0;
        if (orderIDlist.containsKey(product.getSaleID()+product.getName())){
            int orderID=orderIDlist.get(product.getSaleID()+product.getName());
            OrderSheet orderSheet=orderService.selectOrderByOrderID(orderID);
            if(orderSheet!=null){
                return orderSheet.getBuyNumber();
            }
        }
//        for (OrderSheet orderSheet :orderSheets) {
//            if (orderSheet.getProductName().equals(product.getName()) &&
//            orderSheet.getSaleID().equals(product.getSaleID())) {
//                return orderSheet.getBuyNumber();
//            }
//        }
        return 0;
    }

    /**
     * 删除某个订单所对应的商品
     * @param orderID ID
     * @return 是否删除成功
     */
    public Constant.MessageType deleteProduct(int orderID) {
        return orderService.deleteProductByOrderID(orderID);
    }

    /**
     * 根据订单ID 和 更改后的购买数量 返回是否更新购买数量成功
     * @param orderID 订单ID
     * @param buyNumber 更改后的购买数量
     * @return 是否更新购买数量成功
     */
    public Constant.MessageType updateBuyNumber(int orderID, int buyNumber) {
        return orderService.updateProductBuyNumber(orderID, buyNumber);
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
        return product.getSalePrice();
    }
    /**
     * 清空购物车
     */
    public void clearCart(){
        products.clear();
        orderIDlist.clear();
    }
    /**
     * 享购物车增加商品
     */
    public void addProduct(String saleID,String productName,int num) {
        if(orderIDlist==null){
            Product p=productService.selectProductByProductNameSaleID(productName,saleID);
            int orderID=genegrate();
            OrderSheet orderSheet=new OrderSheet(orderID,saleID,productName,num,buyer,num*price(p),null,1);
            orderService.insertOrder(orderSheet);
            Map<String, Integer> orderIDlist =new HashMap();
            orderIDlist.put(saleID + productName,orderID);
            products.add(p);
        }else if(orderIDlist.containsKey(saleID+productName)){
            int orderID=orderIDlist.get(saleID+productName);
            int snum=orderService.selectOrderByOrderID(orderID).getBuyNumber();
            orderService.updateProductBuyNumber(orderID, snum+num);
        }
        else {
            Product p=productService.selectProductByProductNameSaleID(productName,saleID);
            int orderID=genegrate();
            OrderSheet orderSheet=new OrderSheet(orderID,saleID,productName,num,buyer,num*price(p),null,1);
            orderService.insertOrder(orderSheet);
            orderIDlist.put(saleID+productName,orderID);
            products.add(p);
        }
    }
    /**
     * 生成不重复订单码，希望能重写
     */
    public int genegrate(){
        return (int)new Date().getTime();
    }

    public ShopCart() {
    }

    public ShopCart(String buyer, int size) {
        this.size = size;
        this.buyer = buyer;
        List<OrderSheet> orderSheets = orderService.selectNoPayOrderByBuyerID(buyer);
        for (OrderSheet orderSheet : orderSheets) {
            Product product = productService.selectProductByProductNameSaleID(orderSheet.getProductName(),orderSheet.getSaleID());
            products.add(product);
            orderIDlist.put(orderSheet.getSaleID()+orderSheet.getProductName(),orderSheet.getOrderID());
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

    public Map<String, Integer> getOrderIDlist() {
        return orderIDlist;
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

//    public List<OrderSheet> getOrderSheets() {
//        return orderSheets;
//    }
//
//    public void setOrderSheets(List<OrderSheet> orderSheets) {
//        this.orderSheets = orderSheets;
//    }
    //增加商品，设置商品数量，删除商品
}
