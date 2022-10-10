package vip.grmz.onlineexam.utils;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author: 苏
 * @createDate: 2022-10-03 11:52
 * @description: 上传文件的工具类
 */
public class UploadUtils {
    public static <T> List<String> uploadFiles(HttpServlet servlet, HttpServletRequest request, HttpServletResponse response) {
        SmartUpload smu = new SmartUpload(); // 创建对象
        smu.setCharset("utf-8");
        try {
            smu.initialize(servlet.getServletConfig(), request, response); // 初始化组件
            smu.upload(); // 上传

            Files files = smu.getFiles(); // 获取上传文件的列表

            List<String> urls = new ArrayList<>();
            File file = null;
            //判断上传文件的长度是否大于0，是否有文件上传
            if (files.getSize() > 0) {
                for (int i = 0; i < files.getCount(); i++) {
                    file = files.getFile(i);
                    try {
                        file.saveAs("D:\\upload\\" + file.getFileName());
                    } catch (SmartUploadException e) {
                        e.printStackTrace();
                    }
                    urls.add("/upload/" + file.getFileName());
                }
            }
            System.out.println("urls=====> " + urls);
            return urls;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }


    public static <T> String uploadFile(HttpServlet servlet, HttpServletRequest request, HttpServletResponse response) {

        String imgpath = "";
        SmartUpload smu = new SmartUpload(); // 创建对象
        smu.setCharset("utf-8");
        try {
            smu.initialize(servlet.getServletConfig(), request, response); // 初始化组件
            smu.upload(); // 上传

            Files files = smu.getFiles(); // 获取上传文件的列表
            File file = files.getFile(0); // 获取第一个文件
            //判断上传文件的长度是否大于0，是否有文件上传
            if (files.getSize() > 0 && file.getSize() > 0) {
                try {
                    //如果存储在外部磁盘，使用外部磁盘路径
                    file.saveAs("D:\\upload\\" + file.getFileName());
                    //file.saveAs("upload/" + file.getFileName()); // 保存文件
                } catch (SmartUploadException e) {
                    e.printStackTrace();
                }
                imgpath = "/upload/"+file.getFileName(); // 图片的文件名
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return imgpath;
    }

    public static String uploadFileServlet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("utf-8");  //请求的编码
        response.setContentType("text/html; charset=utf-8");  //响应编码
        //根据上传控件名称获取上传文件对应的Part对象
        Part file = request.getPart("img");
        //获取upload所在路径
        String path = request.getServletContext().getRealPath("D:/upload/");
        System.out.println(path);

        //文件大小
        System.out.println(file.getSize());
        //文件名称
        System.out.println(file.getName());
        //创建File对象
        java.io.File f = new java.io.File(path);
        //如果目录不存在，就去创建目录
        if (!f.exists()) {
            f.mkdirs();
        }

        //返回的是上传的文件名称
        String fn = file.getSubmittedFileName();

        //判断上传是否为图片(拓展名是.jpg或者.png)
        if (fn.toLowerCase().endsWith(".jpg") || fn.toLowerCase().endsWith(".png")) {
            //生成文件新名字  年月日时分秒+源文件名字
            String nfn = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date()) + fn;
            file.write(path + "/" + nfn); //将文件写到物理磁盘
            return nfn;
        } else {
            return "formatError";
        }
    }


}
