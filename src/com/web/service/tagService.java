package com.web.service;

import com.web.dao.Basedao;
import com.web.util.Constant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class tagService {

    /**
     * 管理员添加标签
     * @param tag 标签
     * @return 是否成功添加标签
     */
    //todo test
    public static Constant.MessageType insertTag(String tag) {
        Connection conn = Basedao.getconn();
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
            Basedao.closeall(null, ps, conn);
        }
        if (result > 0) {
            return Constant.MessageType.INSERT_TAG_SUCCESS;
        } else {
            return Constant.MessageType.INSERT_TAG_FAIL;
        }
    }
}
