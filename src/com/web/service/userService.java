package com.web.service;

import com.web.dao.Basedao;
import com.web.entity.Address;
import com.web.entity.User;
import com.web.util.C3P0Demo;
import com.web.util.Constant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 用户相关的业务逻辑类
 */

public class userService {

    /**
     * 根据用户名判断是否存在此用户
     * @param userName 用户名
     * @return 用户名是否存在
     */
    public static Constant.MessageType judgeExistByName(String userName) {
        int count = 0;
        Connection conn = Basedao.getconn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "select count(*) from User where name=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            while(rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            Basedao.closeall(rs, ps, conn);
        }
        if (count > 0) {
            return Constant.MessageType.USER_NAME_EXIST;
        } else {
            return Constant.MessageType.USER_NAME_NOT_EXIST;
        }
    }

    /**
     * 根据用户名和密码判断是否登陆成功
     * @param name 用户姓名
     * @param pwd 用户密码
     * @return 是否登陆成功
     */
    public static Constant.MessageType judgeLoginSuccessByNamePwd(String name, String pwd) {
        ResultSet rs = null;//声明结果集
        Connection conn = Basedao.getconn();//获取连接对象\
        int count = 0;
        PreparedStatement ps = null;
        try {
            String sql = "select count(*) " +
                    "from user " +
                    "where name = ? and password = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, pwd);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Basedao.closeall(rs, ps, conn);
        }
        if (count > 0) {
            return Constant.MessageType.LOGIN_SUCCESS;
        } else {
            return Constant.MessageType.LOGIN_FAIL;
        }
    }

    /**
     * 通过用户名查询用户信息
     * @param name 用户ID
     * @return 用户基本信息 如果为null则不存在此用户
     */
    public static User selectBasicInfoByName(String name) {
        User u = null;
        ResultSet rs = null;//声明结果集
        Connection conn = Basedao.getconn();//获取连接对象
        PreparedStatement ps = null;
        try {
            String sql = "select password, imgFilePath, email, defaultAddress, type " +
                    "from user " +
                    "where name = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            if (rs.next()) {
                u = new User(
                        name,
                        rs.getString("password"),
                        rs.getString("imgFilePath"),
                        rs.getString("email"),
                        rs.getString("defaultAddress"),
                        rs.getInt("type")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Basedao.closeall(rs, ps, conn);
        }
        return u;
    }

    /**
     * 通过用户名得到用户的其他收货地址
     * @param name 用户名
     * @return 地址列表
     */
    public static List<Address> selectAddressInfoByName(String name) {
        List<Address> addresses = new ArrayList<>();
        ResultSet rs = null;//声明结果集
        Connection conn = Basedao.getconn();//获取连接对象
        PreparedStatement ps = null;
        try {
            String sql = "select street, mobile " +
                    "from address " +
                    "where name = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while(rs.next()) {
                addresses.add(
                    new Address(name, rs.getString("street"),
                            rs.getString("mobile"))
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Basedao.closeall(rs, ps, conn);
        }
        return addresses;
    }

    /**
     *更新用户信息
     * @param name 用户名
     * @param user 更新后用户实体类
     * @return 是否更新用户信息成功
     */
    public static Constant.MessageType updateUserInfo(String name, User user) {
        Connection conn = Basedao.getconn();
        PreparedStatement ps = null;
        int result = 0;
        try {
            String sql = "update user set password = ?, imgFilePath = ?," +
                    "email = ?, defaultAddress = ? where name = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUserPassword());
            ps.setString(2, user.getImgFilePath());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getDeFaultAddress());
            ps.setString(5, name);
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Basedao.closeall(null, ps, conn);
        }
        if (result > 0) {
            return Constant.MessageType.UPDATE_USER_INFO_SUCCESS;
        } else {
            return Constant.MessageType.UPDATE_USER_INFO_FAIL;
        }
    }

    /**
     * 根据用户名返回用户身份类型
     * @param name 用户名
     * @return 用户类型
     */
    public static Constant.MessageType selectTypeByName(String name) {
        int result = 0;
        ResultSet rs = null;//声明结果集
        Connection conn = Basedao.getconn();//获取连接对象
        PreparedStatement ps = null;
        try {
            String sql = "select type " +
                    "from user " +
                    "where name = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getInt("type");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Basedao.closeall(rs, ps, conn);
        }
        if (result == 1) { //1为买家2为卖家3为管理员
            return Constant.MessageType.BUYER;
        } else if (result == 2){
            return Constant.MessageType.SELLER;
        } else if (result == 3) {
            return Constant.MessageType.ADMIN;
        } else {
            return Constant.MessageType.UNKNOWN;
        }
    }

    /**
     * 注册新用户
     * @param user 用户基本信息
     * @return 是否注册成功
     */
    public static Constant.MessageType insertNewUser(User user) {
        Connection conn = Basedao.getconn();
        PreparedStatement ps = null;
        int result = 0;
        try {
            String sql = "insert into user " +
                    "values(?, ?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getUserPassword());
            ps.setString(3, user.getImgFilePath());
            ps.setString(5, user.getEmail());
            ps.setString(6, user.getDeFaultAddress());
            ps.setInt(7, user.getType());
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Basedao.closeall(null, ps, conn);
        }
        if (result > 0) {
            return Constant.MessageType.REGISTER_SUCCESS;
        } else {
            return Constant.MessageType.REGISTER_FAIL;
        }
    }

    public static void main(String[] args) {
//        if (judgeExistByName("1") == Constant.MessageType.USER_NAME_EXIST) {
//            System.out.println(Constant.MessageType.USER_NAME_EXIST);
//        }
//        User user = selectBasicInfoByNamePwd("1","1");
//        System.out.println(user.getEmail());
//        System.out.println(selectTypeByName("1"));
//        if (Constant.MessageType.LOGIN_SUCCESS == judgeLoginSuccessByNamePwd("1","1")) {
//            System.out.println(Constant.MessageType.LOGIN_SUCCESS);
//        }
//        List<Address> addresses = selectAddressInfoByName("1");
//        for (Address address :addresses) {
//            System.out.println(address.getStreet() + "\n" + address.getMobile());
//        }
//        updateUserBalance("1", 100);
        User user = new User("2","1","img/default.jpg",  "2", "1", 2);
//        insertNewUser(user);
        System.out.println(selectBasicInfoByName("2").getEmail());
//        if (Constant.MessageType.UPDATE_USER_INFO_SUCCESS == updateUserInfo("1", user)) {
//            System.out.println(Constant.MessageType.UPDATE_USER_INFO_SUCCESS);
//        }

    }
}
