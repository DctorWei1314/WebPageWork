package com.web.service;

import com.web.dao.Basedao;
import com.web.util.Constant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class orderService {

//    /**
//     * 更新商品数量
//     * @param productName 产品名
//     * @param buyNumber 用户购买商品数量
//     * @return 是否更新数量成功
//     */
//    public static Constant.MessageType updateProductNumber(String productName, int buyNumber) {
//        assert buyNumber > 0;
//        Connection conn = Basedao.getconn();
//        PreparedStatement ps = null;
//        int result = 0;
//        try {
//
//            String sql = "update product set saleNumber = ?, leftNumber = ? " +
//                    "where name = ?";
//            ps = conn.prepareStatement(sql);
//            ps.setDouble(1, );
//            ps.setDouble(1, user.getUserPassword());
//            ps.setString(3, productName);
//            result = ps.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            Basedao.closeall(null, ps, conn);
//        }
//        if (result > 0) {
//            return Constant.MessageType.UPDATE_USER_INFO_SUCCESS;
//        } else {
//            return Constant.MessageType.UPDATE_USER_INFO_FAIL;
//        }
//    }

}
