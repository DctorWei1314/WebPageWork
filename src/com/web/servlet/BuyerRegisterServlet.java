package com.web.servlet;

import com.web.entity.SaleShop;
import com.web.entity.ShopCart;
import com.web.entity.User;
import com.web.service.shopService;
import com.web.service.userService;
import com.web.util.Constant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(urlPatterns = "/BuyerRegister")
public class BuyerRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        String select = request.getParameter("select");
        System.out.println(select);
        //User user= userService.
        System.out.println(password);
        User user=new User();
        user.setUserID(genegrateID());
        user.setEmail(email);
        user.setType(Constant.MessageType.getUserType(select));
        user.setUserPassword(password);
        user.setImgFilePath("imgs/default_portrait.jpg");
        PrintWriter out=response.getWriter();
        if (userService.insertNewUser(user)==Constant.MessageType.REGISTER_SUCCESS){
            request.getSession().setAttribute(Constant.USER_SESSION,user);
            if(user.getType() == Constant.MessageType.BUYER){
                ShopCart shopCart=new ShopCart(user.getUserID(),10);
                request.getSession().setAttribute(Constant.SHOP_CART,shopCart);
                out.write(user.getUserID());
            }
            else if(user.getType() == Constant.MessageType.SELLER){
                SaleShop saleShop = new SaleShop(user.getUserID(),null,null,null);
                shopService.insertNewSaleShop(saleShop);
                out.write(user.getUserID());
            }
        }
        else {
            out.write("fail");
        }
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    private String genegrateID(){
        return Integer.toHexString((int) new Date().getTime());
    }
}
