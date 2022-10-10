package vip.grmz.onlineexam.dao;

import vip.grmz.onlineexam.entity.Clazz;

import java.util.List;

public interface ClazzDao {
    List<Clazz> findClasses();

    boolean existClass(String className);

    boolean addClazz(String userid, String className);

    boolean deleteClassById(int id);

}
