package com.web.servlet;

import com.web.entity.Comment;
import com.web.entity.User;
import com.web.service.productService;
import com.web.service.userService;
import com.web.util.Constant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;

@WebServlet(urlPatterns = "/user/Comment")
public class CommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out=response.getWriter();
        String comment=request.getParameter("comment");
        String productname=request.getParameter("productname");
        String saleID=request.getParameter("saleID");
        User user=(User)(request.getSession().getAttribute(Constant.USER_SESSION));
        String userid;
        if (user!=null)
            userid=user.getUserID();
        else userid="未知";
        Timestamp time= new Timestamp(System.currentTimeMillis());
        Comment comment1=new Comment(productname,saleID,userid,comment,time);
        //添加评论

        if(userService.insertComment(comment1)==Constant.MessageType.INSERT_COMMENT_SUCCESS){
            out.write("评论成功，感谢你的支持，您的支持就是对我们最大的鼓励");
        }
        else {
            out.write("评论失败");
        }
        out.close();
        System.out.println(comment+productname+saleID+userid);//测试
        int score=Integer.parseInt(request.getParameter("score"));
        //添加评分
        productService.updateProductScore(productname,saleID,score);
        System.out.println("评分"+score);//测试

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
