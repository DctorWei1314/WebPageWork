package com.web.servlet;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.sun.org.apache.xpath.internal.operations.Or;
import com.web.entity.Comment;
import com.web.entity.OrderSheet;
import com.web.entity.Product;
import com.web.entity.User;
import com.web.service.orderService;
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

@WebServlet(urlPatterns = "/user/QueryOrder")
public class QueryOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("utf-8");
        String username=request.getParameter("username");
        int pageID=Integer.parseInt(request.getParameter("pageID"));
        System.out.println(username+pageID+"订单");
        List<OrderSheet> o_list=orderService.selectOrderPageByBuyerID(username,1,10);
        PrintWriter out=response.getWriter();

        JSONArray json=new JSONArray();
        JSONObject page=new JSONObject();
        int pagenum=orderService.selectOrderCountByBuyerID(username);

        page.put("allpages",pagenum%10==0?pagenum/10:pagenum/10+1);
        //page.put("allpages",1);

        page.put("pageID",pageID);
        json.add(page);

        //测试
//        List<OrderSheet> o_list=new ArrayList<OrderSheet>();
//        OrderSheet to=new OrderSheet(2,"发送的","as",20,"fddas",200,new Timestamp(System.currentTimeMillis()),1);
//        o_list.add(to);

        for(OrderSheet o :o_list ){
            JSONObject jo = new JSONObject();
            Product p=productService.selectProductByProductNameSaleID(o.getSaleID(),o.getProductName());
            jo.put("orderID",o.getOrderID());
            jo.put("mainImgFilePath",p.getMainImgFilePath());
            //jo.put("mainImgFilePath","");
            jo.put("productName",o.getProductName());
            jo.put("price",o.getPrice());
            jo.put("buyNumber",o.getBuyNumber());
            jo.put("saleID",o.getSaleID());
            if(o.getDateTime()==null){
                jo.put("Timestamp", "未交易");
            }
            else {
                jo.put("Timestamp", new SimpleDateFormat("yyyy-MM-dd").format(o.getDateTime()));
            }
            String status;
            switch (o.getStatus()){
                case 0: status="下单";break;
                case 1: status="待付款";break;
                case 2: status="已付款";break;
                case 3: status="待发货";break;
                case 4: status="已发货";break;
                case 5: status="己收货";break;
                case -1: status="已取消";break;
                default:status="未知";
            }
            jo.put("status",status);
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
