package vip.grmz.onlineexam.entity;

import vip.grmz.onlineexam.utils.TimeUtils;

import java.sql.Timestamp;
import java.util.Date;
import java.io.Serializable;

/**
 * (Exam)实体类
 *
 * @author makejava
 * @since 2022-09-27 15:04:35
 */
public class Exam implements Serializable {
    private static final long serialVersionUID = 177149033999932231L;
    /**
     * 考试安排编号
     */
    private Integer exam_id;
    /**
     * 对应试卷
     */
    private Integer paper_id;
    /**
     * 开始时间
     */
    private Timestamp exam_begin;
    /**
     *  结束时间
     */
    private Timestamp exam_end;

    /**
     * 班级id
     */
    private Integer class_id;

    /**
     * 班级名
     */
    private String class_name;

    /**
     * 试卷名
     */
    private String paper_name;

    /**
     * 状态
     */
    private String status;
    /**
     * 用户id
     */
    private Integer user_id;

    /**
     * 及格率
     */
    private Double qualified;

    public Double getQualified() {
        return qualified;
    }

    public void setQualified(Double qualified) {
        this.qualified = qualified;
    }

    public String getStatus() {
        Date date = new Date();
        if (this.exam_end.getTime() < date.getTime()){
            this.status = "已结束";
        }else if (this.exam_end.getTime() >= date.getTime() && this.exam_begin.getTime() <= date.getTime()){
            this.status = "进行中";
        }else{
            this.status = "未开始";
        }
        return status;
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

    public String getExam_begin() {
        return TimeUtils.dateToString(exam_begin);
    }

    public void setExam_begin(Timestamp exam_begin) {
        this.exam_begin = exam_begin;
    }

    public String getExam_end() {
        return TimeUtils.dateToString(exam_end);
    }

    public void setExam_end(Timestamp exam_end) {
        this.exam_end = exam_end;
    }

    public Integer getClass_id() {
        return class_id;
    }

    public void setClass_id(Integer class_id) {
        this.class_id = class_id;
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


    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    @Override
    public String toString() {
        return "Exam{" +
                "exam_id=" + exam_id +
                ", paper_id=" + paper_id +
                ", exam_begin=" + exam_begin +
                ", exam_end=" + exam_end +
                ", class_id=" + class_id +
                ", class_name='" + class_name + '\'' +
                ", paper_name='" + paper_name + '\'' +
                ", status='" + status + '\'' +
                ", user_id=" + user_id +
                ", qualified=" + qualified +
                '}';
    }
}

