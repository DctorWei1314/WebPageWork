package com.web.service;

import com.web.util.C3P0Demo;
import com.web.util.Constant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class tagService {

    /**
     * 管理员添加标签
     * @param tag 标签
     * @return 是否成功添加标签
     */
    public static Constant.MessageType insertTag(String tag) {
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        int result = 0;
        try {
            String sql = "insert into tag values(?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, tag);
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3P0Demo.closeall(null, ps, conn);
        }
        if (result > 0) {
            return Constant.MessageType.INSERT_TAG_SUCCESS;
        } else {
            return Constant.MessageType.INSERT_TAG_FAIL;
        }
    }

    /**
     * 得到所有的商品标签
     * @return 所有标签
     */
    public static List<String> selectAllTag() {
        List<String> list = new ArrayList<>();
        ResultSet rs = null;
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        try {
            String sql = "select * from tag";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
                list.add(rs.getString("tag"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3P0Demo.closeall(rs, ps, conn);
        }
        return list;
    }

    public static void main(String[] args) {
        for (String string : selectAllTag()) {
            System.out.println(string);
        }
    }
}
