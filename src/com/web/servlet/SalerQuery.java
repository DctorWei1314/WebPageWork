package com.web.servlet;

import com.alibaba.fastjson.JSONObject;
import com.web.entity.SaleShop;
import com.web.entity.User;
import com.web.service.shopService;
import com.web.service.userService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/SalerQuery")
public class SalerQuery extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("utf-8");
        String condition = request.getParameter("condition");
        PrintWriter out=response.getWriter();
        SaleShop saleShop = shopService.selectSaleInfoBySaleID(condition);
        User user = userService.selectBasicInfoByName(condition);
        JSONObject saler=new JSONObject();
        saler.put("title",saleShop.getTitle());
        saler.put("description",saleShop.getDescription());
        saler.put("adrress",saleShop.getSaleAddress());
        saler.put("image",user.getImgFilePath());
        out.write(saler.toString());
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
