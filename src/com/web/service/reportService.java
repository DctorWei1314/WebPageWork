package com.web.service;

import com.web.entity.Report;
import com.web.util.C3P0Demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class reportService {
    /**
     * 返回投诉列表
     * @return 投诉列表
     */
    public static List<Report> selectAllReport() {
        List<Report> list = new ArrayList<>();
        ResultSet rs = null;
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        try {
            String sql = "select * from report";
            assert conn != null;
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
                Report report = new Report(
                        rs.getString("reportUserID"),
                        rs.getString("reportedShopID"),
                        rs.getString("description"),
                        rs.getTimestamp("reportTime")
                );
                list.add(report);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3P0Demo.closeall(rs, ps, conn);
        }
        return list;
    }

    public static void main(String[] args) {
        for (Report report : selectAllReport()) {
            System.out.println(report.getDescription());
        }
    }

}
