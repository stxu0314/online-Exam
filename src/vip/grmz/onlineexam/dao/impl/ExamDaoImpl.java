package vip.grmz.onlineexam.dao.impl;

import vip.grmz.onlineexam.dao.ExamDao;
import vip.grmz.onlineexam.entity.Exam;
import vip.grmz.onlineexam.entity.ExamResult;
import vip.grmz.onlineexam.entity.Question;
import vip.grmz.onlineexam.utils.DataProcessUtils;
import vip.grmz.onlineexam.utils.JDBCUtils;
import vip.grmz.onlineexam.utils.TimeUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.Map;

/**
 * @author: 苏
 * @createDate: 2022-09-27 15:19
 * @description:
 */
public class ExamDaoImpl implements ExamDao {
    @Override
    public List<Exam> findExams() {
        String sql = "select e.*,c.class_name,p.paper_name from exam e LEFT JOIN clazz c on e.class_id = c.class_id LEFT JOIN paper p on e.paper_id = p.paper_id";
        return DataProcessUtils.getForList(Exam.class,sql);
    }

    @Override
    public boolean addExam(Map<String, String[]> map) {
        String sql = "insert into exam values(null,?,?,?,?)";
        return DataProcessUtils.update(sql,map.get("paper_id")[0], TimeUtils.sqlStringToDate(map.get("exam_begin")[0]),TimeUtils.sqlStringToDate(map.get("exam_end")[0]),map.get("class_id")[0]) > 0 ? true : false;
    }

    @Override
    public boolean deleteExamById(Integer examId) {
        String sql = "delete from exam where exam_id = ?";
        return DataProcessUtils.update(sql,examId) > 0 ? true : false;
    }

    @Override
    public List<Exam> findMyExams(Integer userId) {
        String sql = "select e.*,p.paper_name from exam e,user u,paper p where u.class_id = e.class_id and p.paper_id = e.paper_id and u.part = 0 and u.user_id = ?";
        return DataProcessUtils.getForList(Exam.class,sql,userId);
    }

    @Override
    public Exam findExamById(int exam_id) {
        String sql = "SELECT * from exam where exam_id = ?";
        return DataProcessUtils.getInstance(Exam.class,sql,exam_id);
    }

    @Override
    public boolean insertExamResult(List<ExamResult> results) {
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnection();
            conn.setAutoCommit(false);
            String sql = "insert into exam_result values(null,?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            for (ExamResult res : results) {
                ps.setInt(1,res.getQuestion_id());
                ps.setString(2,res.getMy_op());
                ps.setInt(3,res.getExam_id());
                ps.setInt(4,res.getPaper_id());
                ps.setInt(5,res.getUser_id());
                ps.execute();
            }
            conn.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 释放资源   close
            JDBCUtils.closeResource(conn,ps);
        }
        return false;
    }

    @Override
    public List<Question> findMyExamResult(Integer userId,Integer examId) {
        String sql = "select q.* , r.my_op from question q , exam_result r where q.question_id = r.question_id and r.exam_id=? and r.user_id = ?";
        return DataProcessUtils.getForList(Question.class,sql,examId,userId);
    }

    @Override
    public void insertScore(int user_id, int exam_id, int score,int count_score) {
        String sql = "insert into score values (?,?,?,?)";
        DataProcessUtils.update(sql,user_id,exam_id,score,count_score);
    }

    @Override
    public Exam findExamDetailById(int exam_id) {
        String sql = "select e.*,c.class_name,p.paper_name from exam e LEFT JOIN clazz c on e.class_id = c.class_id LEFT JOIN paper p on e.paper_id = p.paper_id where e.exam_id = ?";
        return DataProcessUtils.getInstance(Exam.class,sql,exam_id);
    }
}
