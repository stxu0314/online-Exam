package vip.grmz.onlineexam.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.write.metadata.WriteSheet;
import com.alibaba.fastjson.JSONObject;
import vip.grmz.onlineexam.entity.Exam;
import vip.grmz.onlineexam.entity.Question;
import vip.grmz.onlineexam.entity.Score;
import vip.grmz.onlineexam.service.ExamService;
import vip.grmz.onlineexam.service.ScoreService;
import vip.grmz.onlineexam.service.impl.ExamServiceImpl;
import vip.grmz.onlineexam.service.impl.ScoreServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author: 苏
 * @createDate: 2022-10-02 15:14
 * @description:
 */
@WebServlet(name = "ScoreServlet", value = "/scoreServlet")
public class ScoreServlet extends BaseServlet {

    private ScoreService service = new ScoreServiceImpl();

    /**
     * 根据考试id查看考试成绩
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void findScoreById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String examId = request.getParameter("examId");
        int exam_id = Integer.parseInt(examId);

        List<Score> scores = service.findScoreById(exam_id);
        request.setAttribute("examId",exam_id);
        request.setAttribute("scores",scores);
        request.getRequestDispatcher("pages/score.jsp").forward(request,response);
    }

    /**
     * 根据用户id查看我的考试结果
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void findMyExamsRecord(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        List<Score> myexams = service.findMyExamsRecord(Integer.parseInt(userId));
        request.setAttribute("myexams",myexams);
        request.getRequestDispatcher("pages/myexam-list.jsp").forward(request,response);
    }

    /**
     * 下载成绩到excel
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void downloadScore(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String examId = request.getParameter("examId");
        int exam_id = Integer.parseInt(examId);

        List<Score> scores = service.findScoreById(exam_id);

        List<Score> list = scores.stream().sorted((s1, s2) -> -s1.getScore().compareTo(s2.getScore())).collect(Collectors.toList());

        ExamService examService = new ExamServiceImpl();
        Exam exam = examService.findExamDetailById(exam_id);

        // 注意 simpleWrite在数据量不大的情况下可以使用（5000以内，具体也要看实际情况），数据量大参照 重复多次写入
        String dir = System.getProperty("user.dir");
        String path = dir.replace("\\", "/");
        System.out.println(path);
        String fileName = "/"+exam.getClass_name()+exam.getPaper_name()+"成绩.xlsx";
        String pathName = path + fileName;
        System.out.println(pathName);
//        System.out.println(scores);
        // 写法1 JDK8+
        // since: 3.0.0-beta1
        // 这里 需要指定写用哪个class去写，然后写到第一个sheet，名字为模板 然后文件流会自动关闭
        // 如果这里想使用03 则 传入excelType参数即可
        // 这里 指定文件
        EasyExcel.write(pathName, Score.class).sheet("模板").doWrite(list);
        System.out.println("下载成功");
        request.setAttribute("msg","文件下载成功（" + pathName + "）");
        request.setAttribute("scores",scores);
        request.setAttribute("pathName",pathName);
        request.getRequestDispatcher("pages/score.jsp").forward(request,response);
    }

    /**
     * 查看是否已经考试
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void ifAttended(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String examId = request.getParameter("examId");

        boolean res = service.ifAttended(userId, examId);
        JSONObject obj = new JSONObject();
        obj.put("result",res);
        response.getWriter().println(obj);
    }

}
