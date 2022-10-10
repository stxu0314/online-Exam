package vip.grmz.onlineexam.controller;

import com.alibaba.fastjson.JSONObject;
import vip.grmz.onlineexam.entity.Exam;
import vip.grmz.onlineexam.entity.Paper;
import vip.grmz.onlineexam.entity.Question;
import vip.grmz.onlineexam.service.PaperService;
import vip.grmz.onlineexam.service.QuestionService;
import vip.grmz.onlineexam.service.impl.ExamServiceImpl;
import vip.grmz.onlineexam.service.impl.PaperServiceImpl;
import vip.grmz.onlineexam.service.impl.QuestionServiceImpl;
import vip.grmz.onlineexam.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

/**
 * @author: 苏
 * @createDate: 2022-09-25 19:54
 * @description: 试卷
 */
@WebServlet(name = "PaperServlet", value = "/paperServlet")
public class PaperServlet extends BaseServlet {

    PaperService service = new PaperServiceImpl();

    /**
     * 查询所有试卷
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void findPapers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Paper> papers = service.findPapers();
        request.setAttribute("papers", papers);
        request.getRequestDispatcher("pages/papers.jsp").forward(request, response);
    }

    /**
     * 添加试卷
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void addPaper(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String reqToken = request.getParameter("token");
        String sessionToken = (String) request.getSession().getAttribute("token");

        if (reqToken == null || sessionToken == null || !reqToken.equals(sessionToken)) {
            request.getRequestDispatcher("paperServlet?action=findPapers").forward(request, response);
        } else {
            request.getSession().removeAttribute("token");
            Map<String, String[]> map = request.getParameterMap();
            Paper paper = WebUtils.copyParamToBean(map, new Paper());

            boolean exist = service.findPaperByName(paper.getPaper_name());
            if (exist) {
                request.setAttribute("msg", "该试卷已存在！");
                request.getRequestDispatcher("pages/add-paper.jsp").forward(request, response);
            } else {
                boolean res = service.addPaper(paper);
                request.getRequestDispatcher("paperServlet?action=findPapers").forward(request, response);
            }
        }
    }

    /**
     * 修改试卷
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void updatePaper(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Map<String, String[]> map = request.getParameterMap();
        Paper paper = WebUtils.copyParamToBean(map, new Paper());

        boolean res = service.updatePaper(paper);
        request.getRequestDispatcher("paperServlet?action=findPapers").forward(request, response);

    }

    /**
     * 根据试卷id查找试卷
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void findPaperById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String paper_id = request.getParameter("paper_id");

        int id = Integer.parseInt(paper_id);
        Paper paper = service.findPaperById(id);

        request.setAttribute("paper", paper);
        request.getRequestDispatcher("pages/edit-paper.jsp").forward(request, response);


    }

    /**
     * 根据试卷id查找试卷
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void deletePaperById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String paper_id = request.getParameter("paper_id");

        int id = Integer.parseInt(paper_id);
        boolean res = service.deletePaperById(id);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("result", res);
        response.getWriter().println(jsonObject);


    }

    /**
     * 查询试卷id查询试卷对应的试题
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void findPaperQuestions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paperId = request.getParameter("paperId");
        request.setAttribute("paperId", paperId);
        int id = Integer.parseInt(paperId);
        List<Question> questions = service.findPaperQuestions(id);
        request.setAttribute("questions", questions);
        request.getRequestDispatcher("pages/paper-question.jsp").forward(request, response);
    }

    /**
     * 查询试卷id查询试卷对应的试题到考试id对应的考试
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void findQuesExam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paperId = request.getParameter("paperId");
        String examId = request.getParameter("examId");
        int id = Integer.parseInt(paperId);
        int exam_id = Integer.parseInt(examId);
        Paper paper = service.findPaperById(id);
        Exam exam = new ExamServiceImpl().findExamById(exam_id);
        request.setAttribute("exam",exam);
        request.setAttribute("paper",paper);
        List<Question> questions = service.findPaperQuestions(id);
        request.setAttribute("questions", questions);
        request.getRequestDispatcher("pages/do-exam.jsp").forward(request, response);
    }

    /**
     * 根据id随机生成试卷的试题
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void randomAddQuestionToPaper(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paperId = request.getParameter("paperId");
        String questionCourse = request.getParameter("question_course");
        String sinNum = request.getParameter("sinNum");
        String cheNum = request.getParameter("cheNum");
        String jugNum = request.getParameter("jugNum");

        int question_course = WebUtils.parseInt(questionCourse, 1001);
        int sin_num = WebUtils.parseInt(sinNum, 1);
        int che_num = WebUtils.parseInt(cheNum, 1);
        int jug_num = WebUtils.parseInt(jugNum, 1);
        int paper_id = WebUtils.parseInt(paperId, 0);
        service.deleteQusetionInPaper(paper_id);

        List<Question> questions = service.findQuestionsByCourse(question_course);
        System.out.println(questions);
        int sum = sin_num + che_num + jug_num;
        QuestionService quesService = new QuestionServiceImpl();

        List<Integer> quesNum = quesService.findQuesNumByCourseId(question_course);
        List<Question> result = new ArrayList<>();

        int sin = 0, che = 0, jug = 0;
        System.out.println("总数：" + sum);
        Random rd = new Random();
        while (result.size() < sum) {
            System.out.println("长度：" + result.size());
            int num = rd.nextInt(questions.size());
            if (sin_num <= quesNum.get(0) && sin <= sin_num) {
                if (questions.get(num).getQuestion_type().equals("x")) {
                    if (!result.contains(questions.get(num))) {
                        result.add(questions.get(num));
                        sin++;
                    }
                    continue;
                }
            }
            if (che_num <= quesNum.get(1) && che <= che_num) {
                if (questions.get(num).getQuestion_type().equals("y")) {
                    if (!result.contains(questions.get(num))) {
                        result.add(questions.get(num));
                        che++;
                    }
                    continue;
                }
            }
            if (jug_num <= quesNum.get(2) && jug <= jug_num) {
                if (questions.get(num).getQuestion_type().equals("z")) {
                    if (!result.contains(questions.get(num))) {
                        result.add(questions.get(num));
                        jug++;
                    }
                    continue;
                }
            }
        }
        boolean res = service.randomAddQuestionToPaper(result, paper_id);
        request.getRequestDispatcher("paperServlet?action=findPaperQuestions&paperId=" + paper_id).forward(request, response);
    }

}
