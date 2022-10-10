package vip.grmz.onlineexam.entity;

import java.io.Serializable;

/**
 * (Course)实体类
 *
 * @author makejava
 * @since 2022-09-25 16:21:24
 */
public class Course implements Serializable {
    private static final long serialVersionUID = -35696573282433175L;
    /**
     * 课程id
     */
    private Integer course_id;
    /**
     * 课程名
     */
    private String course_name;


    public Integer getCourse_id() {
        return course_id;
    }

    public void setCourse_id(Integer course_id) {
        this.course_id = course_id;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    @Override
    public String toString() {
        return "Course{" +
                "course_id=" + course_id +
                ", course_name='" + course_name + '\'' +
                '}';
    }
}

