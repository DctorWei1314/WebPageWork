package com.web.service;

import com.sun.org.apache.xerces.internal.xs.ItemPSVI;
import com.web.util.C3P0Demo;
import com.web.util.Constant;

import java.sql.*;

public class globalDiscountService {

    /**
     * 返回全局折扣
     * @return 全局折扣
     */
    public static double selectGlobalDiscount() {
        double discount = 0;
        ResultSet rs = null;
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        try {
            String sql = "select discount from global_discount";
            assert conn != null;
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                discount = rs.getDouble("discount");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3P0Demo.closeall(rs, ps, conn);
        }
        return discount;
    }

    /**
     * 更新全局折扣
     * @param discount 折扣
     * @return 是否更新成功
     */
    public static Constant.MessageType updateGlobalDiscount(double discount) {
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        int result = 0;
        try {
            String sql0 = "select * from global_discount";
            String sql=null;
            Statement temp = conn.createStatement();
            if(temp.executeQuery(sql).next()){
                sql = "update global_discount set discount = ?";
            }else{
                sql = "insert into global_discount values(?)";
            }
            temp.close();
            assert conn != null;
            ps = conn.prepareStatement(sql);
            ps.setDouble(1, discount);
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3P0Demo.closeall(null, ps, conn);
        }
        if (result > 0) {
            return Constant.MessageType.UPDATE_GLOBAL_DISCOUNT_SUCCESS;
        } else {
            return Constant.MessageType.UPDATE_GLOBAL_DISCOUNT_FAIL;
        }
    }

    public static void main(String[] args) {
//        if (Constant.MessageType.UPDATE_GLOBAL_DISCOUNT_SUCCESS == updateGlobalDiscount(0.8)) {
            System.out.println(selectGlobalDiscount());
//        }
    }
}
