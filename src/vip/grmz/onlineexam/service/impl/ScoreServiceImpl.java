package vip.grmz.onlineexam.service.impl;

import vip.grmz.onlineexam.dao.ScoreDao;
import vip.grmz.onlineexam.dao.impl.ScoreDaoImpl;
import vip.grmz.onlineexam.entity.Score;
import vip.grmz.onlineexam.service.ScoreService;

import java.util.List;

/**
 * @author: 苏
 * @createDate: 2022-10-02 15:16
 * @description:
 */
public class ScoreServiceImpl implements ScoreService {
    private ScoreDao dao = new ScoreDaoImpl();

    @Override
    public List<Score> findMyExamsRecord(int userId) {
        return dao.findMyExamsRecord(userId);
    }

    @Override
    public boolean ifAttended(String userId, String examId) {
        return dao.ifAttended(userId, examId);
    }

    @Override
    public List<Score> findScoreById(int exam_id) {
        return dao.findScoreById(exam_id);
    }

    @Override
    public Long findQualifiedStuNumById(Integer exam_id) {
        return  dao.findQualifiedStuNumById(exam_id);
    }

    @Override
    public List<Score> findStuScoreIsZero() {
        return dao.findStuScoreIsZero();
    }
}
