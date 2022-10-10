package vip.grmz.onlineexam.listener;

import vip.grmz.onlineexam.entity.*;
import vip.grmz.onlineexam.utils.DataProcessUtils;
import vip.grmz.onlineexam.utils.JDBCUtils;
import vip.grmz.onlineexam.utils.TimeUtils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.*;

/**
 * @author: 苏
 * @createDate: 2022-10-03 8:46
 * @description: 没有参加考试的学生自动赋成绩为0
 */
@WebListener
public class NoAttendingListener implements ServletContextListener, HttpSessionListener, ServletRequestAttributeListener {
    // 监听器初始化
    public NoAttendingListener() {
        System.out.println("执行监听器的构造方法");
    }

    //请求对象添加属性时
    @Override
    public void attributeAdded(ServletRequestAttributeEvent srae) {
//        System.out.println("请求对象添加属性时---attributeAdded()");

        if (srae.getName().equals("scores")){
            // 查询没有参加考试的学生
            String sql = "SELECT u.user_id,e.paper_id,e.exam_id,e.exam_begin,e.exam_end from " +
                    "user u , exam e  where u.class_id = e.class_id and u.part = 0 and " +
                    "( u.user_id,e.exam_id) not in(Select user_id,exam_id from score);";
            List<Exam> stus = DataProcessUtils.getForList(Exam.class, sql);
            System.out.println(stus.size());

            if (stus != null || stus.size() != 0) {
                // 用于保存试卷对应的总分
                Map<Integer, Integer> scoreMap = new HashMap<>();
                List<Question> list = null;
                for (Exam exam : stus) {
                    // 查询试卷信息，用于计算总分
                    String sql1 = "select * from paper where paper_id = ?";
                    Paper paper = DataProcessUtils.getInstance(Paper.class, sql1, exam.getPaper_id());

                    // 查询试题类型，用于计算总分
                    String sql2 = "select * from question q, (select question_id from question_paper where paper_id = ?) i where q.question_id = i.question_id;";
                    list = DataProcessUtils.getForList(Question.class, sql2, exam.getPaper_id());
                    Integer countScore = 0;
                    for (Question q : list) {
                        if (q.getQuestion_type().equals("x")) {
                            scoreMap.put(exam.getPaper_id(), countScore += paper.getScore_sin());
                        }
                        if (q.getQuestion_type().equals("y")) {
                            scoreMap.put(exam.getPaper_id(), countScore += paper.getScore_che());
                        }
                        if (q.getQuestion_type().equals("z")) {
                            scoreMap.put(exam.getPaper_id(), countScore += paper.getScore_jug());
                        }
                    }
                }

            /*
            long startTime = System.currentTimeMillis();
            // 插入未参加考试学生的成绩为0
            for (Exam exam : stus) {
                long endTime = TimeUtils.stringToDate(exam.getExam_end()).getTime();
                long nowTime = (new Date()).getTime();
                boolean flag = nowTime - endTime > 0 ? true : false;
                if (flag) {
                    String sql3 = "insert into score values (?,?,?,?)";
                    DataProcessUtils.update(sql3,exam.getUser_id(),exam.getExam_id(),0,scoreMap.get(exam.getPaper_id()));
                    for (Question q : list) {
                        String sql4 = "insert into exam_result values (null,?,null,?,?,?)";
                        DataProcessUtils.update(sql4,q.getQuestion_id(),exam.getExam_id(),exam.getPaper_id(),exam.getUser_id());
                    }

                }
            }
            long endtime = System.currentTimeMillis();
            // ----costTime: 1499毫秒
            System.out.println("----costTime: " + (endtime - startTime) + "毫秒");*/

                long startTime = System.currentTimeMillis();
                PreparedStatement ps = null;
                PreparedStatement ps2 = null;
                Connection conn = null;
                try {
                    conn = JDBCUtils.getConnection();

                    // 设置不允许自动提交数据
                    conn.setAutoCommit(false);

                    String sql3 = "insert into score values (?,?,?,?)";
                    String sql4 = "insert into exam_result values (null,?,null,?,?,?)";

                    ps = conn.prepareStatement(sql3);
                    ps2 = conn.prepareStatement(sql4);
                    for (Exam exam : stus) {
                        long endTime = TimeUtils.stringToDate(exam.getExam_end()).getTime();
                        long nowTime = (new Date()).getTime();
                        boolean flag = nowTime - endTime > 0 ? true : false;
                        if (flag) {
                            ps.setInt(1, exam.getUser_id());
                            ps.setInt(2, exam.getExam_id());
                            ps.setInt(3, 0);
                            ps.setInt(4, scoreMap.get(exam.getPaper_id()));
                            ps.execute();
                            for (Question q : list) {
                                ps2.setInt(1, q.getQuestion_id());
                                ps2.setInt(2, exam.getExam_id());
                                ps2.setInt(3, exam.getPaper_id());
                                ps2.setInt(4, exam.getUser_id());
                                ps2.execute();
                            }
                        }
                    }
                    conn.commit();
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    // 释放资源   close
                    JDBCUtils.closeResource(conn, ps);
                    try {
                        if (ps2 != null) {
                            ps2.close();
                        }
                    } catch (SQLException throwables) {
                        throwables.printStackTrace();
                    }
                }
                long endtime = System.currentTimeMillis();

                // ----costTime: 410毫秒
                // 设置手动提交后  ----costTime: 84毫秒
                System.out.println("----costTime: " + (endtime - startTime) + "毫秒");
            }

        }

    }
}
