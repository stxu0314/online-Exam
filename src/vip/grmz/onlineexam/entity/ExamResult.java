package vip.grmz.onlineexam.entity;

import java.io.Serializable;

/**
 * (ExamResult)实体类
 *
 * @author makejava
 * @since 2022-09-29 20:39:42
 */
public class ExamResult implements Serializable {
    private static final long serialVersionUID = -56659388947226053L;
    /**
     * 考试结果id
     */
    private Integer result_id;
    /**
     * 题目id
     */
    private Integer question_id;
    /**
     * 学生id
     */
    private Integer user_id;
    /**
     * 我的选项
     */
    private String my_op;
    /**
     * 考试id
     */
    private Integer exam_id;
    /**
     * 试卷id
     */
    private Integer paper_id;
    /**
     * 本题成绩
     */
    private Integer score;

    public Integer getResult_id() {
        return result_id;
    }

    public void setResult_id(Integer result_id) {
        this.result_id = result_id;
    }

    public Integer getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(Integer question_id) {
        this.question_id = question_id;
    }

    public String getMy_op() {
        return my_op;
    }

    public void setMy_op(String my_op) {
        this.my_op = my_op;
    }

    public Integer getExam_id() {
        return exam_id;
    }

    public void setExam_id(Integer exam_id) {
        this.exam_id = exam_id;
    }

    public Integer getPaper_id() {
        return paper_id;
    }

    public void setPaper_id(Integer paper_id) {
        this.paper_id = paper_id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "ExamResult{" +
                "result_id=" + result_id +
                ", question_id=" + question_id +
                ", user_id=" + user_id +
                ", my_op='" + my_op + '\'' +
                ", exam_id=" + exam_id +
                ", paper_id=" + paper_id +
                ", score=" + score +
                '}';
    }
}

