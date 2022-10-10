package vip.grmz.onlineexam.entity;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;

import java.io.Serializable;

/**
 * (Question)实体类
 *
 * @author makejava
 * @since 2022-09-24 15:48:10
 */
public class Question implements Serializable {
    private static final long serialVersionUID = 328680899371283060L;
    /**
     * 题目编号
     */
    @ExcelIgnore
    private Integer question_id;
    /**
     * 题目类型x单选，y多选，z判断
     */
    @ExcelProperty("试题类型")
    private String question_type;
    /**
     * 是什么课程的问题python，java,c等
     */
    @ExcelProperty("试题课程")
    private Integer question_course;
    /**
     * 题目问题
     */
    @ExcelProperty("题目")
    private String question_name;
    /**
     * 选项A
     */
    @ExcelProperty("选项A")
    private String question_opa;
    /**
     * 选项B
     */
    @ExcelProperty("选项B")
    private String question_opb;
    /**
     * 选项C
     */
    @ExcelProperty("选项C")
    private String question_opc;
    /**
     * 选项D
     */
    @ExcelProperty("选项D")
    private String question_opd;
    /**
     * 正确选项
     */
    @ExcelProperty("正确答案")
    private String question_opright;


    /**
     * 我的选项
     */
    @ExcelIgnore
    private String my_op;

    @ExcelIgnore
    private String course_name;

    public Integer getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(Integer question_id) {
        this.question_id = question_id;
    }

    public String getQuestion_type() {
        return question_type;
    }

    public void setQuestion_type(String question_type) {
        this.question_type = question_type;
    }


    public String getQuestion_name() {
        return question_name;
    }

    public void setQuestion_name(String question_name) {
        this.question_name = question_name;
    }

    public String getQuestion_opa() {
        return question_opa;
    }

    public void setQuestion_opa(String question_opa) {
        this.question_opa = question_opa;
    }

    public String getQuestion_opb() {
        return question_opb;
    }

    public void setQuestion_opb(String question_opb) {
        this.question_opb = question_opb;
    }

    public String getQuestion_opc() {
        return question_opc;
    }

    public void setQuestion_opc(String question_opc) {
        this.question_opc = question_opc;
    }

    public String getQuestion_opd() {
        return question_opd;
    }

    public void setQuestion_opd(String question_opd) {
        this.question_opd = question_opd;
    }

    public String getQuestion_opright() {
        return question_opright;
    }

    public void setQuestion_opright(String question_opright) {
        this.question_opright = question_opright;
    }

    public Integer getQuestion_course() {
        return question_course;
    }

    public void setQuestion_course(Integer question_course) {
        this.question_course = question_course;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public String getMy_op() {
        return my_op;
    }

    public void setMy_op(String my_op) {
        this.my_op = my_op;
    }

    @Override
    public String toString() {
        return "Question{" +
                "question_id=" + question_id +
                ", question_type='" + question_type + '\'' +
                ", question_course=" + question_course +
                ", question_name='" + question_name + '\'' +
                ", question_opa='" + question_opa + '\'' +
                ", question_opb='" + question_opb + '\'' +
                ", question_opc='" + question_opc + '\'' +
                ", question_opd='" + question_opd + '\'' +
                ", question_opright='" + question_opright + '\'' +
                ", my_op='" + my_op + '\'' +
                ", course_name='" + course_name + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Question question = (Question) o;

        if (question_id != null ? !question_id.equals(question.question_id) : question.question_id != null)
            return false;
        if (question_type != null ? !question_type.equals(question.question_type) : question.question_type != null)
            return false;
        if (question_course != null ? !question_course.equals(question.question_course) : question.question_course != null)
            return false;
        if (question_name != null ? !question_name.equals(question.question_name) : question.question_name != null)
            return false;
        if (question_opa != null ? !question_opa.equals(question.question_opa) : question.question_opa != null)
            return false;
        if (question_opb != null ? !question_opb.equals(question.question_opb) : question.question_opb != null)
            return false;
        if (question_opc != null ? !question_opc.equals(question.question_opc) : question.question_opc != null)
            return false;
        if (question_opd != null ? !question_opd.equals(question.question_opd) : question.question_opd != null)
            return false;
        if (question_opright != null ? !question_opright.equals(question.question_opright) : question.question_opright != null)
            return false;
        return course_name != null ? course_name.equals(question.course_name) : question.course_name == null;
    }

    @Override
    public int hashCode() {
        int result = question_id != null ? question_id.hashCode() : 0;
        result = 31 * result + (question_type != null ? question_type.hashCode() : 0);
        result = 31 * result + (question_course != null ? question_course.hashCode() : 0);
        result = 31 * result + (question_name != null ? question_name.hashCode() : 0);
        result = 31 * result + (question_opa != null ? question_opa.hashCode() : 0);
        result = 31 * result + (question_opb != null ? question_opb.hashCode() : 0);
        result = 31 * result + (question_opc != null ? question_opc.hashCode() : 0);
        result = 31 * result + (question_opd != null ? question_opd.hashCode() : 0);
        result = 31 * result + (question_opright != null ? question_opright.hashCode() : 0);
        result = 31 * result + (course_name != null ? course_name.hashCode() : 0);
        return result;
    }
}

