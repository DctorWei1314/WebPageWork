package com.web.util;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//用该类获得connection，释放Connection，PreparedStatement，ResultSet相关对象也不要自己close，交给它的静态方法，不要自己防范空指针
public class C3P0Demo {
    private static ComboPooledDataSource c3p0 = new ComboPooledDataSource("c3p0");
    public static Connection getconn(){
        try {
            return c3p0.getConnection();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static void close(Connection conn) throws SQLException {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
                throw e;
            }
        }
    }
    public static void close(PreparedStatement pstate) throws SQLException {
        if(pstate!=null){
            pstate.close();
        }
    }
    public static void close(ResultSet rs) throws SQLException {
        if(rs!=null){
            rs.close();
        }
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
}
