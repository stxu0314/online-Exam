package vip.grmz.onlineexam.service.impl;

import vip.grmz.onlineexam.dao.QuestionDao;
import vip.grmz.onlineexam.dao.impl.QuestionDaoImpl;
import vip.grmz.onlineexam.entity.Question;
import vip.grmz.onlineexam.service.QuestionService;

import java.util.List;

/**
 * @author: 苏
 * @createDate: 2022-09-24 15:51
 * @description:
 */
public class QuestionServiceImpl implements QuestionService {
    QuestionDao dao = new QuestionDaoImpl();
    @Override
    public List<Question> findQuestions() {
        return dao.findQuestions();
    }

    @Override
    public boolean addQuestion(Question question) {
        return dao.addQuestion(question);
    }

    @Override
    public boolean existQuestion(Question question) {
        return dao.existQuestion(question);
    }

    @Override
    public Question findQuestionById(int id) {
        return dao.findQuestionById(id);
    }

    @Override
    public boolean deleteQuestionById(int id) {
        return dao.deleteQuestionById(id);
    }

    @Override
    public boolean updateQuestion(Question question, int id) {
        return dao.updateQuestion(question,id);
    }

    @Override
    public boolean addQuestionToPaper(int id,int paper_id) {
        return dao.addQuestionToPaper(id,paper_id);
    }

    @Override
    public List<Integer> existQuestionInPaper(int parseInt) {
        return dao.existQuestionInPaper(parseInt);
    }

    @Override
    public boolean deleteQuestionInPaper(int questionId, int paper_id) {
        return dao.deleteQuestionInPaper(questionId,paper_id);
    }

    @Override
    public List<Integer> findQuesNumByCourseId(int courseId) {
        return dao.findQuesNumByCourseId(courseId);
    }
}
