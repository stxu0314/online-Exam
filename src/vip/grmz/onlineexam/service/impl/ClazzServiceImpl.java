package vip.grmz.onlineexam.service.impl;

import vip.grmz.onlineexam.dao.ClazzDao;
import vip.grmz.onlineexam.dao.impl.ClazzDaoImpl;
import vip.grmz.onlineexam.entity.Clazz;
import vip.grmz.onlineexam.service.ClazzService;

import java.util.List;

/**
 * @author: 苏
 * @createDate: 2022-09-22 19:57
 * @description:
 */
public class ClazzServiceImpl implements ClazzService {
    private ClazzDao dao = new ClazzDaoImpl();

    @Override
    public List<Clazz> findClasses() {
        return dao.findClasses();
    }

    @Override
    public boolean existClass(String className) {
        return dao.existClass(className);
    }

    @Override
    public boolean addClazz(String userid, String className) {
        return dao.addClazz(userid, className);
    }

    @Override
    public boolean deleteClassById(int id) {
        return dao.deleteClassById(id);
    }

}
