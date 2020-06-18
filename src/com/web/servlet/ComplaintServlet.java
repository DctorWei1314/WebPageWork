package com.web.servlet;

import com.web.entity.Comment;
import com.web.entity.Report;
import com.web.entity.User;
import com.web.service.reportService;
import com.web.util.Constant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

@WebServlet(urlPatterns = "/user/Complaint")
public class ComplaintServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out=response.getWriter();
        User user=(User) request.getSession().getAttribute(Constant.USER_SESSION);
        String userid;
        if (user!=null)
            userid=user.getUserID();
        else userid="未知";
        String saleID=request.getParameter("saleID");
        String description=request.getParameter("description");
        Timestamp time= new Timestamp(System.currentTimeMillis());
        Report report=new Report(userid,saleID,description,time);
        if(reportService.insertReport(report)==Constant.MessageType.INSERT_REPORT_SUCCESS){
            out.write("success");
        }
        else {
            out.write("fail");
        }
        out.close();
        System.out.println(description+saleID+userid);//测试
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
