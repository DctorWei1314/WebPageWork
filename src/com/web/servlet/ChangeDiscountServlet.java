package com.web.servlet;

import com.web.entity.GlobalDiscount;
import com.web.service.globalDiscountService;
import com.web.util.Constant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/ChangeDiscountServlet")
public class ChangeDiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        double discount = Double.parseDouble(request.getParameter("discount"));
        Constant.MessageType result = globalDiscountService.updateGlobalDiscount(discount);
        if(result == Constant.MessageType.UPDATE_GLOBAL_DISCOUNT_SUCCESS) {
            PrintWriter out = response.getWriter();
            out.print("<script> alert('折扣修改成功！'); window.location='admin_dis.jsp' </script>");
            out.flush();
            out.close();
        }
    }
}
