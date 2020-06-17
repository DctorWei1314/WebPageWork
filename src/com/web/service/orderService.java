package com.web.service;

import com.web.entity.OrderSheet;
import com.web.util.C3P0Demo;
import com.web.util.Constant;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class orderService {

    /**
     * 更新商品状态
     * @param orderID 订单ID
     * @param status 状态
     * @return 是否修改成功
     */
    public static Constant.MessageType updateProductStatus(int orderID, int status) {
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        int result = 0;
        try {
            String sql = "update ordersheet SET state=? WHERE order_id=?";
            assert conn != null;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, orderID);
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3P0Demo.closeall(null, ps, conn);
        }
        if (result > 0) {
            return Constant.MessageType.UPDATE_PRODUCT_STATE_SUCCESS;
        } else {
            return Constant.MessageType.UPDATE_PRODUCT_STATE_FAIL;
        }
    }

    /**
     * 添加订单
     * @param order 订单
     * @return 是否添加订单成功
     */
    public static Constant.MessageType insertOrder(OrderSheet order){
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        int result = 0;
        try {
            String sql = "INSERT INTO ordersheet"
                    + " VALUES(?,?,?,?,?,?,?,?)";
            assert conn != null;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, order.getOrderID());
            ps.setString(2, order.getSaleID());
            ps.setString(3, order.getProductName());
            ps.setInt(4, order.getBuyNumber());
            ps.setString(5, order.getBuyerID());
            ps.setDouble(6, order.getPrice());
            ps.setTimestamp(7, order.getDateTime());
            ps.setDouble(8, order.getStatus());
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3P0Demo.closeall(null, ps, conn);
        }
        if (result > 0) {
            return Constant.MessageType.INSERT_ORDER_SUCCESS;
        } else {
            return Constant.MessageType.INSERT_ORDER_FAIL;
        }
    }

    /**
     * 获取指定编号的订单
     * @param orderID 订单编号
     * @return 订单
     */
    public static OrderSheet selectOrderByOrderID(int orderID) {
        OrderSheet orderSheet = null;
        ResultSet rs = null;//声明结果集
        Connection conn = C3P0Demo.getconn();//获取连接对象
        PreparedStatement ps = null;
        try {
            String sql = "select * " +
                    "from orderSheet " +
                    "where order_id = ?";
            assert conn != null;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, orderID);
            rs = ps.executeQuery();
            if (rs.next()) {
                orderSheet = new OrderSheet(
                        orderID,
                        rs.getString("saleID"),
                        rs.getString("product_name"),
                        rs.getInt("buyNumber"),
                        rs.getString("buyer"),
                        rs.getDouble("price"),
                        rs.getTimestamp("time"),
                        rs.getInt("state")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3P0Demo.closeall(rs, ps, conn);
        }
        return orderSheet;
    }

    /**
     * 根据店铺ID返回订单列表
     * @param saleID 店铺ID
     * @return 订单列表
     */
    public static List<OrderSheet> selectOrderListBySaleIDState(String saleID, int state) {
        List<OrderSheet> orderSheets = new ArrayList<>();
        OrderSheet orderSheet = null;
        ResultSet rs = null;//声明结果集
        Connection conn = C3P0Demo.getconn();//获取连接对象
        PreparedStatement ps = null;
        try {
            String sql = "select * " +
                    "from orderSheet " +
                    "where saleID = ? and state = ?";
            assert conn != null;
            ps = conn.prepareStatement(sql);
            ps.setString(1, saleID);
            ps.setInt(2, state);
            rs = ps.executeQuery();
            if (rs.next()) {
                orderSheet = new OrderSheet(
                        rs.getInt("order_id"),
                        saleID,
                        rs.getString("product_name"),
                        rs.getInt("buyNumber"),
                        rs.getString("buyer"),
                        rs.getDouble("price"),
                        rs.getTimestamp("time"),
                        rs.getInt("state")
                );
                orderSheets.add(orderSheet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3P0Demo.closeall(rs, ps, conn);
        }
        return orderSheets;
    }

    /**
     * 选出买家用户的订单数量
     * @param buyerID 买家用户
     * @return 买家用户的订单数量
     */
    public static int selectOrderCountByBuyerID(String buyerID) {
        ResultSet rs = null;
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        int count = 0;
        try {
            String sql = "select count(*) from ordersheet where buyer = ?";
            assert conn != null;
            ps = conn.prepareStatement(sql);
            ps.setString(1, buyerID);
            rs = ps.executeQuery();
            if(rs.next()) {
                count =  rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3P0Demo.closeall(rs, ps, conn);
        }
        return count;
    }

    /**
     * 选出购买者所有的订单分页
     * @param buyID 购买者用户
     * @param number 当前页号
     * @param size 每页要显示最多的数量
     * @return 订单列表
     */
    public static List<OrderSheet> selectOrderPageByBuyerID(String buyID, int number, int size){
        List<OrderSheet> orderSheets = new ArrayList<>();
        ResultSet rs = null;
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        try{
            int productCount = selectOrderCountByBuyerID(buyID);
            if(productCount > 0){
                String sql = "select * from ordersheet " +
                        " where buyer = ?"+
                        " order by time DESC LIMIT ?,?";
                assert conn != null;
                ps = conn.prepareStatement(sql);
                ps.setString(1, buyID);
                ps.setInt(2, (number - 1) * size);
                ps.setInt(3, size);
                rs = ps.executeQuery();
                while (rs.next()) {
                    OrderSheet orderSheet = new OrderSheet(
                            rs.getInt("order_id"),
                            rs.getString("saleID"),
                            rs.getString("product_name"),
                            rs.getInt("buyNumber"),
                            rs.getString("buyer"),
                            rs.getDouble("price"),
                            rs.getTimestamp("time"),
                            rs.getInt("state")
                    );
                    orderSheets.add(orderSheet);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            C3P0Demo.closeall(rs, ps, conn);
        }
        return orderSheets;
    }

    /**
     * 选出购买者所有的订单
     * @param buyID 购买者用户
     * @return 订单列表
     */
    public static List<OrderSheet> selectAllOrdeByBuyerID(String buyID){
        List<OrderSheet> orderSheets = new ArrayList<>();
        ResultSet rs = null;
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        try{
            int productCount = selectOrderCountByBuyerID(buyID);
            if(productCount > 0){
                String sql = "select * from ordersheet " +
                        " where buyer = ?"+
                        " order by time";
                assert conn != null;
                ps = conn.prepareStatement(sql);
                ps.setString(1, buyID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    OrderSheet orderSheet = new OrderSheet(
                            rs.getInt("order_id"),
                            rs.getString("saleID"),
                            rs.getString("product_name"),
                            rs.getInt("buyNumber"),
                            rs.getString("buyer"),
                            rs.getDouble("price"),
                            rs.getTimestamp("time"),
                            rs.getInt("state")
                    );
                    orderSheets.add(orderSheet);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            C3P0Demo.closeall(rs, ps, conn);
        }
        return orderSheets;
    }


    public static void main(String[] args) {
        for (OrderSheet orderSheet : selectOrderListBySaleIDState("1", 2)) {
            System.out.println(orderSheet.getDateTime());
        }
//        System.out.println(selectOrderPageByBuyerID("1", 1, 10).size());
//        String date = "2019-07-16 19:20:00";
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        Timestamp timestamp = null;
//        try {
//            Date dt = sdf.parse(date);
//            timestamp = new Timestamp(dt.getTime());
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        OrderSheet orderSheet = new OrderSheet(
//                2,
//                "2",
//                "cx坤",
//                100,
//                "3",
//                200,
//                timestamp,
//                1
//        );
//        if (insertOrder(orderSheet) == Constant.MessageType.INSERT_ORDER_SUCCESS) {
//            System.out.println(Constant.MessageType.INSERT_ORDER_SUCCESS);
//        }
    }
}