package com.web.servlet;

import com.alibaba.fastjson.JSONObject;
import com.web.entity.Product;
import com.web.entity.ShopCart;
import com.web.service.productService;
import com.web.util.Constant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/user/Cart")
public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type=request.getParameter("type");
        String saleID=request.getParameter("saleID");
        String name=request.getParameter("name");
        ShopCart shopCart=(ShopCart) request.getSession().getAttribute(Constant.SHOP_CART);
        JSONObject jo=new JSONObject();
        PrintWriter out=response.getWriter();
        if(type.equals("add")){
            int num=Integer.parseInt(request.getParameter("num"));
            shopCart.addProduct(saleID,name,num);
        }
        else if(type.equals("delete")){
            int orderID=shopCart.getOrderIDlist().get(saleID+name);
            Product p= productService.selectProductByProductNameSaleID(name,saleID);
            shopCart.getProducts().remove(p);
            shopCart.getOrderIDlist().remove(saleID+name);
            shopCart.deleteProduct(orderID);
        }

        jo.put("price",shopCart.cartTotalPrice());
        jo.put("num",shopCart.getProducts().size());
        String jtext=jo.toString();
        out.write(jtext);
        out.close();;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
