package com.web.servlet;

import com.web.entity.OrderSheet;
import com.web.entity.Product;
import com.web.entity.ShopCart;
import com.web.service.orderService;
import com.web.util.Constant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = "/user/PlaceOrder")
public class PlaceOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        PrintWriter out=response.getWriter();
        ShopCart shopCart=(ShopCart) request.getSession().getAttribute(Constant.SHOP_CART);
        List<Product> p_list=shopCart.getProducts();
        for (Product p:p_list){
            int orderID=shopCart.getOrderIDlist().get(p.getSaleID()+p.getName());
            orderService.updateProductStatus(orderID,2);
            //等待更新时间
            orderService.updateProductTime(orderID, new Timestamp(new Date().getTime()));
            shopCart.clearCart();
        }
        out.write("交易成功，即将跳转订单界面");
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
