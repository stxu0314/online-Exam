package vip.grmz.onlineexam.controller;

import com.alibaba.fastjson.JSONObject;
import vip.grmz.onlineexam.entity.Exam;
import vip.grmz.onlineexam.entity.ExamResult;
import vip.grmz.onlineexam.entity.Paper;
import vip.grmz.onlineexam.entity.Question;
import vip.grmz.onlineexam.service.ExamService;
import vip.grmz.onlineexam.service.PaperService;
import vip.grmz.onlineexam.service.impl.ExamServiceImpl;
import vip.grmz.onlineexam.service.impl.PaperServiceImpl;
import vip.grmz.onlineexam.utils.TimeUtils;
import vip.grmz.onlineexam.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author: 苏
 * @createDate: 2022-09-27 15:13
 * @description:
 */
@WebServlet(name = "ExamServlet", value = "/examServlet")
public class ExamServlet extends BaseServlet {
    private ExamService service = new ExamServiceImpl();

    /**
     * 查询所有考试
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void findExams(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Exam> exams = service.findExams();
        request.setAttribute("exams", exams);
        request.getRequestDispatcher("pages/exam.jsp").forward(request, response);
    }

    /**
     * 添加考试
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void addExam(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String reqToken = request.getParameter("token");
        String sessionToken = (String) request.getSession().getAttribute("token");

        if (reqToken == null || sessionToken == null || !reqToken.equals(sessionToken)) {
            request.getRequestDispatcher("examServlet?action=findExams").forward(request, response);
        } else {
            request.getSession().removeAttribute("token");
            Map<String, String[]> map = request.getParameterMap();
            //System.out.println(map.get("exam_begin")[0]);
            //System.out.println(map.get("exam_end")[0]);

            boolean res = service.addExam(map);
            request.setAttribute("res", res);
            request.getRequestDispatcher("examServlet?action=findExams").forward(request, response);
        }
    }

    /**
     * 根据用户id查询我的考试
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void findMyExams(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer userId = null;
        String userIdParam = request.getParameter("userId");
        if (userIdParam != null){
            userId = Integer.parseInt(userIdParam);
        }else {
            userId = (Integer) request.getAttribute("userId");
        }

        List<Exam> myExams = service.findMyExams(userId);
        // 使用stream流，截取出我的没有结束的考试
        List<Exam> exams = myExams.stream().filter(e -> TimeUtils.stringToDate(e.getExam_end()).getTime() > (System.currentTimeMillis())).collect(Collectors.toList());
//        System.out.println("我的考试列表："+exams);
        request.setAttribute("myExams", exams);
        request.getRequestDispatcher("pages/myexam.jsp").forward(request, response);
    }
    /**
     * 根据用户id查询我的考试结果
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void findMyExamResult(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id = request.getParameter("userId");
        Integer userId = Integer.parseInt(user_id);
        String exam_id = request.getParameter("examId");
        int examId = Integer.parseInt(exam_id);
        String paper_id = request.getParameter("paperId");
        int paperId = Integer.parseInt(paper_id);
        Paper paper = (new PaperServiceImpl()).findPaperById(paperId);
        request.setAttribute("paper",paper);
        List<Question> myExamRes = service.findMyExamResult(userId,examId);
        request.setAttribute("myExamRes", myExamRes);
        request.getRequestDispatcher("pages/exam-res.jsp").forward(request, response);
    }

    /**
     * 根据考试id删除考试
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void deleteExamById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String exam_id = request.getParameter("exam_id");
        Integer examId = Integer.parseInt(exam_id);
        boolean res = service.deleteExamById(examId);
        JSONObject obj = new JSONObject();
        obj.put("result", res);
        response.getWriter().println(obj);
    }

    /**
     * 阅卷
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void checkQuesExamIsTrue(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String index = request.getParameter("index");
        String paperId = request.getParameter("paperId");
        String autoSubmit = request.getParameter("autoSubmit");
        String examId = request.getParameter("examId");
        String userId = request.getParameter("userid");
        System.out.println(autoSubmit);
        int paper_id = WebUtils.parseInt(paperId, 0);
        int exam_id = WebUtils.parseInt(examId, 0);
        int user_id = WebUtils.parseInt(userId, 0);

        //  用于记录考试详情(我的答案)
        List<ExamResult> results = new ArrayList<>();

        // 查找考试试卷上的所有试题
        List<Question> questions = (new PaperServiceImpl()).findPaperQuestions(paper_id);

        // 用于记录试题对应的我的答案
        Map<String, String> map = new HashMap<>();

        ExamResult examResult = null;
        int i = WebUtils.parseInt(index, 0);
        JSONObject obj = new JSONObject();
        for (int j = 1; j <= i; j++) {
            examResult = new ExamResult();
            examResult.setPaper_id(paper_id);
            examResult.setExam_id(exam_id);
            examResult.setUser_id(user_id);

//            String ques = request.getParameter();
            String[] values = request.getParameterValues("ques" + j);
//            System.out.println(ques);
           // System.out.println(values);
            if (values == null && autoSubmit == null) {
                obj.put("result", true);
                response.getWriter().println(obj);
                return;
            } else {

                // 如果是自动提交，则跳过本次循环
                if (autoSubmit != null && autoSubmit.equals("true")){
                    if (values == null){
                        continue;
                    }
                }
                for (String value : values) {
                    String[] split = value.split(",");
                    String str = "";
                    System.out.println(Arrays.toString(split));
                    if (map.containsKey(split[1])) {
                        str = map.get(split[1]);
                        str += split[0];
                        map.put(split[1], str);
                    } else {
                        map.put(split[1], split[0]);
                    }

                    if (examResult.getMy_op() == null){
                        examResult.setMy_op(split[0]);
                        examResult.setQuestion_id(Integer.parseInt(split[1]));
                    }else {
                       examResult.setMy_op(str);
                    }
                }
            }
            results.add(examResult);
        }

//        System.out.println("正确答案的数据为："+results);
        Set<String> key = map.keySet();
        for (String k : key){
            System.out.println(k + "====>" + map.get(k));
        }

        // 统计题目数量
        int sinNum = 0, cheNum = 0, jugNum = 0;
        // 得分
        int score = 0;
        Paper paper = (new PaperServiceImpl()).findPaperById(paper_id);
        // 单选分数
        int sin = paper.getScore_sin();
        // 多选分数
        int che = paper.getScore_che();
        // 判断分数
        int jug = paper.getScore_jug();
//        System.out.println(questions);
        for (Question q : questions) {
//            System.out.println(q.getQuestion_id());
//            System.out.println(map.get(q.getQuestion_id().toString()));
            // 计算所得分数
            if (map.get(q.getQuestion_id().toString())!=null){
                if (map.get(q.getQuestion_id().toString()).equals(q.getQuestion_opright())) {
                    if (q.getQuestion_type().equals("x")) {
                        score += sin;
                    } else if (q.getQuestion_type().equals("y")) {
                        score += che;
                    } else if (q.getQuestion_type().equals("z")) {
                        score += jug;
                    }
                    System.out.println("第" + q.getQuestion_id() + "答对了");
                }
            }

            // 统计题目数量
            if (q.getQuestion_type().equals("x")) {
                sinNum++;
            } else if (q.getQuestion_type().equals("y")) {
                cheNum++;
            } else if (q.getQuestion_type().equals("z")) {
                jugNum++;
            }
        }

        // 总分
        int countScore = sinNum * sin + cheNum * che + jugNum * jug;

        // 用于记录我的答案的试题id
        List<Integer> questionIds = new ArrayList<>();
        results.forEach(e -> questionIds.add(e.getQuestion_id()));
//        for (ExamResult e : results) {
//            questionIds.add(e.getQuestion_id());
//        }
        // 为自动提交而没有选择的试题赋值
        for (Question res : questions){
            ExamResult examRes = new ExamResult();
            if (!questionIds.contains(res.getQuestion_id())){
                examRes.setQuestion_id(res.getQuestion_id());
                examRes.setUser_id(user_id);
                examRes.setExam_id(exam_id);
                examRes.setPaper_id(paper_id);
//                System.out.println(res.getQuestion_id());
                results.add(examRes);
            }
        }

        System.out.println("我的答案的数据为："+results);

        boolean res = service.insertExamResult(results);
        service.insertScore(user_id,exam_id,score,countScore);

        //System.out.println("总分:" + score);
        obj.put("score", score);
        obj.put("countScore",countScore);

        response.getWriter().println(obj);
    }



}
