package com.web.service;

import com.web.entity.Comment;
import com.web.entity.Product;
import com.web.util.C3P0Demo;
import com.web.util.Constant;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class productService {

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

    /**
     * 得到某一个商品的所有标签
     * @param productName 商品名称
     * @param saleId 商品所属店铺ID
     * @return 某一个商品的所有标签
     */
    public static List<String> selectTagByProduct(String productName, String saleId) {
        List<String> list = new ArrayList<>();
        ResultSet rs = null;
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        try {
            String sql = "select distinct tag from product_tag where saleID = ? and product_name = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, saleId);
            ps.setString(2, productName);
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

    /**
     * 根据某个商品的标签返回拥有此标签商品的数量
     * @param tag 标签
     * @return 拥有此标签商品的数量
     */
    public static int selectProductCountByTag(String tag) {
        ResultSet rs = null;
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        int count = 0;
        try {
            String sql = "select count(*) from product_tag where tag = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, tag);
            rs = ps.executeQuery();
            while (rs.next()) {
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
     * 根据某个店铺ID返回在此店铺中商品的数量
     * @param saleID 店铺ID
     * @return 在此店铺中商品的数量
     */
    public static int selectProductCountBySaleID(String saleID) {
        ResultSet rs = null;
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        int count = 0;
        try {
            String sql = "select count(*) from product where saleID = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, saleID);
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
     * 根据商品名称返回此商品评论数量
     * @param productName 商品名称
     * @return 此商品评论数量
     */
    public static int selectCommentCountByProduct(String productName) {
        ResultSet rs = null;
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        int count = 0;
        try {
            String sql = "select count(*) from comment where product_name = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, productName);
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
     * 获取某个标签下产品的分页列表
     * @param number 当前页号
     * @param size 每页要显示最多的数量
     * @param tag 标签
     * @return 分页商品列表
     */
    public static List<Product> selectProductPageByTag(String tag, int number, int size){
        List<Product> products = new ArrayList<>();
        ResultSet rs = null;
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        try{
            int productCount = selectProductCountByTag(tag);
            if(productCount > 0){
                String sql = "select * from product " +
                        " where name in ("
                        +" select product_name from product_tag where tag =?)" +
                        " order by price DESC LIMIT ?,?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, tag);
                ps.setInt(2, (number - 1) * size);
                ps.setInt(3, size);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Product product = new Product(
                            rs.getString("name"),
                            rs.getString("saleID"),
                            rs.getString("image"),
                            rs.getString("image1"),
                            rs.getString("image2"),
                            rs.getString("image3"),
                            rs.getString("image4"),
                            rs.getDouble("score"),
                            rs.getInt("scoreNumber"),
                            rs.getInt("saleNumber"),
                            rs.getInt("leftNumber"),
                            rs.getDouble("price"),
                            rs.getDouble("discount"),
                            rs.getDouble("salePrice"),
                            rs.getString("description")
                    );
                    products.add(product);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            C3P0Demo.closeall(rs, ps, conn);
        }
        return products;
    }

    /**
     * 获取某个店铺中含有的产品分页列表
     * @param saleID 店铺ID
     * @param number 当前页号
     * @param size 每页要显示最多的数量
     * @return 分页商品列表
     */
    public static List<Product> selectProductPageBySaleID(String saleID, int number, int size){
        List<Product> products = new ArrayList<>();
        ResultSet rs = null;
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        try{
            int productCount = selectProductCountBySaleID(saleID);
            if(productCount > 0){
                String sql = "select * from product " +
                        " where saleID = ?"+
                        " order by price DESC LIMIT ?,?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, saleID);
                ps.setInt(2, (number - 1) * size);
                ps.setInt(3, size);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Product product = new Product(
                            rs.getString("name"),
                            rs.getString("saleID"),
                            rs.getString("image"),
                            rs.getString("image1"),
                            rs.getString("image2"),
                            rs.getString("image3"),
                            rs.getString("image4"),
                            rs.getDouble("score"),
                            rs.getInt("scoreNumber"),
                            rs.getInt("saleNumber"),
                            rs.getInt("leftNumber"),
                            rs.getDouble("price"),
                            rs.getDouble("discount"),
                            rs.getDouble("salePrice"),
                            rs.getString("description")
                    );
                    products.add(product);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            C3P0Demo.closeall(rs, ps, conn);
        }
        return products;
    }

    /**
     * 根据产品标题模糊查询，返回分页列表
     * @param name 查询内容
     * @return 分页对象
     */
    public static List<Product> selectProductByLikeName(String name) {
        List<Product> products = new ArrayList<>();
        if(name != null){
            name = name.replaceAll("%", "\\%");
        }
        ResultSet rs = null;
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        try{
            String sql = "select * from product " +
                    " where name like ?"+
                    " order by name DESC";
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getString("name"),
                        rs.getString("saleID"),
                        rs.getString("image"),
                        rs.getString("image1"),
                        rs.getString("image2"),
                        rs.getString("image3"),
                        rs.getString("image4"),
                        rs.getDouble("score"),
                        rs.getInt("scoreNumber"),
                        rs.getInt("saleNumber"),
                        rs.getInt("leftNumber"),
                        rs.getDouble("price"),
                        rs.getDouble("discount"),
                        rs.getDouble("salePrice"),
                        rs.getString("description")
                );
                products.add(product);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            C3P0Demo.closeall(rs, ps, conn);
        }
        return products;
    }

    /**
     * 根据商品名称返回分页评论列表
     * @param productName 商品名称
     * @param number 当前页号
     * @param size 每页要显示最多的数量
     * @return 分页评论列表
     */
    public static List<Comment> selectCommentPageByProduct(String productName, int number, int size) {
        List<Comment> comments = new ArrayList<>();
        ResultSet rs = null;
        Connection conn = C3P0Demo.getconn();
        PreparedStatement ps = null;
        try{
            int commentCount = selectCommentCountByProduct(productName);
            if(commentCount > 0){
                String sql = "select * from comment " +
                        " where product_name = ?"+
                        " order by product_name DESC LIMIT ?,?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, productName);
                ps.setInt(2, (number - 1) * size);
                ps.setInt(3, size);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Comment comment = new Comment(
                            rs.getString("product_name"),
                            rs.getString("userID"),
                            rs.getString("commentContent"),
                            rs.getTimestamp("time")
                    );
                    comments.add(comment);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            C3P0Demo.closeall(rs, ps, conn);
        }
        return comments;
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
            String sql = "insert into comment values(?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, comment.getProductName());
            ps.setString(2, comment.getUserID());
            ps.setString(3, comment.getCommentContent());
            ps.setTimestamp(4, comment.getTime());
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

    /**
     *
     * @param productName 产品名
     * @param saleID 店铺名
     * @param number 当前页号
     * @param size 每页要显示最多的数量
     * @return 相关产品列表
     */
    public List<Product> selectRelatedProduct(String productName, String saleID, int number, int size){
        List<Product> products = new ArrayList<>();
        List<String> strings = selectTagByProduct(productName, saleID);
        if (strings.size() > 0) {
            String tag = strings.get(0);
            products = selectProductPageByTag(tag, number, size);
        }
        return products;
    }

    /**
     * 根据商品名称和店铺名称获取商品详细信息
     * @param productName 商品名称
     * @param saleID 店铺名称
     * @return 商品详细信息
     */
    public static Product selectProductByProductNameSaleID(String productName, String saleID) {
        Product product = null;
        ResultSet rs = null;//声明结果集
        Connection conn = C3P0Demo.getconn();//获取连接对象
        PreparedStatement ps = null;
        try {
            String sql = "select * " +
                    "from product " +
                    "where name = ? and saleID = ?";
            assert conn != null;
            ps = conn.prepareStatement(sql);
            ps.setString(1, productName);
            ps.setString(2, saleID);
            rs = ps.executeQuery();
            if (rs.next()) {
                product = new Product(
                        productName,
                        saleID,
                        rs.getString("image"),
                        rs.getString("image1"),
                        rs.getString("image2"),
                        rs.getString("image3"),
                        rs.getString("image4"),
                        rs.getDouble("score"),
                        rs.getInt("scoreNumber"),
                        rs.getInt("saleNumber"),
                        rs.getInt("leftNumber"),
                        rs.getDouble("price"),
                        rs.getDouble("discount"),
                        rs.getDouble("salePrice"),
                        rs.getString("description")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            C3P0Demo.closeall(rs, ps, conn);
        }
        return product;
    }

    public static void main(String[] args) {
//        System.out.println(selectProductByProductNameSaleID("199", "1").getDescription());
//        String date = "2019-07-16 19:20:00";
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        Timestamp timestamp = null;
//        try {
//            Date dt = sdf.parse(date);
//            timestamp = new Timestamp(dt.getTime());
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        Comment comment = new Comment(
//                "2",
//                "2",
//                "不好吃",
//                timestamp
//        );
//        if (insertComment(comment) == Constant.MessageType.INSERT_COMMENT_SUCCESS) {
//            System.out.println(Constant.MessageType.INSERT_COMMENT_SUCCESS);
//        }
    }
}
