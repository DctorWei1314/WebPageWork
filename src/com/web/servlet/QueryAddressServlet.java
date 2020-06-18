package com.web.servlet;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.web.entity.Address;
import com.web.entity.Product;
import com.web.service.userService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/user/QueryAddress")
public class QueryAddressServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("utf-8");
        String username=request.getParameter("username");
        List<Address> a_list= userService.selectAddressInfoByName(username);
        PrintWriter out=response.getWriter();
        JSONArray json=new JSONArray();
        //测试代码
//        List<Address> a_list=new ArrayList<Address>();
//        Address ta=new Address();
//        ta.setContact("fff");
//        ta.setMobile("18979228136");
//        ta.setStreet("摆驾鹤黄金基金");
//        a_list.add(ta);

        for(Address a:a_list ){
            JSONObject jo = new JSONObject();
            jo.put("contact",a.getContact());
            jo.put("street",a.getStreet());
            jo.put("mobile",a.getMobile());
            json.add(jo);
        }
        String jtext=json.toString();
        out.write(jtext);
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
