package com.web.dao;
import java.sql.*;

public class Basedao {

    private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    private static final String DB_URL = "jdbc:mysql://localhost:3306/shop";
    private static final String USER = "root";
    private static final String PASS = "1234";

    public static Connection getconn() {
        try {
            Class.forName(JDBC_DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(DB_URL,USER,PASS);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static int exectuIUD(String sql, Object[] params) {
        int count = 0;
        Connection conn = Basedao.getconn();
        PreparedStatement ps = null;
        try {
            ps = conn.prepareStatement(sql);
            for(int i=0; i<params.length; i++) {
                ps.setObject(i+1, params[i]);
            }
            count = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Basedao.closeall(null, ps, conn);
        }
        return count;
    }

    public static void closeall(ResultSet rs, PreparedStatement ps, Connection conn) {
        try {
            if(rs != null)
                rs.close();
            if(ps!=null)
                ps.close();
            if(conn!=null)
                conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws SQLException {
        String sql = "SELECT count(*) FROM user where user_id = ?";
        int count;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = Basedao.getconn();
        try {
            ps = conn.prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String id = "1";
        assert ps != null;
        ps.setString(1, id);
        try {
            rs = ps.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        assert rs != null;
        while(rs.next()) {
            count = rs.getInt(1);
            System.out.println(count);
        }
        Basedao.closeall(rs, ps, conn);
    }
}


