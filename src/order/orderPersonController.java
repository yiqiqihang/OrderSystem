package order;

import com.alibaba.fastjson.JSON;
import order.pojo.orderPerson;
import order.pojo.users;
import order.server.orderPersonImpl;
import order.server.orderPersonService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet({"/selectOrderPerson.do","/cancelOrderPerson.do","/selectPersonTime.do","/M_OrderList.do","/M_orderList.do","/M_personOrderList.do","/selectO_price.do","/selectPersonO_price.do"})
public class orderPersonController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("utf-8");
        orderPersonService orderPersonService = new orderPersonImpl();
        String uri = request.getRequestURI();
        if (uri.endsWith("selectOrderPerson.do")){
//            从个人登录账号获取到的数据name
            users users = (users) request.getSession().getAttribute("users");
            String u_name = users.getU_NAME();
            String name = u_name;
            System.out.println("查找东西前台进入后台数据的测试————>"+name+"\n");
            List<orderPerson> orderPeople = orderPersonService.selectOrderPerson(name);
            String json = JSON.toJSONString(orderPeople);
            String jsons = "{\"code\":0,\"msg\":\"\",\"count\":"+orderPeople.size()+",\"data\":"+json+"}";
            System.out.println("测试是否转换json数据："+jsons);
            PrintWriter out = response.getWriter();
            out.println(jsons);
        }
        else if (uri.endsWith("cancelOrderPerson.do")){
            String r_id = request.getParameter("r_ID");
            System.out.println("cancelOrderPerson--->的id号是："+r_id+"\n");
            int i = orderPersonService.cancelOrderPerson(r_id);
            System.out.println("订单 是否成功删除"+i+"\n");
            PrintWriter out  = response.getWriter();
            String j="0";
            if(i>0){
                int i1 = orderPersonService.cancelOrderForm(r_id);
                if(i1>0){
                    j = "1";
                    out.println(j);
                }else{
                    out.println(j);
                }
            }
        }
        else if (uri.endsWith("selectPersonTime.do")){
            String i =  request.getParameter("beginTime");
            String j = request.getParameter("endTime");
            System.out.println("个人订单开始时间："+i+"\n");
            System.out.println("个人订单结束时间："+j+"\n");
            SimpleDateFormat transformTime = new SimpleDateFormat("yyyy-MM-dd");
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
                List<orderPerson> orderPeople = orderPersonService.selectPersonTime(beginTime,endTime);
                String json = JSON.toJSONString(orderPeople);
                String jsons = "{\"code\":0,\"msg\":\"\",\"count\":"+json.length()+",\"data\":"+json+"}";
                System.out.println("①selectPersonTime测试是否查询成功："+jsons);
                PrintWriter out = response.getWriter();
                out.println(jsons);
            }else if(beginTime!=null && endTime== null){
                List<orderPerson> orderPeople = orderPersonService.selectPersonLikeTime(beginTime);
                String json = JSON.toJSONString(orderPeople);
                String jsons = "{\"code\":0,\"msg\":\"\",\"count\":"+json.length()+",\"data\":"+json+"}";
                System.out.println("②selectPersonLikeTime测试是否查询成功："+jsons);
                PrintWriter out = response.getWriter();
                out.println(jsons);
            }else{
                PrintWriter out = response.getWriter();
                out.println("0");
            }
        }else if (uri.endsWith("M_OrderList.do")){
            List<orderPerson> orderPeople = orderPersonService.M_OrderList();
            System.out.println("查询到的数据是-->："+orderPeople);
            String json = JSON.toJSONString(orderPeople);
            String jsons = "{\"code\":0,\"msg\":\"\",\"count\":"+json.length()+",\"data\":"+json+"}";
            PrintWriter out = response.getWriter();
            out.println(jsons);
        }else if (uri.endsWith("M_personOrderList.do")){
            String intext = request.getParameter("intext");
            //将生成的intext保存到session中
            HttpSession session = request.getSession();
            session.setAttribute("intext",intext);
            System.out.println("从前端获得的数据intextshi是："+intext);
            List<orderPerson> orderPeople = orderPersonService.M_personOrderList(intext);
            System.out.println("查询到的数据是-->："+orderPeople);
            String json = JSON.toJSONString(orderPeople);
            String jsons = "{\"code\":0,\"msg\":\"\",\"count\":"+json.length()+",\"data\":"+json+"}";
            PrintWriter out = response.getWriter();
            out.println(jsons);
        }else if(uri.endsWith("selectO_price.do")){
            int i = orderPersonService.selectO_price();
            System.out.println("查询到的数据①是-->："+i);
            PrintWriter out = response.getWriter();
            out.println(i);
        }else if(uri.endsWith("selectPersonO_price.do")){
            String name = request.getParameter("data");
            int i = orderPersonService.selectPersonO_price(name);
            System.out.println("查询到的数据②是-->："+i);
            //将生成的个人总计sum保存到session中
            HttpSession session = request.getSession();
            session.setAttribute("sum",i);
            PrintWriter out = response.getWriter();
            out.println(i);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
