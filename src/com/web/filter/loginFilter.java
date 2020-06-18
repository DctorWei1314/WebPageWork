package com.web.filter;

import com.web.entity.User;
import com.web.util.Constant;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "loginFilter",urlPatterns = "/user/*")
public class loginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest requst=(HttpServletRequest) req;
        HttpServletResponse response=(HttpServletResponse) resp;
        User user=(User) requst.getSession().getAttribute(Constant.USER_SESSION
        );
        if(user==null||user.getType()!=Constant.MessageType.BUYER){
            response.sendRedirect(requst.getContextPath()+"/login.jsp");
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
