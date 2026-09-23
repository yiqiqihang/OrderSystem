package order.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class CheckLoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //注意登录注册、和一些不用过滤器的需要放行
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse)  resp;
        //获取用户提交的uri
        String uri = request.getRequestURI();
        //contains：表示字符串中是否包含某个值
        if (uri.contains("login.jsp")
                ||uri.contains("LoginService")
                ||uri.contains("CheckCodeUtile")
                ||uri.contains("register.jsp")
//                ||uri.contains("404.jsp")
//                ||uri.contains("500.jsp")
                ||uri.endsWith(".js")
                ||uri.endsWith(".css")
                ||uri.contains("layui")
                ||uri.contains("logincss")
                ||uri.contains("imgs")
                ||uri.contains("register.do")){
            //放行
            chain.doFilter(req,resp);
        }else{
            //判断用户是否登录
            //获得session中的用户对象，如果这个对象是null则小明用户没有登录直接跳转到登录界面
            HttpSession session = request.getSession();
            Object users = session.getAttribute("users");
            if(users==null){
                //跳转到登录界面
                response.sendRedirect("login.jsp");
            }else{
                //放行
                chain.doFilter(req,resp);
            }
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
