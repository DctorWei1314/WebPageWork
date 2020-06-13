package com.web.entity;

/**
 * 买家的地址
 */

public class Address {
    private String contact;//收货人
    private String street;//详细地址
    private String mobile;//联系电话
    public Address() {
    }

    public Address(String contact, String street, String mobile) {
        this.contact = contact;
        this.mobile = mobile;
        this.street = street;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }
}
