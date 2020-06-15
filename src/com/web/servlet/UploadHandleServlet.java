package com.web.servlet;

import com.web.entity.Tag;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.ImagingOpException;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import com.web.entity.Product;
import com.web.entity.Tag;
//写的不是很好，根据需求可以自己改，比如图片的后缀可以自己在script中筛选，每个商家的图片其实可以放在单独的imgs/商家/里面，这样imgs/不会太拥挤
//上传后的图片只是在out.artifact,...imgs里面才有，注意一下，编程的web/imgs里面没有，
@WebServlet(urlPatterns = "/UploadHandleServlet")
public class UploadHandleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        boolean modify = false;
        Product product = new Product();
        List<Tag> tagList = new ArrayList<Tag>();
        PrintWriter printWriter = response.getWriter();
        String savePath ="D:NB";
        File file = new File(savePath);
        if(!file.exists()&&!file.isDirectory()){
            System.out.println("目录或文件不存在！");
            file.mkdir();
        }
        try {
            //使用Apache文件上传组件处理文件上传步骤：
            //创建一个DiskFileItemFactory工厂
            DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
            //创建一个文件上传解析器
            ServletFileUpload fileUpload = new ServletFileUpload(diskFileItemFactory);
            //解决上传文件名的中文乱码
            fileUpload.setHeaderEncoding("UTF-8");
            //判断提交上来的数据是否是上传表单的数据
            if(!fileUpload.isMultipartContent(request)){
                return;
            }
            //使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
            List<FileItem> list = fileUpload.parseRequest(request);
            for (FileItem item : list) {
                //如果fileitem中封装的是普通输入项的数据
               if(item.isFormField()){
               String name = item.getFieldName();
               //解决普通输入项的数据的中文乱码问题
               String value = item.getString("UTF-8");
               System.out.println(name+"  "+value);
               if(name == "modify" && value == "true"){
                   modify = true;
               }
               if(name == "name")
                   product.setName(value);
               if(name == "description")
                   product.setDescription(value);
               if(name == "discount")
                   product.setDiscount(Double.parseDouble(value));
               if(name == "price")
                   product.setPrice(Double.parseDouble(value));
               if(name == "number")
                   product.setSaleNumber(Integer.parseInt(value));
               if(name == "mytag"){
                   Tag tag = new Tag(value);
                   tagList.add(tag);
               }
               }else{
                    String name = item.getFieldName();
                    System.out.println("file-field"+name);
                    //如果fileitem中封装的是上传文件，得到上传的文件名称，
                    String fileName = item.getName();
                    String ext = fileName.substring(fileName.indexOf(".")+1);
                    System.out.println(fileName);
                    //注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：  c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
                    //处理获取到的上传文件的文件名的路径部分，只保留文件名部分
                    String realFileName = UUID.randomUUID().toString();
                    File file0 = new File(savePath+File.separator+realFileName);
                    while(file0.exists()){
                        realFileName = UUID.randomUUID().toString();
                        file0 = new File(savePath+File.separator+realFileName);
                    }
                    fileName = realFileName+"."+ext;
                    //创建一个文件输出流
                    FileOutputStream fos = new FileOutputStream(savePath+File.separator+fileName);
                    //获取item中的上传文件的输入流
                    InputStream is = item.getInputStream();
                    //创建一个缓冲区
                    byte buffer[] = new byte[1024];
                    //判断输入流中的数据是否已经读完的标识
                    int length = 0;
                    //循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
                    while((length = is.read(buffer))>0){
                        //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
                        fos.write(buffer, 0, length);
                    }
                    //关闭输入流
                    is.close();
                    //关闭输出流
                    fos.close();
                    //删除处理文件上传时生成的临时文件
                    item.delete();
                    //路径载入数据库的操作没写!!!!!!!!!!!!!!!!!!!可以调用处理数据库的人的函数把路径相关信息载入数据库！！！！！！
                    if(name == "image0"){
                        product.setMainImgFilePath(fileName);
                    }
                    if(name == "image1"){
                        product.setImage1(fileName);
                    }
                    if(name == "image2"){
                        product.setImage2(fileName);
                    }
                    if(name == "image3"){
                        product.setImage3(fileName);
                    }
                    if(name == "image4"){
                        product.setImage4(fileName);
                    }
                }
            }
            //product.getName()
            if(false){
                throw new RuntimeException();
            }
            if(modify){
                //
            }
            else {
                //
            }
        } catch (FileUploadException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            printWriter.write("系统文件系统异常");
            printWriter.close();
        }catch (RuntimeException e){
            e.printStackTrace();
            printWriter.write("商品名冲突");
            printWriter.close();
        }
    }
}