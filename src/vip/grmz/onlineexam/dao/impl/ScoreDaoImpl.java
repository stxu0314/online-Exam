package vip.grmz.onlineexam.dao.impl;

import vip.grmz.onlineexam.dao.ScoreDao;
import vip.grmz.onlineexam.entity.Score;
import vip.grmz.onlineexam.utils.DataProcessUtils;

import java.util.List;

/**
 * @author: 苏
 * @createDate: 2022-10-02 15:17
 * @description:
 */
public class ScoreDaoImpl implements ScoreDao {

    @Override
    public List<Score> findMyExamsRecord(int userId) {
        String sql = "SELECT p.paper_id,s.exam_id,p.paper_name,s.score,s.count_score from score s,paper p ,exam e where s.exam_id = e.exam_id and p.paper_id=e.paper_id and s.user_id = ?";
        return DataProcessUtils.getForList(Score.class, sql, userId);
    }

    @Override
    public boolean ifAttended(String userId, String examId) {
        String sql = "select score from score where user_id = ? and exam_id = ?";
        return DataProcessUtils.getInstance(Score.class, sql, userId, examId) != null ? true : false;
    }

    @Override
    public List<Score> findScoreById(int exam_id) {
        String sql = "SELECT s.user_id,u.name,c.class_name, p.paper_name,s.score,s.count_score from user u, score s,paper p , clazz c ,exam e where s.user_id = u.user_id and s.exam_id = e.exam_id and p.paper_id=e.paper_id and c.class_id = u.class_id and s.exam_id = ?";
        return DataProcessUtils.getForList(Score.class, sql, exam_id);
    }

    @Override
    public Long findQualifiedStuNumById(Integer exam_id) {
        String sql = "select * from score where exam_id = ?";
        List<Score> scores = DataProcessUtils.getForList(Score.class, sql, exam_id);
        long count = scores.stream().filter(s -> Double.parseDouble(s.getScore()) >= Double.parseDouble(s.getCount_score()) * 0.6).count();
        return count;
    }

    @Override
    public List<Score> findStuScoreIsZero() {
        String sql = "SELECT s.user_id,u.name,c.class_name, p.paper_name,s.score,s.count_score from user u, score s,paper p , clazz c ,exam e where s.user_id = u.user_id and s.exam_id = e.exam_id and p.paper_id=e.paper_id and c.class_id = u.class_id and s.score = 0";
        return DataProcessUtils.getForList(Score.class,sql);
    }
}
