package com.web.servlet;

import com.web.entity.User;
import com.web.service.userService;
import com.web.util.Constant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet(urlPatterns = "/BuyerRegister")
public class BuyerRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        //User user= userService.
        System.out.println("BuyerRegisterServlet");
        User user=new User();
        user.setUserID(genegrateID());
        user.setEmail(email);
        user.setUserPassword(password);
        if (userService.insertNewUser(user)==Constant.MessageType.REGISTER_SUCCESS){
            request.getSession().setAttribute(Constant.USER_SESSION,user);
            request.getRequestDispatcher("shop.jsp").forward(request,response);
        }
        else {
            request.setAttribute("Registererror","注册失败");
            request.getRequestDispatcher("register.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    private String genegrateID(){
        return Integer.toHexString((int) new Date().getTime());
    }
}
