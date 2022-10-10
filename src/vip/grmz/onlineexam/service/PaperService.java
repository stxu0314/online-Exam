package vip.grmz.onlineexam.service;

import vip.grmz.onlineexam.controller.QuestionServlet;
import vip.grmz.onlineexam.entity.Paper;
import vip.grmz.onlineexam.entity.Question;

import java.util.List;

public interface PaperService {
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
