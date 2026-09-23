package order;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import order.pojo.menu;
import order.pojo.pageInfo;
import order.pojo.recipe;
import order.pojo.storage;
import order.server.*;
import org.apache.ibatis.jdbc.Null;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet({"/insertOldMenu.do","/seleceOldMenu.do","/delectOldMenu.do","/remitOldMenu.do","/seleceOldTime.do"})
public class oldMenuController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //解决中文乱码问题
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("utf-8");
        oldMenuService oldMenuService = new oldMenuServiceImpl();

        //判断访问的是哪个功能
        String uri = request.getRequestURI();
        if (uri.endsWith("insertOldMenu.do")){
//          获取前端的数据
            String s_ID = request.getParameter("r_ID");
            String s_NAME = request.getParameter("r_NAME");
            String s_GENRE = request.getParameter("r_GENRE");
            String s_UNIT = request.getParameter("r_UNIT");
            String s_PRICE = request.getParameter("r_PRICE");
            String s_IMAGE = request.getParameter("r_IMAGE");
//          获取点击的系统时间
            Date s_TIME = new Date();
            SimpleDateFormat df =  new SimpleDateFormat("yyyy-MM-dd");
            System.out.println(df.format(s_TIME));
            storage storage = new storage(s_ID,s_NAME,s_GENRE,s_UNIT,s_PRICE,s_TIME,s_IMAGE);
            int i = oldMenuService.addOldMenu(storage);
            if(i>0){
                System.out.println("成功添加历史菜单");
            }
        }
        else if(uri.endsWith("seleceOldMenu.do")){
//          从数据库中查询所有数据
//          分页，获取前端两个参数，layui提供
            String page = request.getParameter("page");
            String limit = request.getParameter("limit");
//          计算出分页起始位置
            int start=(Integer.parseInt(page)-1)*Integer.parseInt(limit);
            pageInfo pageInfo = new pageInfo(start,Integer.parseInt(limit));
            System.out.println("当前是："+page+"页，条数："+limit);
//          定义一个逻辑层service,要添加两个参数，从哪里查，查询条数
//            List<recipe> recipes = recipeService.selectALLrecipeByPage(pageInfo);
            List<storage> storages = oldMenuService.selectAllrecipeByPage(pageInfo);
//            将集合封装成json数据
            String json= JSON.toJSONString(storages);
//            获得总记录数
            int count = oldMenuService.selectByCount();
            //拼接前端json格式
            String jsonrs = "{\"code\":0,\"msg\":\"\",\"count\":"+count+",\"data\":"+json+"}";
            System.out.println(jsonrs);

            //输出在浏览器
            PrintWriter out = response.getWriter();
            out.println(jsonrs);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        }
        else if(uri.endsWith("delectOldMenu.do")){
            String s_ID = request.getParameter("s_ID");
            System.out.println("要删除的菜品："+s_ID);
            int i1 = oldMenuService.delectOldMenu(s_ID);
            System.out.println("删除成功："+i1);
            String i= "0";
            if(i1>0){i = "1" ;}
            PrintWriter out = response.getWriter();
            out.println(i);
        }
        else if(uri.endsWith("remitOldMenu.do")){
            String r_ID = request.getParameter("r_NAME");
            System.out.println("要退选的历史菜品是："+r_ID+"\n");
            int i = oldMenuService.remitOldMenu(r_ID);
            String  side = "0";
            if(i>0){
                side = "1";
                System.out.println("成功退选历史菜品");
            }
            PrintWriter out = response.getWriter();
            out.println(side);
        }
        else if(uri.endsWith("seleceOldTime.do")){
            String i =  request.getParameter("beginTime");
            String j = request.getParameter("endTime");
//            String beginTime = request.getParameter("beginTime");
//            String endTime = request.getParameter("endTime");
            System.out.println("历史菜单开始时间："+i+"\n");
            System.out.println("历史菜单结束时间："+j+"\n");
            SimpleDateFormat transformTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date beginTime = null;
            try {
                beginTime = transformTime.parse(i);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            Date endTime = null;
            try {
                endTime = transformTime.parse(j);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            if(beginTime!=null && endTime!=null){
                System.out.println(beginTime+"\n"+endTime);
                List<storage> storages = oldMenuService.selectTime(beginTime,endTime);
                String json = JSON.toJSONString(storages);
                String jsons = "{\"code\":0,\"msg\":\"\",\"count\":"+json.length()+",\"data\":"+json+"}";
                System.out.println("测试是否查询成功："+jsons);
                PrintWriter out = response.getWriter();
                out.println(jsons);
            }else{
//                List<storage> storages = new storage("0","0","0","0","0",null,"0");
//                String index = JSON.toJSONString(storages);
//                String jsons = "{\"code\":0,\"msg\":\"\",\"count\":"+index.length()+",\"data\":"+index+"}";
//                PrintWriter out  = response.getWriter();
//                out.println(jsons);
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
