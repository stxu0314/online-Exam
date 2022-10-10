package vip.grmz.onlineexam.dao;

import vip.grmz.onlineexam.entity.Course;

import java.util.List;

/**
 * @author: 苏
 * @createDate: 2022-09-25 16:24
 * @description:
 */
public interface CourseDao {
    List<Course> findCourses();
}
