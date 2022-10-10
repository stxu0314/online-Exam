package vip.grmz.onlineexam.service;

import vip.grmz.onlineexam.entity.Clazz;

import java.util.List;

public interface ClazzService {
    List<Clazz> findClasses();

    boolean existClass(String className);

    boolean addClazz(String userid, String className);

    boolean deleteClassById(int id);
}
