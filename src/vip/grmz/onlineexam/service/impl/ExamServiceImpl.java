package vip.grmz.onlineexam.service.impl;

import vip.grmz.onlineexam.dao.ExamDao;
import vip.grmz.onlineexam.dao.impl.ExamDaoImpl;
import vip.grmz.onlineexam.entity.Exam;
import vip.grmz.onlineexam.entity.ExamResult;
import vip.grmz.onlineexam.entity.Question;
import vip.grmz.onlineexam.service.ExamService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author: 苏
 * @createDate: 2022-09-27 15:18
 * @description:
 */
public class ExamServiceImpl implements ExamService {

    private ExamDao dao = new ExamDaoImpl();

    @Override
    public List<Exam> findExams() {
        return dao.findExams();
    }

    @Override
    public boolean addExam(Map<String, String[]> map) {
        return dao.addExam(map);
    }

    @Override
    public boolean deleteExamById(Integer examId) {
        return dao.deleteExamById(examId);
    }

    @Override
    public List<Exam> findMyExams(Integer userId) {
        return dao.findMyExams(userId);
    }

    @Override
    public Exam findExamById(int exam_id) {
        return dao.findExamById(exam_id);
    }

    @Override
    public boolean insertExamResult(List<ExamResult> results) {

        return dao.insertExamResult(results);
    }

    @Override
    public List<Question> findMyExamResult(Integer userId,Integer examId) {
        return dao.findMyExamResult(userId,examId);
    }

    @Override
    public void insertScore(int user_id, int exam_id, int score,int count_score) {
        dao.insertScore(user_id,exam_id,score,count_score);
    }

    @Override
    public Exam findExamDetailById(int exam_id) {
        return dao.findExamDetailById(exam_id);
    }
}
