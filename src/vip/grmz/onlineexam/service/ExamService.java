package vip.grmz.onlineexam.service;

import vip.grmz.onlineexam.entity.Exam;
import vip.grmz.onlineexam.entity.ExamResult;
import vip.grmz.onlineexam.entity.Question;

import java.util.List;
import java.util.Map;

public interface ExamService {
    List<Exam> findExams();

    boolean addExam(Map<String, String[]> map);

    boolean deleteExamById(Integer examId);

    List<Exam> findMyExams(Integer userId);

    Exam findExamById(int examId);

    boolean insertExamResult(List<ExamResult> results);

    List<Question> findMyExamResult(Integer userId,Integer examId);

    void insertScore(int user_id, int exam_id, int score,int count_score);

    Exam findExamDetailById(int exam_id);
}
