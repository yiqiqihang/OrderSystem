package order;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import order.pojo.menu;
import order.pojo.pageInfo;
import order.pojo.recipe;
import order.pojo.storage;
import order.server.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.awt.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet({"/addMenu.do","/selectMenu.do","/checkMenu.do","/addDoubleMenu.do","/delectMenu.do","/selectMenucheck.do","/addToMenu.do"})
public class menuController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //解决中文乱码问题
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("utf-8");
        //service层查询课程
        menuService menuService = new menuServiceImpl();
        //判断访问的是哪个功能
        String uri = request.getRequestURI();
        if (uri.endsWith("addMenu.do")) {
            String side = "0";
//          获取前端的数据
            String M_ID = request.getParameter("r_ID");
            String M_NAME = request.getParameter("r_NAME");
            String M_GENRE = request.getParameter("r_GENRE");
            String M_UNIT = request.getParameter("r_UNIT");
            String M_PRICE = request.getParameter("r_PRICE");
            String M_IMAGE = request.getParameter("r_IMAGE");
//            获取点击的系统时间
            Date M_TIME = new Date();
            SimpleDateFormat df =  new SimpleDateFormat("yyyy-MM-dd");
            System.out.println(df.format(M_TIME));
            menu menu = new menu(Integer.parseInt(M_ID),M_NAME,M_GENRE,M_UNIT,M_PRICE,M_IMAGE,M_TIME);
//            storage storage = new storage(M_ID,M_NAME,M_GENRE,M_UNIT,M_PRICE,df.format(M_TIME),M_IMAGE);
//            int j = menuService.addOldMenu(storage);
            int i = menuService.addMenu(menu);

            if(i >= 0){
                side = "1";
                System.out.println("成为今日菜品！\n");
            }
            //输出在浏览器
            PrintWriter out = response.getWriter();
            out.println(side);
        }
        else if (uri.endsWith("selectMenu.do")){
//          分页，获取前端两个参数，layui提供
            String page = request.getParameter("page");
            String limit = request.getParameter("limit");
            System.out.println(page);
            System.out.println("\n"+limit);
//            计算出分页起始位置
            int start=(Integer.parseInt(page)-1)*Integer.parseInt(limit);
            pageInfo pageInfo = new pageInfo(start,Integer.parseInt(limit));
            System.out.println("当前是："+page+"页，条数："+limit);
            List<menu> menu = menuService.getMenu(pageInfo);
            String json = JSON.toJSONString(menu);
            int count = menuService.selectByCount();
            //拼接前端json格式
            String jsonrs = "{\"code\":0,\"msg\":\"\",\"count\":"+count+",\"data\":" + json + "}";
            System.out.println(jsonrs);
            //输出在浏览器
            PrintWriter outMenu = response.getWriter();
            outMenu.println(jsonrs);
        }
        else if (uri.endsWith("checkMenu.do")){
//          获取用户需要检查的菜品
            String r_name = request.getParameter("r_NAME");
            System.out.print("要查询的菜品是："+r_name+"\n");
//          检查课程是否被选中
            menu m_name = menuService.checkNameSelect(r_name);
//            System.out.print(m_name);
            String side_1 = "0";
            if (m_name!=null){
//                不可以选课
                side_1 = "1";
                System.out.println("不可以选");
            }
//          输出在浏览器
            PrintWriter out = response.getWriter();
            out.println(side_1);
        }
        else if (uri.endsWith("addDoubleMenu.do")){
            String r_NAME = request.getParameter("bilidata");
            System.out.println(r_NAME);
        }
        else if (uri.endsWith("delectMenu.do")){
            String m_NAME = request.getParameter("r_NAME");
            System.out.println("要退选的菜品："+m_NAME+"\n");
            int i = menuService.delectMenu(m_NAME);
            String  side = "0";
            if(i>0){
                side = "1";
                System.out.println("成功退选");
            }
            PrintWriter out = response.getWriter();
            out.println(side);
        }
        else if (uri.endsWith("selectMenucheck.do")){
            String name = request.getParameter("name");
            System.out.println(name);
            List<menu> selectcheck = menuService.selectcheck(name);
            String json = JSON.toJSONString(selectcheck);
            String jsons = "{\"code\":0,\"msg\":\"\",\"count\":"+json.length()+",\"data\":"+json+"}";
            System.out.println("测试是否查询成功："+jsons);
            PrintWriter out = response.getWriter();
            out.println(jsons);
        }
        else if(uri.endsWith("addToMenu.do")){
            String M_ID = request.getParameter("s_ID");
            String M_NAME = request.getParameter("s_NAME");
//            需要先判断是否在菜单中存在这个菜品，如果有则说明已有,无则需要添加
            int existence = menuService.existence(M_NAME);
            String side= "0";
            if (existence>0){
//               存在，不需要添加
                side = "1";
            }else{
                String M_GENRE = request.getParameter("s_GENRE");
                String M_UNIT = request.getParameter("s_UNIT");
                String M_PRICE = request.getParameter("s_PRICE");
                String M_IMAGE = request.getParameter("s_IMAGE");
                Date M_TIME = new Date();
                SimpleDateFormat df =  new SimpleDateFormat("yyyy-MM-dd HH：MM：SS");
                System.out.println(df.format(M_TIME));
                menu menu = new menu(456,M_NAME,M_GENRE,M_UNIT,M_PRICE,M_IMAGE,M_TIME);
                int i = menuService.addTOMenu(menu);
//          历史——>菜单添加成功，同时需要修改历史菜单时间
                int i1 = menuService.updateTime(M_ID,M_TIME);
                System.out.println("测试修改历史菜单的时间是否成功："+i1);
            }
            PrintWriter out = response.getWriter();
            out.println(side);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
