package com.web.entity;

/**
 * 商品实体类，最多5张图片
 * name商品名称 && shopID 作为复合主键
 */

public class Product {
    private String name;//商品名称
    private String saleID;//所属卖家ID
    private String mainImgFilePath;//主图片路径
    //其余4张图片 默认为null
    private String image1;
    private String image2;
    private String image3;
    private String image4;
    private double score;//商品评分
    private int scoreNumber;//评分人数
    private int saleNumber;//售出数量
    private int leftNumber;//库存数量
    private double price;//定价
    private double discount;//折扣
    private double salePrice;//售价
    private String description;//商品描述

    public Product() {
    }

    public Product(String name, String saleID, String mainImgFilePath, String image1,
                   String image2, String image3, String image4,
                   double score, int scoreNumber, int saleNumber, int leftNumber,
                   double price, double discount, double salePrice, String description) {
        this.name = name;
        this.saleID = saleID;
        this.mainImgFilePath = mainImgFilePath;
        this.image1 = image1;
        this.image2 = image2;
        this.image3 = image3;
        this.image4 = image4;
        this.score = score;
        this.scoreNumber = scoreNumber;
        this.saleNumber = saleNumber;
        this.leftNumber = leftNumber;
        this.price = price;
        this.discount = discount;
        this.salePrice = salePrice;
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getLeftNumber() {
        return leftNumber;
    }

    public void setLeftNumber(int leftNumber) {
        this.leftNumber = leftNumber;
    }

    public int getSaleNumber() {
        return saleNumber;
    }

    public void setSaleNumber(int saleNumber) {
        this.saleNumber = saleNumber;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(double salePrice) {
        this.salePrice = salePrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSaleID() {
        return saleID;
    }

    public void setSaleID(String saleID) {
        this.saleID = saleID;
    }

    public String getMainImgFilePath() {
        return mainImgFilePath;
    }

    public void setMainImgFilePath(String mainImgFilePath) {
        this.mainImgFilePath = mainImgFilePath;
    }

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getImage3() {
        return image3;
    }

    public void setImage3(String image3) {
        this.image3 = image3;
    }

    public String getImage4() {
        return image4;
    }

    public void setImage4(String image4) {
        this.image4 = image4;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public int getScoreNumber() {
        return scoreNumber;
    }

    public void setScoreNumber(int scoreNumber) {
        this.scoreNumber = scoreNumber;
    }
}
