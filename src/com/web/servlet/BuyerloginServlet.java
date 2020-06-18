package com.web.servlet;

import com.web.entity.ShopCart;
import com.web.entity.User;
import com.web.service.userService;
import com.web.util.Constant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/Buyerlogin")
public class BuyerloginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username=req.getParameter("username");
        String pwd=req.getParameter("password");
        System.out.println("Buyerlogin");
        if(userService.judgeLoginSuccessByNamePwd(username,pwd)==Constant.MessageType.LOGIN_SUCCESS) {
            User user = userService.selectBasicInfoByName(username);
            if (user.getType() == Constant.MessageType.BUYER) {
                req.getSession().setAttribute(Constant.USER_SESSION, user);
                resp.sendRedirect("shop.jsp");
                ShopCart shopCart=new ShopCart(username,10);
                req.getSession().setAttribute(Constant.SHOP_CART,shopCart);
            }
            else {
                req.setAttribute("error","请换个地方登录");
                req.getRequestDispatcher("login.jsp").forward(req,resp);
            }
        }
        else {
            req.setAttribute("error","用户名或密码错误");
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
