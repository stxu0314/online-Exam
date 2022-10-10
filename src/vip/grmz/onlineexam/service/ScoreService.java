package vip.grmz.onlineexam.service;

import vip.grmz.onlineexam.entity.Score;

import java.util.List;

public interface ScoreService {

    List<Score> findMyExamsRecord(int userId);

    boolean ifAttended(String userId, String examId);

    List<Score> findScoreById(int exam_id);

    Long findQualifiedStuNumById(Integer exam_id);

    List<Score> findStuScoreIsZero();
}
