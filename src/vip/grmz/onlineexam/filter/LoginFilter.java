package vip.grmz.onlineexam.filter;

import vip.grmz.onlineexam.entity.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author: 苏
 * @createDate: 2022-10-03 20:37
 * @description:
 */

//访问权限控制过滤
@WebFilter(filterName = "LoginFilter",urlPatterns = {"/*"},
        initParams = {@WebInitParam(name = "version",value = "2.0")},
        dispatcherTypes = {DispatcherType.FORWARD,
                DispatcherType.REQUEST,DispatcherType.INCLUDE,DispatcherType.ERROR}
)
public class LoginFilter implements Filter {
    private List<String> urls;  //存放不要过滤的资源

    //初始化方法
    @Override
    public void init(FilterConfig config) throws ServletException {
        //存放不要过滤的资源
        urls = new ArrayList<>();
        urls.add("/pages/login.jsp");
        urls.add("/pages/register.jsp");
        urls.add("/index.jsp");
        urls.add("/pages/common/header.jsp");
        urls.add("/pages/common/sidebar.jsp");
        urls.add("/pages/common/sidebar-stu.jsp");
        urls.add("/error/error-404.jsp");
        urls.add("/userServlet");
    }

    @Override
    public void destroy() {
    }

    //过滤器核心处理方法 1.从session中获取用户信息  2.判断是否登录   登录--放行   3.没登录--跳转到登录页面去登录
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        //1.获取请求和响应对象
        HttpServletRequest req = (HttpServletRequest)request;
        HttpServletResponse rep = (HttpServletResponse)response;
        //2.获取访问路径
        String path =  req.getServletPath();  //  /welcome.jsp
        //3.获取项目的路径
        String base = req.getContextPath();// /FreshShop_war_exploded
        //System.out.println(path+" ---- "+base); //

        //4.获取session对象
        HttpSession session = req.getSession();
        //5.从session中获取用户信息
        User user =  (User)session.getAttribute("USER");
        //6.判断是否是需要过滤的资源
        if (!urls.contains(path)&&!path.endsWith(".js")
                &&!path.endsWith(".css")
                &&!path.endsWith(".jpg")&&!path.endsWith(".png")){  //需要---判断是否登录
            //7.判断是否登录
            if (user==null){
                //8.没登录--跳转到登录页面去登录
                rep.sendRedirect(base+"/pages/login.jsp");
            }else{
                //9.登录--放行
                chain.doFilter(request, response);
            }

        }else{  //不需要过滤--放行
            chain.doFilter(request, response);  //放行
        }

    }
}

