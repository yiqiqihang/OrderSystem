package order;

import order.server.usersService;
import order.server.usersServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet({"/loginout.do"})
public class usersController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        usersService usersService = new usersServiceImpl();
        String uri = request.getRequestURI();
        if (uri.endsWith("loginout.do")) {
            //安全退出
            //跳转到登录界面
            //清空session中的用户
            HttpSession session = request.getSession();
            session.removeAttribute("users");//清空登录的账号
            response.sendRedirect("login.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
