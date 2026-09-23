package order;

import com.alibaba.fastjson.JSON;
import order.pojo.blanketOrder;
import order.pojo.orderForm;
import order.pojo.orderMeal;
import order.pojo.pageInfo;
import order.server.blanketOrderService;
import order.server.blanketOrderServiceImpl;
import order.server.mealService;
import order.server.mealServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet({"/selectBlanketOrder.do","/selectCaterInformation.do"})
public class blankOrderController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("utf-8");

        blanketOrderService blanketOrderService = new blanketOrderServiceImpl();
        String uri = request.getRequestURI();
        if (uri.endsWith("selectBlanketOrder.do")){
//          分页，获取前端两个参数，layui提供
            String page = request.getParameter("page");
            String limit = request.getParameter("limit");
//            计算出分页起始位置
            int start = (Integer.parseInt(page) - 1) * Integer.parseInt(limit);
            pageInfo pageInfo = new pageInfo(start, Integer.parseInt(limit));
            System.out.println("当前是：" + page + "页，条数：" + limit);
            List<blanketOrder> blanketOrders = blanketOrderService.selectBlanketOrder(pageInfo);
            String json = JSON.toJSONString(blanketOrders);
            int count = blanketOrderService.count();
            //拼接前端json格式
            String jsonrs = "{\"code\":0,\"msg\":\"\",\"count\":" + count + ",\"data\":" + json + "}";
            System.out.println(jsonrs);
            //输出在浏览器
            PrintWriter outMenu = response.getWriter();
            outMenu.println(jsonrs);
        }
        else if (uri.endsWith("selectCaterInformation.do")){
//            分页，获取前端两个参数，layui提供
            String page = request.getParameter("page");
            String limit = request.getParameter("limit");
//            计算出分页起始位置
            int start = (Integer.parseInt(page) - 1) * Integer.parseInt(limit);
            pageInfo pageInfo = new pageInfo(start, Integer.parseInt(limit));
            System.out.println("当前是：" + page + "页，条数：" + limit);
            List<orderForm> orderForms = blanketOrderService.selectCaterInformation(pageInfo);
            String json = JSON.toJSONString(orderForms);
            int count = blanketOrderService.orderFormscount();
            System.out.println(count);
            //拼接前端json格式
            String jsonrs = "{\"code\":0,\"msg\":\"\",\"count\":" + count + ",\"data\":" + json + "}";
            System.out.println(jsonrs);
            //输出在浏览器
            PrintWriter outMenu = response.getWriter();
            outMenu.println(jsonrs);

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
