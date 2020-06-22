package com.web.service;

import com.web.entity.Address;
import com.web.entity.Comment;
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
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "select count(*) from User where name=?";
            assert conn != null;
            ps = conn.prepareStatement(sql);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            while(rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            C3P0Demo.closeall(rs, ps, conn);
        }
        if (count > 0) {
            return Constant.MessageType.USER_NAME_EXIST;
        } else {
            return Constant.MessageType.USER_NAME_NOT_EXIST;
        }
    }
    public static Constant.MessageType judgeLoginSuccessByNamePwd(String name, String pwd) {
        ResultSet rs = null;//声明结果集
        Connection conn = C3P0Demo.getconn();//获取连接对象\
        String count = null;
        PreparedStatement ps = null;
        try {
            String sql = "select password " +
                    "from user " +
                    "where name = ?";
            assert conn != null;
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            //ps.setString(2, pwd);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getString(1);
            }
            System.out.println(name+"33333"+pwd+"444"+count);
            System.out.println(count.equals(pwd));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3P0Demo.closeall(rs, ps, conn);
        }
            if (count.equals(pwd)) {
                System.out.println("succsse!!");
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
        Connection conn = C3P0Demo.getconn();//获取连接对象
        PreparedStatement ps = null;
        try {
            String sql = "select password, imgFilePath, email, defaultAddress, type " +
                    "from user " +
                    "where name = ?";
            assert conn != null;
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
                        Constant.MessageType.getUserType(rs.getString("type"))
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3P0Demo.closeall(rs, ps, conn);
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
        Connection conn = C3P0Demo.getconn();//获取连接对象
        PreparedStatement ps = null;
        try {
            String sql = "select street, mobile " +
                    "from address " +
                    "where name = ?";
            assert conn != null;
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
            C3P0Demo.closeall(rs, ps, conn);
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
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        int result = 0;
        try {
            String sql = "update user set password = ?, imgFilePath = ?," +
                    "email = ?, defaultAddress = ? where name = ?";
            assert conn != null;
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
            C3P0Demo.closeall(null, ps, conn);
        }
        if (result > 0) {
            return Constant.MessageType.UPDATE_USER_INFO_SUCCESS;
        } else {
            return Constant.MessageType.UPDATE_USER_INFO_FAIL;
        }
    }

    /**
     *  更新用户头像
     * @param name 用户名
     * @param updatedImage 更新头像
     * @return 是否更新成功
     */
    public static Constant.MessageType updateUserImage(String name, String updatedImage) {
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        int result = 0;
        try {
            String sql = "update user set imgFilePath = ?" +
                    "where name = ?";
            assert conn != null;
            ps = conn.prepareStatement(sql);
            ps.setString(1, updatedImage);
            ps.setString(2, name);
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3P0Demo.closeall(null, ps, conn);
        }
        if (result > 0) {
            return Constant.MessageType.UPDATE_USER_IMAGE_SUCCESS;
        } else {
            return Constant.MessageType.UPDATE_USER_IMAGE_FAIL;
        }
    }

    /**
     *  更新用户头像
     * @param name 用户名
     * @param email 更新头像
     * @return 是否更新成功
     */
    public static Constant.MessageType updateUserEmail(String name, String email) {
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        int result = 0;
        try {
            String sql = "update user set email = ?" +
                    "where name = ?";
            assert conn != null;
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, name);
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3P0Demo.closeall(null, ps, conn);
        }
        if (result > 0) {
            return Constant.MessageType.UPDATE_USER_IMAGE_SUCCESS;
        } else {
            return Constant.MessageType.UPDATE_USER_IMAGE_FAIL;
        }
    }
    /**
     * 根据用户名返回用户身份类型
     * @param name 用户名
     * @return 用户类型
     */
    public static Constant.MessageType selectTypeByName(String name) {
        String result = null;
        ResultSet rs = null;//声明结果集
        Connection conn = C3P0Demo.getconn();//获取连接对象
        PreparedStatement ps = null;
        try {
            String sql = "select type " +
                    "from user " +
                    "where name = ?";
            assert conn != null;
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            System.out.println(sql+rs.next());
            if (rs.next()) {
                result = rs.getString("type");
                System.out.println("XXXXXX"+result);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3P0Demo.closeall(rs, ps, conn);
        }
        assert result != null;
        switch (result) {
            case "buyer":  //1为买家2为卖家3为管理员
                return Constant.MessageType.BUYER;
            case "saler":
                return Constant.MessageType.SELLER;
            case "admin":
                return Constant.MessageType.ADMIN;
            default:
                return Constant.MessageType.UNKNOWN;
        }
    }

    /**
     * 注册新用户
     * @param user 用户基本信息
     * @return 是否注册成功
     */
    public static Constant.MessageType insertNewUser(User user) {
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        System.out.println(user.getUserPassword());
        int result = 0;
        try {
            String sql = "insert into user " +
                    "values(?, ?, ?, ?, ?, ?);";
            assert conn != null;
            ps = conn.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getUserPassword());
            ps.setString(3, user.getImgFilePath());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getDeFaultAddress());
            ps.setString(6, Constant.MessageType.insertUserType(user.getType()));
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3P0Demo.closeall(null, ps, conn);
        }
        if (result > 0) {
            return Constant.MessageType.REGISTER_SUCCESS;
        } else {
            return Constant.MessageType.REGISTER_FAIL;
        }
    }

    /**
     * 添加评论
     * @param comment 评论类
     * @return 是否成功添加评论
     */
    public static Constant.MessageType insertComment(Comment comment) {
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        int result = 0;
        try {
            String sql = "insert into comment values(?, ?, ?, ?,?)";
            assert conn != null;
            ps = conn.prepareStatement(sql);
            ps.setString(1, comment.getProductName());
            ps.setString(2, comment.getSaleID());
            ps.setString(3, comment.getUserID());
            ps.setString(4, comment.getCommentContent());
            ps.setTimestamp(5, comment.getTime());
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3P0Demo.closeall(null, ps, conn);
        }
        if (result > 0) {
            return Constant.MessageType.INSERT_COMMENT_SUCCESS;
        } else {
            return Constant.MessageType.INSERT_COMMENT_FAIL;
        }
    }



    public static void main(String[] args) {
//        if (updateUserImage("1", "1") == Constant.MessageType.UPDATE_USER_IMAGE_SUCCESS) {
//            System.out.println("yes");
//        }
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
//        User user = new User("4","1","img/default.jpg",  "2", "1", Constant.MessageType.BUYER);
//        insertNewUser(user);
//        System.out.println(selectBasicInfoByName("2").getEmail());
//        if (Constant.MessageType.REGISTER_SUCCESS == insertNewUser(user)) {
//            System.out.println(Constant.MessageType.REGISTER_SUCCESS);
//        }
//               System.out.println(selectBasicInfoByName("1").getImgFilePath());

    }
}
