package com.web.servlet;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.web.entity.Comment;
import com.web.entity.Product;
import com.web.entity.User;
import com.web.service.productService;
import com.web.service.userService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/getComment")
public class getCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("utf-8");
        String saleID=request.getParameter("saleID");
        String productname=request.getParameter("productname");
        int pageID=Integer.parseInt(request.getParameter("pageID"));
        System.out.println(saleID+productname+pageID);
        List<Comment>c_list =productService.selectCommentPageByProduct(productname,saleID,pageID,20);
//        List<Comment>c_list=new ArrayList<Comment>();
//        Comment comment=new Comment("横行","霸道","65122","网上评论", new Timestamp(System.currentTimeMillis()));
//        c_list.add(comment);
        PrintWriter out=response.getWriter();

        JSONArray json=new JSONArray();
        JSONObject page=new JSONObject();
        int pagenum=productService.selectCommentCountByProduct(productname,saleID);
        page.put("allpages",pagenum%20==0?pagenum/20:pagenum/20+1);
        page.put("pageID",pageID);
//        page.put("allpages",3);
//        page.put("pageID",pageID);
        json.add(page);
        for(Comment c :c_list ){
            User user= userService.selectBasicInfoByName(c.getUserID());
            JSONObject jo = new JSONObject();
            jo.put("userId", c.getUserID());
            jo.put("commentContent", c.getCommentContent());
            jo.put("Timestamp", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(c.getTime()));
            jo.put("filePath",user.getImgFilePath());
//            jo.put("filePath","sss");
            json.add(jo);
        }
        String jtext=json.toString();
        out.write(jtext);
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

}
