package vip.grmz.onlineexam.dao;

import vip.grmz.onlineexam.entity.User;

import java.util.List;

public interface UserDao {
    User login(String username, String password);

    boolean existsUsername(String username);

    void registerUser(String username, String password, String email);

    List<User> findUsers();

    boolean addUser(User user);

    User findUserById(String userid);

    boolean updateUser(User user,String userid);

    boolean deleteUserById(int userId);

    Long findStudentNum();

    Long findTeacherNum();

    Long findClazzNum();

    Long findQuesNum();

    boolean uploadHeadImg(String file, Integer id);

    boolean checkPassword(int userId, String oldPassword);

    boolean updatePassword(int userId, String password);

    Long findStuNumById(Integer class_id);
}
