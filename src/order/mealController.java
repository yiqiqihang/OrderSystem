package order;

import com.alibaba.fastjson.JSON;
import order.pojo.orderForm;
import order.pojo.orderMeal;
import order.pojo.pageInfo;
import order.pojo.users;
import order.server.mealService;
import order.server.mealServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;



@WebServlet({"/selectMeal.do", "/selectNameMeal.do", "/insertNameMeal.do", "/updateNameMeal.do", "/delectOrderMeal.do","/getTotalQty.do","/getTotalMoney.do","/commitOrder.do"})
public class mealController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //解决中文乱码问题
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("utf-8");
        //service层查询
        mealService mealService = new mealServiceImpl();
        //判断访问的是哪个功能
        String uri = request.getRequestURI();
        if (uri.endsWith("selectMeal.do")) {
            //          分页，获取前端两个参数，layui提供
            String page = request.getParameter("page");
            String limit = request.getParameter("limit");
//            System.out.println(page);
//            System.out.println("\n" + limit);
//            计算出分页起始位置
            int start = (Integer.parseInt(page) - 1) * Integer.parseInt(limit);
            pageInfo pageInfo = new pageInfo(start, Integer.parseInt(limit));
//            System.out.println("当前是：" + page + "页，条数：" + limit);
            List<orderMeal> orderMeals = mealService.selectMeal(pageInfo);
//            List<menu> menu = menuService.getMenu(pageInfo);
            String json = JSON.toJSONString(orderMeals);
            int count = mealService.count();
//            int count = mealService.selectByCount();
            //拼接前端json格式
            String jsonrs = "{\"code\":0,\"msg\":\"\",\"count\":" + count + ",\"data\":" + json + "}";
//            System.out.println(jsonrs);
            //输出在浏览器
            PrintWriter outMenu = response.getWriter();
            outMenu.println(jsonrs);
        }
        else if (uri.endsWith("selectNameMeal.do")) {
            String m_name = request.getParameter("m_Name");
            System.out.println("从前端得到的数据是："+m_name+"\n");
            int selectstory = mealService.selectstory(m_name);
            System.out.println("查询得到的结果返回Controller："+selectstory+"\n");
            String i= "0";
            if(selectstory > 0 ){
//                有数据，需要改变份数和总价格
                i= "1";
                System.out.println("有数据，需要进入数据库修改份数和总价---->service"+m_name+"\n");
                int i1 = mealService.updateMeal(m_name);
                System.out.println("修改后返回一个信息给Controller"+i1+"\n");
            }
            PrintWriter out = response.getWriter();
            out.println(i);
        }
        else if (uri.endsWith("insertNameMeal.do")) {
            String om_NAME = request.getParameter("m_NAME");
            String om_UNIT = request.getParameter("m_UNIT");
            String om_PRICE = request.getParameter("m_PRICE");
            int i = 1;
            String all_PRICE = om_PRICE;
            users users = (users) request.getSession().getAttribute("users");
            String u_loginname = users.getU_LOGINNAME();
            String om_name = u_loginname;
            String om_weight = Integer.toString(i);
            System.out.println(om_weight + "\n");
            System.out.println(om_NAME + "\n");
            System.out.println(om_UNIT + "\n");
            System.out.println(om_PRICE + "\n");
//            获取点击的系统时间
            Date om_TIME = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            System.out.println(df.format(om_TIME));
            orderMeal orderMeal = new orderMeal("0", om_NAME, om_weight, om_UNIT, om_PRICE, all_PRICE, om_TIME, om_name);
            Integer j = mealService.insertNameMeal(orderMeal);
            System.out.print("---->测试");
            String z = "0";
            if (j > 0) {
//               有
                z = "1";
                System.out.println("插入成功");
            }
//          输出在浏览器
            PrintWriter out = response.getWriter();
            out.println(z);
        }
        else if (uri.endsWith("updateNameMeal.do")) {
            String om_NAME = request.getParameter("m_NAME");
            String om_UNIT = request.getParameter("m_UNIT");
            String om_PRICE = request.getParameter("m_PRICE");
            System.out.println("输出为：" + om_PRICE);
            String om_WEIGHT = request.getParameter("i");
            System.out.println("输出：" + om_NAME + "\n");
            int j = Integer.parseInt(om_PRICE);
            System.out.println("输出：" + om_PRICE + "\n");
            users users = (users) request.getSession().getAttribute("users");
            String u_loginname = users.getU_LOGINNAME();
            String om_name = u_loginname;
            j = j * 2;
            String om_price = Integer.toString(j);
//            获取点击的系统时间
            Date om_TIME = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            System.out.println(df.format(om_TIME));
            orderMeal orderMeal = new orderMeal("0", om_NAME, om_WEIGHT, om_UNIT, om_PRICE, om_price, om_TIME, om_name);
            int i = mealService.updateNumber(orderMeal);
            System.out.print("---->购物车变更测试");
            String z = "0";
            if (i > 0) {
//               有
                z = "1";
                System.out.println("变更成功");
            }
//          输出在浏览器
            PrintWriter out = response.getWriter();
            out.println(z);
//            recipe recipe = new recipe(r_ID,r_NAME,r_GENRE,r_UNIT,r_PRICE,r_IMAGE,r_INSTRUCTION);
        }
        else if (uri.endsWith("delectOrderMeal.do")) {
            String oM_NAME = request.getParameter("oM_NAME");
            System.out.println(oM_NAME);
            int i = mealService.delectOrderMeal(oM_NAME);
            System.out.print("---->购物车删除测试");
            String z = "0";
            if (i > 0) {
//               有
                z = "1";
                System.out.println("变更成功");
            }
//          输出在浏览器
            PrintWriter out = response.getWriter();
            out.println(z);
        }
        else if (uri.endsWith("getTotalQty.do")){
            System.out.println("————>进入到了查询总数的Controller方法中");
            Integer totalQty = mealService.getTotalQty();
            PrintWriter out = response.getWriter();
            if(totalQty==null){
                out.println("0");
            }else {
                out.println(totalQty);
            }
        }
        else if (uri.endsWith("getTotalMoney.do")){
            System.out.println("————>进入到了查询总计金额的Controller方法中");
            Integer totalMoney = mealService.getTotalMoney();
            PrintWriter out = response.getWriter();
            if(totalMoney==null){
                out.println("0");
            }else{
                out.println(totalMoney);
            }
        }
        else if(uri.endsWith("commitOrder.do")){
            users users = (users) request.getSession().getAttribute("users");
            String ou_loginname = users.getU_LOGINNAME();
            String o_name = ou_loginname;
//            ①查询到需要拼接的菜品名
            String connectNew = mealService.selectUsers(o_name);
//            ②获取用户下订单的时间
            Date om_TIME = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            System.out.println(df.format(om_TIME));
//            ③获取总计价格
            Integer totalMoney = mealService.getTotalMoney();
            String o_price =Integer.toString(totalMoney);
//            ④获取用户信息
            List<users> userinformations = mealService.getUserinformations(o_name);
            for(int i=0;i<userinformations.size();i++){
//                System.out.println("测试获取的字符串为："++"\n");
                String u_name = userinformations.get(i).getU_NAME();//真实姓名
                String u_phone = userinformations.get(i).getU_PHONE();//用户手机
                String u_loginname = userinformations.get(i).getU_LOGINNAME();//登录名
//            ⑤合并传入形成订单页面
                orderForm orderForm = new orderForm(0,u_name,u_phone,o_price,u_loginname,om_TIME,connectNew);
                int transform = mealService.transform(orderForm);
//            ⑥将order_form和order_meal合并插入到order_person当中
                int z = mealService.insertOrderPerson(o_name);
                String j = "0";
                if(z>0){
                    j = "1";
//                    判断确定能添加到order_person后，需要清空购物车
                    int i1 = mealService.delectShopping();
                }
                PrintWriter out = response.getWriter();
                out.println(j);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
