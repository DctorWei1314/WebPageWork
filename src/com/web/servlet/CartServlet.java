package com.web.servlet;

import com.alibaba.fastjson.JSONObject;
import com.web.entity.Product;
import com.web.entity.ShopCart;
import com.web.entity.User;
import com.web.service.productService;
import com.web.util.Constant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(urlPatterns = "/user/Cart")
public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type=(String)request.getParameter("type");
        ShopCart shopCart=(ShopCart) request.getSession().getAttribute(Constant.SHOP_CART);

        JSONObject jo=new JSONObject();
        PrintWriter out=response.getWriter();
        System.out.println(new String("add").equals(type)+"!!!");
        if(new String("add").equals(type)){
            String saleID=request.getParameter("saleID");
            String name=request.getParameter("name");
            int num=Integer.parseInt(request.getParameter("num"));
            shopCart.addProduct(saleID,name,num);
            System.out.println("add"+saleID+name+num);//测试
        }
        else if(type.equals("delete")){
            String saleID=request.getParameter("saleID");
            String name=request.getParameter("name");
            int orderID=shopCart.getOrderIDlist().get(saleID+name);
            Product p= productService.selectProductByProductNameSaleID(name,saleID);
            List<Product>p_list=shopCart.getProducts();
            for (Product tp:p_list){
                if(p.getName().equals(tp.getName())&&p.getSaleID().equals(tp.getSaleID())){
                    p_list.remove(tp);
                    break;
                }
            }
            shopCart.getOrderIDlist().remove(saleID+name);
            shopCart.deleteProduct(orderID);
            System.out.println("delete"+saleID+name);//测试
        }
        else if (type.equals("update")){
            System.out.println("update");//测试
            List<Product> p_list=shopCart.getProducts();
            for (Product p:p_list){
                String num=request.getParameter(p.getSaleID()+p.getName());
                if (num!=null&&Integer.parseInt(num)!=shopCart.buyNumber(p)){
                    int orderID=shopCart.getOrderIDlist().get(p.getSaleID()+p.getName());
                    shopCart.updateBuyNumber(orderID,Integer.parseInt(num));
                }
            }
        }

        jo.put("price",shopCart.cartTotalPrice());
        jo.put("num",shopCart.getProducts().size());
        String jtext=jo.toString();
        System.out.println(jtext);
        out.write(jtext);
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //doPost(request, response);
    }
}
