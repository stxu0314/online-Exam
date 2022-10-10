package vip.grmz.onlineexam.dao;

import vip.grmz.onlineexam.entity.Question;

import java.util.List;

public interface QuestionDao {
    List<Question> findQuestions();

    boolean addQuestion(Question question);

    boolean existQuestion(Question question);

    Question findQuestionById(int id);

    boolean deleteQuestionById(int id);

    boolean updateQuestion(Question question, int id);

    boolean addQuestionToPaper(int id,int paper_id);

    List<Integer> existQuestionInPaper(int parseInt);

    boolean deleteQuestionInPaper(int questionId, int paper_id);

    List<Integer> findQuesNumByCourseId(int courseId);

    void save(List<Question> cachedDataList);
}
