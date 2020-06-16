package com.web.service;

import com.web.entity.SaleShop;
import com.web.entity.User;
import com.web.util.C3P0Demo;
import com.web.util.Constant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class shopService {
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

    public static void main(String[] args) {
            System.out.println(selectSaleInfoBySaleID("1").getDescription());
    }
}
