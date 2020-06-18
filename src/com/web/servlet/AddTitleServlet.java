package com.web.servlet;

import com.web.service.shopService;
import com.web.util.Constant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import static com.web.util.Constant.T_LIST;

@WebServlet("/AddTitleServlet")
public class AddTitleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String title = request.getParameter("title");
//        Constant.MessageType result = shopService.updateSaleInfo(title);
//        if(result == Constant.MessageType.UPDATE_SALE_INFO_SUCCESS) {
//            PrintWriter out = response.getWriter();
//            out.print("<script> alert('头衔赋予成功！'); window.location='admin_report.jsp' </script>");
//            out.flush();
//            out.close();
//        }
    }
}
