package vip.grmz.onlineexam.dao;

import vip.grmz.onlineexam.entity.Paper;
import vip.grmz.onlineexam.entity.Question;

import java.util.List;

public interface PaperDao {
    List<Paper> findPapers();

    boolean findPaperByName(String paperName);

    boolean addPaper(Paper paper);

    Paper findPaperById(int id);

    boolean updatePaper(Paper paper);

    boolean deletePaperById(int id);

    List<Question> findPaperQuestions(int id);

    void deleteQusetionInPaper(int paper_id);

    List<Question> findQuestionsByCourse(int question_course);

    boolean randomAddQuestionToPaper(List<Question> result, int paper_id);
}
