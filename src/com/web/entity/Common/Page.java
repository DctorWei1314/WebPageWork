package com.web.entity.Common;


import java.io.Serializable;
import java.util.List;


/**
 * 分页数据实体类
 * @param <T>
 */
public class Page<T> implements Serializable{

    private int number;//从1开始的页号
    private int size;//每页要返回的记录数
    private int totalElements;//总记录数
    private int totalPages;//页数，通过计算得出
    private List<T> items;//前页的数据集合

    public Page(){}

    public Page(int number, int size){
        this.number = number;
        this.size = size;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getTotalElements() {
        return totalElements;
    }

    public void setTotalElements(int totalElements) {
        this.totalElements = totalElements;
    }

    public int getTotalPages() {
        if(totalElements % size == 0){
            totalPages = (totalElements / size);
        }else{
            totalPages = (totalElements / size + 1);
        }
        return totalPages;
    }

    @SuppressWarnings("unused")
    private void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public List<T> getItems() {
        return items;
    }

    public void setItems(List<T> items) {
        this.items = items;
    }

    @Override
    public String toString() {
        return "Page [number=" + number + ", size=" + size + ", totalElements="
                + totalElements + ", totalPages="
                + ", items=" + items + "]";
    }
}
