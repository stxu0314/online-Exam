package vip.grmz.onlineexam.service.impl;


import vip.grmz.onlineexam.dao.CourseDao;
import vip.grmz.onlineexam.dao.impl.CourseDaoImpl;
import vip.grmz.onlineexam.entity.Course;
import vip.grmz.onlineexam.service.CourseService;

import java.util.List;

/**
 * @author: 苏
 * @createDate: 2022-09-25 16:23
 * @description:
 */
public class CourseServiceImpl implements CourseService {
    CourseDao dao = new CourseDaoImpl();
    @Override
    public List<Course> findCourses() {
        return dao.findCourses();
    }
}
