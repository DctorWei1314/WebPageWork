package com.web.servlet;

import com.web.service.tagService;
import com.web.util.Constant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/AddTagServlet")
public class AddTagServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String tag = request.getParameter("tag");
        Constant.MessageType result = tagService.insertTag(tag);
        if(result == Constant.MessageType.INSERT_TAG_SUCCESS) {
            PrintWriter out = response.getWriter();
            out.print("<script> alert('标签添加成功！'); window.location='admin_tag.jsp' </script>");
            out.flush();
            out.close();
        }
    }
}
