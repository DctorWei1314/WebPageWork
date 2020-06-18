package com.web.servlet;

import com.web.entity.Product;
import com.web.service.productService;
import com.web.util.Constant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/SingleProduct")
public class SingleProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("singleProduct");
        String saleID=request.getParameter("saleID");
        String name=request.getParameter("name");
        Product p= productService.selectProductByProductNameSaleID(name,saleID);
        request.setAttribute(Constant.SINGLE_PRODUCT,p);
        request.getRequestDispatcher("single-product.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
