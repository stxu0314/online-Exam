package vip.grmz.onlineexam.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPObject;
import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import vip.grmz.onlineexam.dao.impl.QuestionDaoImpl;
import vip.grmz.onlineexam.entity.Question;
import vip.grmz.onlineexam.listener.QuestionListener;
import vip.grmz.onlineexam.service.QuestionService;
import vip.grmz.onlineexam.service.impl.QuestionServiceImpl;
import vip.grmz.onlineexam.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


/**
 * @author: 苏
 * @createDate: 2022-09-24 15:49
 * @description:
 */
@WebServlet(name = "QuestionServlet", value = "/questionServlet")
@MultipartConfig(maxFileSize = 1024*1024*2)   //文件上传配置
public class QuestionServlet extends BaseServlet {

    QuestionService service = new QuestionServiceImpl();

    /**
     * 查询所有题目
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void findQuestions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Question> questions = service.findQuestions();
        String paperId = request.getParameter("paperId");
        if (paperId != null) {
            List<Integer> exist = service.existQuestionInPaper(Integer.parseInt(paperId));
            request.setAttribute("exist", exist);
        }


        request.setAttribute("paperId", paperId);

        request.setAttribute("questions", questions);

        request.getRequestDispatcher("pages/questions.jsp").forward(request, response);
    }

    /**
     * 添加试题
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void addQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reqToken = request.getParameter("token");
        String sessionToken = (String) request.getSession().getAttribute("token");

        if (reqToken == null || sessionToken == null || !reqToken.equals(sessionToken)) {
            request.getRequestDispatcher("questionServlet?action=findQuestions").forward(request, response);
        } else {
            request.getSession().removeAttribute("token");
            Map<String, String[]> map = request.getParameterMap();
            Question question = WebUtils.copyParamToBean(map, new Question());

            boolean exist = service.existQuestion(question);
            if (exist) {
                request.setAttribute("msg", "该试题已存在！");
                request.getRequestDispatcher("pages/add-question.jsp").forward(request, response);
            } else {
                boolean res = service.addQuestion(question);
                request.getRequestDispatcher("questionServlet?action=findQuestions").forward(request, response);
            }
        }
    }


    /**
     * 根据试题id查看试题详情
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void findQuestionById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String question_id = request.getParameter("question_id");
        int id = Integer.parseInt(question_id);
        Question question = service.findQuestionById(id);

        request.setAttribute("question", question);
        request.getRequestDispatcher("pages/edit-question.jsp").forward(request, response);


    }


    /**
     * 从excel导入试题
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void importQuestions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");  //请求的编码
        response.setContentType("text/html; charset=utf-8");  //响应编码
        Part file = request.getPart("file");
        System.out.println(file.getName());
        EasyExcel.read(file.getInputStream(), Question.class, new QuestionListener(new QuestionDaoImpl())).sheet().doRead();
        request.setAttribute("SUCCESS","SUCCESS");
        request.getRequestDispatcher("questionServlet?action=findQuestions").forward(request,response);
    }

    /**
     * 根据试题id删除试题
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void deleteQuestionById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String question_id = request.getParameter("question_id");
        int id = Integer.parseInt(question_id);
        boolean res = service.deleteQuestionById(id);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("result", res);
        response.getWriter().println(jsonObject);
    }


    /**
     * 根据试题id修改试题
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void updateQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String questionId = request.getParameter("questionId");
        int id = Integer.parseInt(questionId);
        Map<String, String[]> map = request.getParameterMap();
        Question question = WebUtils.copyParamToBean(map, new Question());

        boolean exist = service.existQuestion(question);
        System.out.println(exist);
        if (exist) {
            request.setAttribute("msg", "该试题已存在！");
            request.getRequestDispatcher("pages/edit-question.jsp").forward(request, response);
        } else {
            boolean res = service.updateQuestion(question, id);
            request.getRequestDispatcher("questionServlet?action=findQuestions").forward(request, response);
        }
    }


    /**
     * 根据试题id添加试题到试卷
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void addQuestionToPaper(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String question_id = request.getParameter("question_id");
        String paperId = request.getParameter("paperId");
        int id = Integer.parseInt(question_id);
        int paper_id = Integer.parseInt(paperId);

        boolean res = service.addQuestionToPaper(id, paper_id);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("result", res);
        response.getWriter().println(jsonObject);
    }


    /**
     * 根据试题id和试卷id删除试卷中的试题
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void deleteQuestionInPaper(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String question_id = request.getParameter("question_id");
        String paperId = request.getParameter("paperId");
        int questionId = Integer.parseInt(question_id);
        int paper_id = Integer.parseInt(paperId);

        boolean res = service.deleteQuestionInPaper(questionId, paper_id);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("result", res);
        response.getWriter().println(jsonObject);
    }


    /**
     * 根据课程id查询试题数量
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void findQuesNumByCourseId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String question_course = request.getParameter("courseId");
        int courseId = WebUtils.parseInt(question_course, 1001);

        List<Integer> quesNum = service.findQuesNumByCourseId(courseId);
        //System.out.println(quesNum.get(0));
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("sinNum", quesNum.get(0) );
        jsonObject.put("cheNum", quesNum.get(1) );
        jsonObject.put("jugNum", quesNum.get(2) );
        response.getWriter().println(jsonObject);
    }


}
