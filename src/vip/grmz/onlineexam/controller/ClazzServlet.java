package vip.grmz.onlineexam.controller;

import com.alibaba.fastjson.JSONObject;
import vip.grmz.onlineexam.entity.Clazz;
import vip.grmz.onlineexam.service.ClazzService;
import vip.grmz.onlineexam.service.impl.ClazzServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author: 苏
 * @createDate: 2022-09-22 19:55
 * @description: 班级Servlet
 */
@WebServlet(name = "ClazzServlet", value = "/clazzServlet")
public class ClazzServlet extends BaseServlet {

    private ClazzService service = new ClazzServiceImpl();

    /**
     * 查询所有班级列表
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void findClasses(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Clazz> classes = service.findClasses();
        request.setAttribute("classes",classes);
        request.getRequestDispatcher("pages/class.jsp").forward(request, response);
    }

    /**
     * 添加班级
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void addClazz(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String className = request.getParameter("class_name");
        String userid = request.getParameter("userid");
        boolean res = service.existClass(className);
        if (res){
            request.setAttribute("msg","该班级已存在");
            request.setAttribute("className",className);
            request.getRequestDispatcher("pages/add-class.jsp").forward(request,response);
        }else {
            boolean insertClass = service.addClazz(userid,className);
            if (insertClass){
                request.getRequestDispatcher("clazzServlet?action=findClasses").forward(request, response);
            }
        }
    }

    /**
     * 根据班级id删除班级
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void deleteClassById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String classId = request.getParameter("class_id");
        int id = Integer.parseInt(classId);
        boolean res = service.deleteClassById(id);
        JSONObject obj = new JSONObject();
        obj.put("result", res);
        response.getWriter().println(obj);
    }

}
