package vip.grmz.onlineexam.dao.impl;

import vip.grmz.onlineexam.dao.UserDao;
import vip.grmz.onlineexam.entity.User;
import vip.grmz.onlineexam.utils.DataProcessUtils;

import java.util.List;

/**
 * @author: 苏
 * @createDate: 2022-09-19 18:58
 * @description:
 */
public class UserDaoImpl implements UserDao {

    /**
     * 根据用户名和密码查询用户信息
     *
     * @param username
     * @param password
     * @return
     */
    @Override
    public User login(String username, String password) {
        String sql = "SELECT * FROM user WHERE username = ? and password = ?";
        return DataProcessUtils.getInstance(User.class, sql, username, password);
    }

    /**
     * 查询用户名是否存在
     *
     * @param username
     * @return
     */
    @Override
    public boolean existsUsername(String username) {
        String sql = "SELECT username FROM user WHERE username = ?";
        User user = DataProcessUtils.getInstance(User.class, sql, username);
        return user != null ? true : false;
    }

    /**
     * 注册
     *
     * @param username
     * @param password
     * @param email
     */
    @Override
    public void registerUser(String username, String password, String email) {
        String sql = "INSERT INTO user (username, password, email,regist_time) VALUES (?,?,?,now())";
        DataProcessUtils.update(sql, username, password, email);
    }

    @Override
    public List<User> findUsers() {
        String sql = "SELECT u.*,c.class_name FROM user u left join clazz c on u.class_id = c.class_id";
        return DataProcessUtils.getForList(User.class, sql);
    }

    @Override
    public boolean addUser(User user) {
        String sql = "INSERT INTO user values(null,?,?,?,?,now(),?,?,?,1,?,?,?,?)";
        int res = DataProcessUtils.update(sql, user.getUsername(), user.getPassword(), user.getPhone(), user.getPart(), user.getClass_id(), user.getImg(),
                user.getName(), user.getEmail(), user.getAddress(), user.getGender(), user.getAge());
        return res == 1 ? true : false;
    }

    @Override
    public User findUserById(String userid) {
        String sql = "SELECT * FROM user WHERE user_id = ?";
        return DataProcessUtils.getInstance(User.class, sql, userid);
    }

    @Override
    public boolean updateUser(User user, String userid) {
        String sql = "UPDATE user SET password=?,phone=?,part=?,class_id=?,img=?,name=?,email=?,address=?,gender=?,age=? where user_id=?";
        int update = DataProcessUtils.update(sql, user.getPassword(), user.getPhone(), user.getPart(), user.getClass_id(), user.getImg(),
                user.getName(), user.getEmail(), user.getAddress(), user.getGender(), user.getAge(), userid);
        return update > 0 ? true : false;
    }

    @Override
    public boolean deleteUserById(int userId) {
        String sql = "DELETE FROM user WHERE user_id = ?";
        return DataProcessUtils.update(sql, userId) > 0 ? true : false;
    }

    @Override
    public Long findStudentNum() {
        String sql = "select count(username) from user where part = 0";
        return (Long) DataProcessUtils.queryForSingleValue(sql);
    }

    @Override
    public Long findTeacherNum() {
        String sql = "select count(username) from user where part = 1";
        return (Long) DataProcessUtils.queryForSingleValue(sql);
    }

    @Override
    public Long findClazzNum() {
        String sql = "select count(class_id) from clazz";
        return (Long) DataProcessUtils.queryForSingleValue(sql);
    }

    @Override
    public Long findQuesNum() {
        String sql = "select count(question_name) from question";
        return (Long) DataProcessUtils.queryForSingleValue(sql);
    }

    @Override
    public boolean uploadHeadImg(String file, Integer id) {
        String sql = "Update user set img = ? where user_id = ?";
        return DataProcessUtils.update(sql,file,id) > 0 ? true : false;
    }

    @Override
    public boolean checkPassword(int userId, String oldPassword) {
        String sql = "select username from user where user_id = ? and password = ?";
        return DataProcessUtils.getInstance(User.class,sql,userId,oldPassword) != null ? true : false;
    }

    @Override
    public boolean updatePassword(int userId, String password) {
        String sql = "update user set password = ? where user_id = ?";
        return DataProcessUtils.update(sql,password, userId) > 0 ? true : false;
    }

    @Override
    public Long findStuNumById(Integer class_id) {
        String sql = "select count(user_id) from user where class_id = ? and part = 0";
        return (Long) DataProcessUtils.queryForSingleValue(sql,class_id);
    }
}
