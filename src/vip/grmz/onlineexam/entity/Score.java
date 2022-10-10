package vip.grmz.onlineexam.entity;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

/**
 * @author: 苏
 * @createDate: 2022-10-02 11:35
 * @description:
 */
@Getter
@Setter
@EqualsAndHashCode
public class Score {

    @ExcelProperty(value = "学号",index = 0)
    private Integer  user_id;
    @ExcelProperty(value = "所在班级",index = 2)
    private String class_name;
    @ExcelProperty(value = "试卷名",index = 3)
    private String paper_name;
    @ExcelIgnore
    private Integer paper_id;
    @ExcelIgnore
    private Integer exam_id;
    @ExcelProperty(value = "成绩",index = 4)
    private String score;
    @ExcelProperty(value = "总分",index = 5)
    private String count_score;
    @ExcelProperty(value = "学生姓名",index = 1)
    private String name;

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Integer getExam_id() {
        return exam_id;
    }

    public void setExam_id(Integer exam_id) {
        this.exam_id = exam_id;
    }

    public String getScore() {
        return score;
    }

    public Integer getPaper_id() {
        return paper_id;
    }

    public void setPaper_id(Integer paper_id) {
        this.paper_id = paper_id;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    public String getPaper_name() {
        return paper_name;
    }

    public void setPaper_name(String paper_name) {
        this.paper_name = paper_name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCount_score() {
        return count_score;
    }

    public void setCount_score(String count_score) {
        this.count_score = count_score;
    }

    @Override
    public String toString() {
        return "Score{" +
                "user_id=" + user_id +
                ", class_name='" + class_name + '\'' +
                ", paper_name='" + paper_name + '\'' +
                ", paper_id=" + paper_id +
                ", exam_id=" + exam_id +
                ", score='" + score + '\'' +
                ", count_score='" + count_score + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
