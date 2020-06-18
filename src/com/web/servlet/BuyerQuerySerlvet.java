package com.web.servlet;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.web.entity.Comment;
import com.web.entity.Product;
import com.web.entity.User;
import com.web.service.productService;
import com.web.service.userService;
import com.web.util.Constant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/BuyerQuery")
public class BuyerQuerySerlvet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("utf-8");
        String type=request.getParameter("type");
        String condition=request.getParameter("condition");
        int pageID=Integer.parseInt(request.getParameter("pageID"));
        System.out.println(type+condition+pageID);

        List<Product> p_list;
        int page_num;
        PrintWriter out=response.getWriter();

        JSONArray json=new JSONArray();
        JSONObject page=new JSONObject();
//        按名称查询
        if(type.equals("product")){
            System.out.println(type+condition);
            p_list= productService.selectProductByLikeName(condition,1,12);
            page_num= productService.selectSimilarNameProductCount(condition);
        }
        //按卖家查询
        else if(type.equals("sellerid")){
            System.out.println(type+condition);
            p_list= productService.selectProductPageBySaleID(condition,1,12);
            page_num= productService.selectProductCountBySaleID(condition);
        }
        //按标签查询
        else if(type.equals("label")&&condition!="全部商品"){
            System.out.println(type+condition);
            p_list=productService.selectProductPageByTag(condition,1,12);
            page_num=productService.selectProductCountByTag(condition);
        }
        //全部商品
        else {
            System.out.println(type+condition);
            p_list=productService.selectAllProduct(1,12);
            page_num=productService.selectAllProductCount();
        }

//        p_list=new ArrayList<Product>();
//        page_num=1;
//        Product tp=new Product();
//        tp.setName("哈哈哈");
//        tp.setSaleID("华为");
//        tp.setMainImgFilePath("ssss");
//        tp.setPrice(122);
//        tp.setSalePrice(666);
//        p_list.add(tp);

        page.put("type",type);
        page.put("condition",condition);
        page.put("allpages",page_num%12==0?page_num/12:page_num/12+1);
        page.put("pageID",pageID);
        json.add(page);
        for(Product p:p_list ){
            JSONObject jo = new JSONObject();
            jo.put("name",p.getName());
            jo.put("saleID",p.getSaleID());
            jo.put("mainImgFilePath",p.getMainImgFilePath());
            jo.put("price",p.getPrice());
            jo.put("salePrice",p.getSalePrice());
            json.add(jo);
        }
        String jtext=json.toString();
        out.write(jtext);
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
