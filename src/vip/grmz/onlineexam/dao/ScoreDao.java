package vip.grmz.onlineexam.dao;

import vip.grmz.onlineexam.entity.Score;

import java.util.List;

public interface ScoreDao {

    List<Score> findMyExamsRecord(int userId);

    boolean ifAttended(String userId, String examId);

    List<Score> findScoreById(int exam_id);

    Long findQualifiedStuNumById(Integer exam_id);

    List<Score> findStuScoreIsZero();
}
