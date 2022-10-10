package vip.grmz.onlineexam.controller;

import com.alibaba.fastjson.JSONObject;
import vip.grmz.onlineexam.entity.Clazz;
import vip.grmz.onlineexam.entity.Exam;
import vip.grmz.onlineexam.entity.Score;
import vip.grmz.onlineexam.entity.User;
import vip.grmz.onlineexam.service.ClazzService;
import vip.grmz.onlineexam.service.ExamService;
import vip.grmz.onlineexam.service.ScoreService;
import vip.grmz.onlineexam.service.UserService;
import vip.grmz.onlineexam.service.impl.ClazzServiceImpl;
import vip.grmz.onlineexam.service.impl.ExamServiceImpl;
import vip.grmz.onlineexam.service.impl.ScoreServiceImpl;
import vip.grmz.onlineexam.service.impl.UserServiceImpl;
import vip.grmz.onlineexam.utils.UploadUtils;
import vip.grmz.onlineexam.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/userServlet")
public class UserServlet extends BaseServlet {

    private UserService userService = new UserServiceImpl();

    /**
     * 处理登录的功能
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //  1、获取请求的参数
        String username = req.getParameter("username");
        String password = req.getParameter("password");


        // 调用 userService.login()登录处理业务
        User loginUser = userService.login(username, password);
        // 如果等于null,说明登录 失败!
        if (loginUser == null) {
            // 把错误信息，和回显的表单项信息，保存到Request域中
            req.setAttribute("msg", "用户或密码错误！");
            req.setAttribute("username", username);
            //   跳回登录页面
            req.getRequestDispatcher("pages/login.jsp").forward(req, resp);
        } else {

            // 跳转到老师页面
            if (loginUser.getPart() == 1) {
                // 查找学生数量
                Long stuNum = userService.findStudentNum();
                // 查找老师数量
                Long teacherNum = userService.findTeacherNum();
                // 查找班级数量
                Long clazzNum = userService.findClazzNum();
                // 查找试题数量
                Long quesNum = userService.findQuesNum();

                req.setAttribute("stuNum", stuNum);
                req.setAttribute("teacherNum", teacherNum);
                req.setAttribute("clazzNum", clazzNum);
                req.setAttribute("quesNum", quesNum);
                // 登录 成功
                //保存用户登录的信息到session域中
                req.getSession().setAttribute("USER", loginUser);
                //跳到成功页面index.jsp
                req.getRequestDispatcher("userServlet?action=findIndexData").forward(req, resp);
            } else if (loginUser.getPart() == 0) {
                // 登录 成功
                //保存用户登录的信息到session域中
                req.getSession().setAttribute("USER", loginUser);
                req.setAttribute("userId", loginUser.getUser_id());
                req.getRequestDispatcher("examServlet?action=findMyExams").forward(req, resp);
            }
        }
    }

    /**
     * 查找主页的数据
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void findIndexData(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 查找学生数量
        Long stuNum = userService.findStudentNum();
        // 查找老师数量
        Long teacherNum = userService.findTeacherNum();
        // 查找班级数量
        Long clazzNum = userService.findClazzNum();
        // 查找试题数量
        Long quesNum = userService.findQuesNum();

        //
        ExamService examService = new ExamServiceImpl();
        ScoreService scoreService = new ScoreServiceImpl();
        List<Exam> exams = examService.findExams();
        //System.out.println(exams);
        for (Exam exam : exams) {
            Long clazzStuNum = userService.findStuNumById(exam.getClass_id());
            // 根据考试id查询及格人数
            Long qualifiedStuNum = scoreService.findQualifiedStuNumById(exam.getExam_id());

           // System.out.println("及格人数："+qualifiedStuNum);
            // 及格率
            double qualified = (Double.parseDouble(qualifiedStuNum.toString()) / Double.parseDouble(clazzStuNum.toString())) * 100;
         //   System.out.println("及格率"+qualified);
            exam.setQualified(qualified);
        }

        List<Score> scores = scoreService.findStuScoreIsZero();

        req.setAttribute("scores",scores);
        //System.out.println(exams);
        req.setAttribute("exams",exams);
        req.setAttribute("stuNum", stuNum);
        req.setAttribute("teacherNum", teacherNum);
        req.setAttribute("clazzNum", clazzNum);
        req.setAttribute("quesNum", quesNum);
        req.getRequestDispatcher("pages/index.jsp").forward(req, resp);
    }


    /**
     * 处理注册的功能
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void regist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String repassword = req.getParameter("repassword");
        User user = WebUtils.copyParamToBean(req.getParameterMap(), new User());

//        2、检查 验证码是否正确
        if (user.getPassword() != null && user.getPassword().equals(repassword)) {
//        3、检查 用户名是否可用
            if (userService.existsUsername(user.getUsername())) {
                System.out.println("用户名[" + user.getUsername() + "]已存在!");

                // 把回显信息，保存到Request域中
                req.setAttribute("msg", "用户名已存在！！");
                req.setAttribute("username", user.getUsername());
                req.setAttribute("email", user.getEmail());

//        跳回注册页面
                req.getRequestDispatcher("pages/register.jsp").forward(req, resp);
            } else {
                //      可用
//                调用Sservice保存到数据库
                userService.registUser(user.getUsername(), user.getPassword(), user.getEmail());
//
                req.getRequestDispatcher("pages/index.jsp").forward(req, resp);
            }
        } else {
            // 把回显信息，保存到Request域中
            req.setAttribute("msg", "密码和重复密码不一致！！");
            req.setAttribute("username", user.getUsername());
            req.setAttribute("email", user.getEmail());
            req.getRequestDispatcher("pages/register.jsp").forward(req, resp);
        }
    }


    /**
     * 查询所有用户
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void findUsers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> users = userService.findUsers();
        req.setAttribute("users", users);
        String part = req.getParameter("part");
        int i = Integer.parseInt(part);
        if (i == 0) {
            req.getRequestDispatcher("pages/students.jsp").forward(req, resp);
        } else if (i == 1) {
            req.getRequestDispatcher("pages/teachers.jsp").forward(req, resp);
        }
    }


    /**
     * 添加用户
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void addUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String part = req.getParameter("part");
        int i = Integer.parseInt(part);
        User user = WebUtils.copyParamToBean(req.getParameterMap(), new User());
        if (userService.existsUsername(user.getUsername())) {
            System.out.println("用户名[" + user.getUsername() + "]已存在!");

            // 把回显信息，保存到Request域中

            req.getSession().setAttribute("uMsg" + i, "用户名已存在！！");

//        跳回原来页面
            resp.sendRedirect(req.getHeader("Referer") + "?part=" + part);
        } else {
            //      可用
//                调用Sservice保存到数据库
            boolean res = userService.addUser(user);
            if (i == 0) {
                req.getRequestDispatcher("userServlet?action=findUsers&part=0").forward(req, resp);
            } else if (i == 1) {
                req.getRequestDispatcher("userServlet?action=findUsers&part=1").forward(req, resp);
            }
        }

    }


    /**
     * 注销
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1. 销毁Session中用户登录信息
        req.getSession().invalidate();
        //2. 重定向到登陆页面
        resp.sendRedirect(req.getContextPath() + "/pages/login.jsp");

    }


    protected void findUserById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String userid = req.getParameter("userid");
        User user = userService.findUserById(userid);
        req.setAttribute("user", user);
        if (user.getPart() == 0) {
            req.getRequestDispatcher("pages/edit-student.jsp").forward(req, resp);
        } else if (user.getPart() == 1) {
            req.getRequestDispatcher("pages/edit-teacher.jsp").forward(req, resp);
        }

    }

    protected void findUserDetailById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String userid = req.getParameter("userid");
        User user = userService.findUserById(userid);
        req.setAttribute("user", user);
        if (user.getPart() == 0) {
            req.getRequestDispatcher("pages/student-details.jsp").forward(req, resp);
        } else if (user.getPart() == 1) {
            req.getRequestDispatcher("pages/teacher-details.jsp").forward(req, resp);
        }

    }

    protected void updateUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String part = req.getParameter("part");
        int i = Integer.parseInt(part);
        String userid = req.getParameter("userid");
        User user = WebUtils.copyParamToBean(req.getParameterMap(), new User());
        boolean res = userService.updateUser(user, userid);
        if (i == 0) {
            req.getRequestDispatcher("userServlet?action=findUsers&part=0").forward(req, resp);
        } else if (i == 1) {
            req.getRequestDispatcher("userServlet?action=findUsers&part=1").forward(req, resp);
        }

    }


    protected void uploadHeadImg(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String file = UploadUtils.uploadFile(this, req, resp);
        String userId = req.getParameter("userId");
        Integer id = Integer.parseInt(userId);
        boolean res = userService.uploadHeadImg(file, id);
        req.setAttribute("file", file);
//        System.out.println("ty5ytty"+file);
        req.getRequestDispatcher("pages/profile.jsp").forward(req, resp);
    }

    protected void deleteUserById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //  String part = req.getParameter("part");
        String userid = req.getParameter("userid");
        int userId = Integer.parseInt(userid);
        // int i = Integer.parseInt(part);
        boolean res = userService.deleteUserById(userId);
        JSONObject obj = new JSONObject();
        obj.put("result", res);
        resp.getWriter().println(obj);

    }

    protected void updatePassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userid = req.getParameter("userId");

        int userId = Integer.parseInt(userid);

        String oldPassword = req.getParameter("oldPassword");
        String password = req.getParameter("password");
        boolean res = userService.checkPassword(userId, oldPassword);
        if (res) {
            boolean resPwd = userService.updatePassword(userId, password);
            req.setAttribute("result", resPwd);
            req.getRequestDispatcher("pages/profile.jsp").forward(req, resp);
        } else {
            req.setAttribute("msg", "旧密码错误");
            req.getRequestDispatcher("pages/profile.jsp").forward(req, resp);
        }
    }

}
