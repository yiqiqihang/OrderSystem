package order.util;

import order.pojo.users;
import order.server.usersService;
import order.server.usersServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //调用usersservice层完成登录功能
        usersService usersService = new usersServiceImpl();
        //逻辑：获取到用户输入的验证码和 session 中的验证码进行比较
        String checkcode = request.getParameter("checkcode");
        HttpSession session = request.getSession();
        String code = (String)session.getAttribute("code");
        //比较表示不区分大小写比较
        if (!checkcode.equalsIgnoreCase(code)){
            //保存一个登录信息到session中
            session.setAttribute("loginMsg","验证码错误");
            //跳转到登录界面
            response.sendRedirect("login.jsp");
            return;//如果验证码都没有验证成功则直接结束
        }
        //验证码成功则需要去完成登录功能
        //获取前端的数据
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println("登录时的用户名和密码是："+username+","+password);
        //service中有个登录方法
        users login = usersService.login(username, password);
        if(login!=null){
            //登录成功，跳转到main.jsp界面
            session.setAttribute("users",login);
            //获取上次登录的时间
            Cookie[] cookies= request.getCookies();
            //将上次登录的时间保存到cookie中
            String lasttime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

            if (cookies!=null){
                for (Cookie cookie:cookies){
                    String name = cookie.getName();
                    if (name.equals("lasttime")){
                        //说明已经登录过
                        //将以前登录过的时间保存到session中
                        lasttime = URLDecoder.decode(cookie.getValue(),"utf-8");
                    }
                }
            }

            session.setAttribute("lasttimesession",lasttime);

            Cookie cookie = new Cookie("lasttime", URLEncoder.encode(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()),"utf-8"));
            response.addCookie(cookie);
            //重定向
            response.sendRedirect("main.jsp");
        }else {
            //登录失败
            //跳转到登录界面也是要提示
            session.setAttribute("loginMsg","用户名或密码错误，请检查！");
            response.sendRedirect("login.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
