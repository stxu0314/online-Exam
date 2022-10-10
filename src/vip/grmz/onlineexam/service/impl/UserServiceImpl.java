package vip.grmz.onlineexam.service.impl;

import vip.grmz.onlineexam.dao.UserDao;
import vip.grmz.onlineexam.dao.impl.UserDaoImpl;
import vip.grmz.onlineexam.entity.User;
import vip.grmz.onlineexam.service.UserService;

import java.util.List;

/**
 * @author: 苏
 * @createDate: 2022-09-19 18:57
 * @description:
 */
public class UserServiceImpl implements UserService {

    private UserDao dao = new UserDaoImpl();
    @Override
    public void registUser(String username, String password, String email) {
        dao.registerUser(username, password, email);
    }

    @Override
    public User login(String username, String password) {
        return dao.login(username,password);
    }

    @Override
    public boolean existsUsername(String username) {
        return dao.existsUsername(username);
    }

    @Override
    public List<User> findUsers() {
        return dao.findUsers();
    }

    @Override
    public boolean addUser(User user) {
        return dao.addUser(user);
    }

    @Override
    public User findUserById(String userid) {
        return dao.findUserById(userid);
    }

    @Override
    public boolean updateUser(User user,String userid) {
        return dao.updateUser(user,userid);
    }

    @Override
    public boolean deleteUserById(int userId) {
        return dao.deleteUserById(userId);
    }

    @Override
    public Long findStudentNum() {
        return dao.findStudentNum();
    }

    @Override
    public Long findTeacherNum() {
        return dao.findTeacherNum();
    }

    @Override
    public Long findClazzNum() {
        return dao.findClazzNum();
    }

    @Override
    public Long findQuesNum() {
        return dao.findQuesNum();
    }

    @Override
    public boolean uploadHeadImg(String file, Integer id) {
        return dao.uploadHeadImg(file,id);
    }

    @Override
    public boolean checkPassword(int userId, String oldPassword) {
        return dao.checkPassword(userId, oldPassword);
    }

    @Override
    public boolean updatePassword(int userId, String password) {
        return dao.updatePassword(userId,password);
    }

    @Override
    public Long findStuNumById(Integer class_id) {
        return dao.findStuNumById(class_id);

    }
}
