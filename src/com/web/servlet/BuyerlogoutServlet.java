package com.web.servlet;

import com.web.entity.ShopCart;
import com.web.util.Constant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/user/Buyerlogout")
public class BuyerlogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object usersession=request.getSession().getAttribute(Constant.USER_SESSION);
        System.out.println("Buyerlogout");
        if (usersession!=null){
            request.getSession().removeAttribute(Constant.USER_SESSION);
            ShopCart shopCart=(ShopCart) request.getSession().getAttribute(Constant.SHOP_CART);
            shopCart.setBuyer(null);
        }
        response.sendRedirect(request.getSession().getServletContext().getContextPath()+"/login.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
