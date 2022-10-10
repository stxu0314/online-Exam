package vip.grmz.onlineexam.entity;

import vip.grmz.onlineexam.utils.TimeUtils;

import java.util.Date;
import java.io.Serializable;

/**
 * (Clazz)实体类
 *
 * @author makejava
 * @since 2022-09-22 19:50:48
 */
public class Clazz implements Serializable {
    private static final long serialVersionUID = 945425097003294736L;
    /**
     * 班级id
     */
    private Integer class_id;
    /**
     * 班级名
     */
    private String class_name;
    
    private Integer create_user_id;
    /**
     * 创建时间
     */
    private Date create_time;

    private String studentNum;

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

    public Integer getCreate_user_id() {
        return create_user_id;
    }

    public void setCreate_user_id(Integer create_user_id) {
        this.create_user_id = create_user_id;
    }

    public String getCreate_time() {
        return TimeUtils.dateToString(create_time);
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public String getStudentNum() {
        return studentNum;
    }

    public void setStudentNum(String studentNum) {
        this.studentNum = studentNum;
    }

    @Override
    public String toString() {
        return "Clazz{" +
                "class_id=" + class_id +
                ", class_name='" + class_name + '\'' +
                ", create_user_id=" + create_user_id +
                ", create_time=" + create_time +
                ", studentNum=" + studentNum +
                '}';
    }
}

