package vip.grmz.onlineexam.entity;

import java.util.Date;
import java.io.Serializable;

/**
 * (User)实体类
 *
 * @author makejava
 * @since 2022-09-19 18:55:03
 */
public class User implements Serializable {
    private static final long serialVersionUID = 935569684486085296L;
    /**
     * 用户名id
     */
    private Integer user_id;
    /**
     * 用户名
     */
    private String username;
    /**
     * 密码
     */
    private String password;
    /**
     * 手机号码
     */
    private String phone;
    /**
     * 角色（默认0：学生，1：老师，2：管理员）
     */
    private int part;
    /**
     * 注册时间
     */
    private Date regist_time;
    /**
     * 班级id
     */
    private Integer class_id;
    /**
     * 头像
     */
    private String img;
    /**
     * 姓名
     */
    private String name;
    /**
     * 状态（1：正常，0：异常）
     */
    private Integer status;
    /**
     * 邮箱
     */
    private String email;

    /**
     * 地址
     */
    private String address;
    /**
     * 性别   1代表男    0代表女
     */
    private Integer gender;

    /**
     * 年龄
     */
    private Integer age;
    private String class_name;

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getPart() {
        return part;
    }

    public void setPart(int part) {
        this.part = part;
    }

    public Integer getClass_id() {
        return class_id;
    }

    public void setClass_id(Integer class_id) {
        this.class_id = class_id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Date getRegist_time() {
        return regist_time;
    }

    public void setRegist_time(Date regist_time) {
        this.regist_time = regist_time;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_id=" + user_id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", part=" + part +
                ", regist_time=" + regist_time +
                ", class_id=" + class_id +
                ", img='" + img + '\'' +
                ", name='" + name + '\'' +
                ", status=" + status +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", gender=" + gender +
                ", age=" + age +
                ", class_name='" + class_name + '\'' +
                '}';
    }
}

