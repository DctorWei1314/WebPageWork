package com.web.service;

import com.web.entity.SaleShop;
import com.web.util.C3P0Demo;
import com.web.util.Constant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class shopService {

    /**
     * 根据店铺ID得到商店信息
     * @param saleID 店铺ID
     * @return 商店信息
     */
    public static SaleShop selectSaleInfoBySaleID(String saleID) {
        SaleShop saleShop = null;
        ResultSet rs = null;//声明结果集
        Connection conn = C3P0Demo.getconn();//获取连接对象
        PreparedStatement ps = null;
        try {
            String sql = "select * " +
                    "from saleShop " +
                    "where saleID = ?";
            assert conn != null;
            ps = conn.prepareStatement(sql);
            ps.setString(1, saleID);
            rs = ps.executeQuery();
            if (rs.next()) {
                saleShop = new SaleShop(
                        saleID,
                        rs.getString("saleAddress"),
                        rs.getString("description"),
                        rs.getString("title")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3P0Demo.closeall(rs, ps, conn);
        }
        return saleShop;
    }

    /**
     * 更新店铺信息
     * @param saleShop 店铺实体类
     * @return 是否更新成功
     */
    public static Constant.MessageType updateSaleInfo(SaleShop saleShop) {
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        int result = 0;
        try {
            String sql = "update saleShop set saleAddress = ?, description = ?, title = ?" +
                    " where saleID = ?";
            assert conn != null;
            ps = conn.prepareStatement(sql);
            ps.setString(1, saleShop.getSaleAddress());
            ps.setString(2, saleShop.getDescription());
            ps.setString(3, saleShop.getTitle());
            ps.setString(4, saleShop.getSaleID());
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3P0Demo.closeall(null, ps, conn);
        }
        if (result > 0) {
            return Constant.MessageType.UPDATE_SALE_INFO_SUCCESS;
        } else {
            return Constant.MessageType.UPDATE_SALE_INFO_FAIL;
        }
    }

    /**
     * 添加新店铺
     * @param saleShop 店铺实体类
     * @return 是否添加成功
     */
    public static Constant.MessageType insertNewSaleShop(SaleShop saleShop) {
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        int result = 0;
        try {
            String sql = "insert into saleShop " +
                    "values(?, ?, ?, ?)";
            assert conn != null;
            ps = conn.prepareStatement(sql);
            ps.setString(1, saleShop.getSaleID());
            ps.setString(2, saleShop.getSaleAddress());
            ps.setString(3, saleShop.getDescription());
            ps.setString(4, saleShop.getTitle());
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3P0Demo.closeall(null, ps, conn);
        }
        if (result > 0) {
            return Constant.MessageType.INSERT_SALE_SHOP_SUCCESS;
        } else {
            return Constant.MessageType.INSERT_SALE_SHOP_FAIL;
        }
    }

    public static void main(String[] args) {
        SaleShop saleShop = new SaleShop(
                "2",
                "2",
                "3",
                "4"
        );
        if (Constant.MessageType.UPDATE_SALE_INFO_SUCCESS == updateSaleInfo(saleShop))
            System.out.println(Constant.MessageType.INSERT_SALE_SHOP_SUCCESS);
    }
}
