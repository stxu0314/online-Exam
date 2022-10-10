package vip.grmz.onlineexam.service.impl;

import vip.grmz.onlineexam.dao.PaperDao;
import vip.grmz.onlineexam.dao.impl.PaperDaoImpl;
import vip.grmz.onlineexam.entity.Paper;
import vip.grmz.onlineexam.entity.Question;
import vip.grmz.onlineexam.service.PaperService;

import java.util.List;

/**
 * @author: 苏
 * @createDate: 2022-09-25 19:56
 * @description:
 */
public class PaperServiceImpl implements PaperService {

    PaperDao dao = new PaperDaoImpl();

    @Override
    public List<Paper> findPapers() {
        return dao.findPapers();
    }

    @Override
    public boolean findPaperByName(String paperName) {
        return dao.findPaperByName(paperName);
    }

    @Override
    public boolean addPaper(Paper paper) {
        return dao.addPaper(paper);
    }

    @Override
    public Paper findPaperById(int id) {
        return dao.findPaperById(id);
    }

    @Override
    public boolean updatePaper(Paper paper) {
        return dao.updatePaper(paper);
    }

    @Override
    public boolean deletePaperById(int id) {
        return dao.deletePaperById(id);
    }

    @Override
    public List<Question> findPaperQuestions(int id) {
        return dao.findPaperQuestions(id);
    }

    @Override
    public void deleteQusetionInPaper(int paper_id) {
        dao.deleteQusetionInPaper(paper_id);
    }

    @Override
    public List<Question> findQuestionsByCourse(int question_course) {
        return dao.findQuestionsByCourse(question_course);
    }

    @Override
    public boolean randomAddQuestionToPaper(List<Question> result, int paper_id) {
        return dao.randomAddQuestionToPaper(result, paper_id);
    }
}
