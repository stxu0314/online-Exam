package vip.grmz.onlineexam.dao.impl;

import vip.grmz.onlineexam.dao.PaperDao;
import vip.grmz.onlineexam.entity.Paper;
import vip.grmz.onlineexam.entity.Question;
import vip.grmz.onlineexam.utils.DataProcessUtils;
import vip.grmz.onlineexam.utils.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

/**
 * @author: 苏
 * @createDate: 2022-09-25 19:57
 * @description:
 */
public class PaperDaoImpl implements PaperDao {
    @Override
    public List<Paper> findPapers() {
        String sql = "SELECT * FROM paper";
        return DataProcessUtils.getForList(Paper.class, sql);
    }

    @Override
    public boolean findPaperByName(String paperName) {
        String sql = "SELECT paper_name FROM paper where paper_name = ?";
        return DataProcessUtils.getInstance(Paper.class,sql,paperName) != null ? true : false;
    }

    @Override
    public boolean addPaper(Paper paper) {
        String sql = "INSERT INTO paper values (null, ?,?,?,?)";
        return DataProcessUtils.update(sql,paper.getPaper_name(),paper.getScore_sin(),paper.getScore_che(),paper.getScore_jug()) > 0 ? true : false;
    }

    @Override
    public Paper findPaperById(int id) {
        String sql = "select * from paper where paper_id = ?";
        return DataProcessUtils.getInstance(Paper.class,sql,id);
    }

    @Override
    public boolean updatePaper(Paper paper) {
        String sql = "update paper set paper_name =  ?, score_sin = ?, score_che = ?, score_jug = ? where paper_id = ?";
        return DataProcessUtils.update(sql,paper.getPaper_name(),paper.getScore_sin(),paper.getScore_che(),paper.getScore_jug(),paper.getPaper_id()) > 0 ? true : false;
    }

    @Override
    public boolean deletePaperById(int id) {
        String sql = "delete from paper where paper_id = ?";
        return DataProcessUtils.update(sql,id) > 0 ? true : false;
    }

    @Override
    public List<Question> findPaperQuestions(int id) {
        String sql ="select q.*,c.course_name from Question q LEFT JOIN course c on q.question_course = c.course_id ,  paper p , question_paper qp where p.paper_id = qp.paper_id and q.question_id = qp.question_id and p.paper_id = ?";
        return DataProcessUtils.getForList(Question.class,sql,id);
    }

    @Override
    public void deleteQusetionInPaper(int paper_id) {
        String sql = "DELETE FROM question_paper where paper_id = ?";
        DataProcessUtils.update(sql,paper_id);
    }

    @Override
    public List<Question> findQuestionsByCourse(int question_course) {
        String sql = "SELECT * FROM question where question_course = ?";
        return DataProcessUtils.getForList(Question.class,sql,question_course);
    }

    @Override
    public boolean randomAddQuestionToPaper(List<Question> result, int paper_id) {
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            conn = JDBCUtils.getConnection();
            conn.setAutoCommit(false);
            String sql = "insert into question_paper values (null,?,?)";
            ps = conn.prepareStatement(sql);
            for (Question q : result) {
                ps.setInt(1,q.getQuestion_id());
                ps.setInt(2,paper_id);
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
}
