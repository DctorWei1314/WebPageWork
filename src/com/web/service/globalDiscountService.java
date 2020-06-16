package com.web.service;

import com.web.dao.Basedao;
import com.web.entity.User;
import com.web.util.C3P0Demo;
import com.web.util.Constant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class globalDiscountService {
    public static Constant.MessageType updateGlobalDiscount(double discount) {
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        int result = 0;
        try {
            String sql = "update global_discount set discount = ?";
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
        if (Constant.MessageType.UPDATE_GLOBAL_DISCOUNT_SUCCESS == updateGlobalDiscount(0.8)) {
            System.out.println("yes");
        }
    }
}
