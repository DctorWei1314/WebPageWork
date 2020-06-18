package com.web.servlet;

import com.web.service.orderService;
import com.web.util.Constant;
import org.apache.commons.fileupload.FileItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import com.web.service.orderService;
import com.web.util.Constant;
@WebServlet("/SalerOrderServlet")
public class SalerOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter printWriter = response.getWriter();
        String order = request.getParameter("orderID");
        System.out.println(order);
        int status = Integer.parseInt(request.getParameter("status"));
        System.out.println(status);
        Constant.MessageType type = orderService.updateProductStatus(Integer.parseInt(order),status);
        //数据库
        if(type == Constant.MessageType.UPDATE_PRODUCT_STATE_SUCCESS){
            printWriter.write("成功");
        }
        else if(type == Constant.MessageType.UPDATE_PRODUCT_STATE_FAIL){
            printWriter.write("失败");
        }
        printWriter.close();
    }
}