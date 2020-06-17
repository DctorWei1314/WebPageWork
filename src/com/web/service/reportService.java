package com.web.service;

import com.web.entity.Report;
import com.web.util.C3P0Demo;
import com.web.util.Constant;
import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

    /**
     * 添加投诉
     * @param report 投诉实体类
     * @return 是否添加投诉成功
     */
    public static Constant.MessageType insertReport(Report report){
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        int result = 0;
        try {
            String sql = "INSERT INTO report"
                    + " VALUES(?,?,?,?)";
            assert conn != null;
            ps = conn.prepareStatement(sql);
            ps.setString(1, report.getReportUserID());
            ps.setString(2, report.getReportedShopID());
            ps.setString(3, report.getDescription());
            ps.setTimestamp(4, report.getReportTime());
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3P0Demo.closeall(null, ps, conn);
        }
        if (result > 0) {
            return Constant.MessageType.INSERT_REPORT_SUCCESS;
        } else {
            return Constant.MessageType.INSERT_REPORT_FAIL;
        }
    }

    public static void main(String[] args) {
//        for (Report report : selectAllReport()) {
//            System.out.println(report.getDescription());
//        }
        String date = "2019-07-16 19:20:00";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Timestamp timestamp = null;
        try {
            Date dt = sdf.parse(date);
            timestamp = new Timestamp(dt.getTime());
        } catch (Exception e) {
            e.printStackTrace();
        }
        Report report = new Report(
                "4",
                "2",
                "不好吃",
                timestamp
        );
        if (insertReport(report) == Constant.MessageType.INSERT_REPORT_SUCCESS) {
            System.out.println(Constant.MessageType.INSERT_REPORT_SUCCESS);
        }
    }

}
