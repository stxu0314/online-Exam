package vip.grmz.onlineexam.dao.impl;

import vip.grmz.onlineexam.dao.QuestionDao;
import vip.grmz.onlineexam.entity.Question;
import vip.grmz.onlineexam.utils.DataProcessUtils;
import vip.grmz.onlineexam.utils.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

/**
 * @author: 苏
 * @createDate: 2022-09-24 15:52
 * @description:
 */
public class QuestionDaoImpl implements QuestionDao {
    @Override
    public List<Question> findQuestions() {
        String sql = "select q.*,c.course_name from Question q LEFT JOIN course c on q.question_course = c.course_id";
        return DataProcessUtils.getForList(Question.class, sql);
    }

    @Override
    public boolean addQuestion(Question question) {
        String sql = "insert into Question values (null,?,?,?,?,?,?,?,?)";
        return DataProcessUtils.update(sql, question.getQuestion_type(), question.getQuestion_course(), question.getQuestion_name()
                , question.getQuestion_opa(), question.getQuestion_opb(), question.getQuestion_opc(), question.getQuestion_opd(),
                question.getQuestion_opright()) > 0 ? true : false;
    }

    @Override
    public boolean existQuestion(Question question) {
        String sql = "select question_name from Question where question_type = ? and question_course=? and question_name = ? and question_opa = ?" +
                " and question_opb = ? and question_opc = ? and question_opd = ? and question_opright = ?";
        return DataProcessUtils.getInstance(Question.class, sql, question.getQuestion_type(), question.getQuestion_course(), question.getQuestion_name()
                , question.getQuestion_opa(), question.getQuestion_opb(), question.getQuestion_opc(), question.getQuestion_opd(),
                question.getQuestion_opright()) != null ? true : false;
    }

    @Override
    public Question findQuestionById(int id) {
        String sql = "select * from question where question_id = ?";
        return DataProcessUtils.getInstance(Question.class, sql, id);
    }

    @Override
    public boolean deleteQuestionById(int id) {
        String sql = "delete from question where question_id = ?";
        return DataProcessUtils.update(sql, id) > 0 ? true : false;
    }

    @Override
    public boolean updateQuestion(Question question, int id) {
        String sql = "update question set question_type = ?, question_course=? , " +
                "question_name = ? ,question_opa = ?, question_opb = ? , question_opc = ? , " +
                "question_opd = ? , question_opright = ? where question_id = ?";
        return DataProcessUtils.update(sql, question.getQuestion_type(), question.getQuestion_course(), question.getQuestion_name()
                , question.getQuestion_opa(), question.getQuestion_opb(), question.getQuestion_opc(), question.getQuestion_opd(),
                question.getQuestion_opright(), id) > 0 ? true : false;
    }

    @Override
    public boolean addQuestionToPaper(int id, int paper_id) {
        String sql = "insert into question_paper values (null,?,?)";
        return DataProcessUtils.update(sql, id, paper_id) > 0 ? true : false;
    }

    @Override
    public List<Integer> existQuestionInPaper(int parseInt) {
        String sql = "select question_id from question_paper where paper_id = ?";
        List<Question> list = DataProcessUtils.getForList(Question.class, sql, parseInt);
        List<Integer> result = new ArrayList<>();
        for (Question q : list){
            result.add(q.getQuestion_id());
        }
        System.out.println(result);
        return result;
    }

    @Override
    public boolean deleteQuestionInPaper(int questionId, int paper_id) {
        String sql = "delete from question_paper where question_id = ? and paper_id = ?";
        return DataProcessUtils.update(sql,questionId,paper_id) > 0 ? true : false;
    }

    @Override
    public List<Integer> findQuesNumByCourseId(int courseId) {
        List<Integer> res = new ArrayList<>();
        String sql1 = "select count(question_type) from question where question_type = 'x' and question_course = ?";
        String sql2 = "select count(question_type) from question where question_type = 'y' and question_course = ?";
        String sql3 = "select count(question_type) from question where question_type = 'z' and question_course = ?";
        Long sinNum = (Long) DataProcessUtils.queryForSingleValue(sql1, courseId);
        Long cheNum = (Long) DataProcessUtils.queryForSingleValue(sql2, courseId);
        Long jupNum = (Long) DataProcessUtils.queryForSingleValue(sql3, courseId);
        res.add(Math.toIntExact(sinNum));
        res.add(Math.toIntExact(cheNum));
        res.add(Math.toIntExact(jupNum));
        return res;
    }

    @Override
    public void save(List<Question> questions) {
//        System.out.println(questions);
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnection();
            conn.setAutoCommit(false);
            String sql = "insert into question values (null,?,?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            for (Question q : questions) {
                if (q.getQuestion_type().equals("单选题")){
                    ps.setString(1,"x");
                }else if (q.getQuestion_type().equals("多选题")){
                    ps.setString(1,"y");
                }else if (q.getQuestion_type().equals("判断题")){
                    ps.setString(1,"z");
                }
                ps.setInt(2,q.getQuestion_course());
                ps.setString(3,q.getQuestion_name());
                ps.setString(4,q.getQuestion_opa());
                ps.setString(5,q.getQuestion_opb());
                ps.setString(6,q.getQuestion_opc());
                ps.setString(7,q.getQuestion_opd());
                ps.setString(8,q.getQuestion_opright());
                ps.execute();
            }
            conn.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 释放资源   close
            JDBCUtils.closeResource(conn,ps);
        }
    }
}
