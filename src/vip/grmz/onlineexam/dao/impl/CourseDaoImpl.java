package vip.grmz.onlineexam.dao.impl;

import vip.grmz.onlineexam.dao.CourseDao;
import vip.grmz.onlineexam.entity.Course;
import vip.grmz.onlineexam.utils.DataProcessUtils;

import java.util.List;

/**
 * @author: 苏
 * @createDate: 2022-09-25 16:27
 * @description:
 */
public class CourseDaoImpl implements CourseDao {
    @Override
    public List<Course> findCourses() {
        String sql = "select * from course";
        return DataProcessUtils.getForList(Course.class,sql);
    }
}
