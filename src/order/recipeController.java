package order;

import com.alibaba.fastjson.JSON;
import order.mapper.recipeMapper;
import order.pojo.menu;
import order.pojo.pageInfo;
import order.pojo.recipe;
import order.server.menuService;
import order.server.recipeService;
import order.server.recipeServicelmpl;
import order.util.UploadFileUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet({"/selectrecipe.do","/delectrecipe.do","/recipeUpdate.do","/addCP.do","/addImage.do","/selectcheck.do"})
public class recipeController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //解决中文乱码问题
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("utf-8");

        recipeService recipeService = new recipeServicelmpl();

        //判断访问的是哪个功能
        String uri = request.getRequestURI();

        //判断用户uri
        if(uri.endsWith("selectrecipe.do")){
            //从数据库中查询出所有数据
//          分页，获取前端两个参数，layui提供
            String page = request.getParameter("page");
            String limit = request.getParameter("limit");
//            计算出分页起始位置
            int start=(Integer.parseInt(page)-1)*Integer.parseInt(limit);
            pageInfo pageInfo = new pageInfo(start,Integer.parseInt(limit));
            System.out.println("当前是："+page+"页，条数："+limit);
            //定义一个逻辑层service,要添加两个参数，从哪里查，查询条数
            List<recipe> recipes = recipeService.selectALLrecipeByPage(pageInfo);
            //将集合封装成json数据
            String json= JSON.toJSONString(recipes);
//            获得总记录数
            int count = recipeService.selectByCount();
            //拼接前端json格式
            String jsonrs = "{\"code\":0,\"msg\":\"\",\"count\":"+count+",\"data\":"+json+"}";
            System.out.println(jsonrs);
            //输出在浏览器
            PrintWriter out = response.getWriter();
            out.println(jsonrs);
        }
        else if(uri.endsWith("delectrecipe.do")){
            String r_name = request.getParameter("r_NAME");
            System.out.println("要删除的菜品："+r_name);
            int recipe = recipeService.delectName(r_name);
            System.out.println("删除成功："+recipe);
            String i= "0";
//          无效代码
            if(recipe>0){i = "1" ;}
            PrintWriter out = response.getWriter();
            out.println(i);
        }
        else if (uri.endsWith("recipeUpdate.do")){
            int r_ID = Integer.parseInt(request.getParameter("r_ID"));
            String r_NAME= request.getParameter("r_NAME");
            String r_GENRE = request.getParameter("r_GENRE");
            String r_UNIT = request.getParameter("r_UNIT");
            String r_PRICE = request.getParameter("r_PRICE");
            String r_IMAGE = request.getParameter("r_IMAGE");
            String r_INSTRUCTION = request.getParameter("r_INSTRUCTION");

            System.out.print("输出为："+r_NAME);

//            HttpSession session = request.getSession();

            recipe recipe = new recipe(r_ID,r_NAME,r_GENRE,r_UNIT,r_PRICE,r_IMAGE,r_INSTRUCTION);
//
            System.out.print("\n输出为："+r_ID+"\n");
//            System.out.print("输出为："+r_ID);

            int  recipes = recipeService.updateRecipe(recipe);
            System.out.println(recipes);

            String side = "0";
            if (recipes>0){
                side = "1";
                System.out.println("成功修改");
            }
//            System.out.println(side);

//          输出在浏览器
            PrintWriter out = response.getWriter();
            out.println(side);

//            int i = recipeMapper.updataRecipe(r_ID,r_NAME,r_UNIT,r_PRICE,r_IMAGE,r_INSTRUCTION);

        }
        else if (uri.endsWith("addCP.do")){
            System.out.println("测试");
            String res ="1";
            String r_NAME = request.getParameter("r_NAME");
            String r_GENRE = request.getParameter("r_GENRE");
            String r_UNIT = request.getParameter("r_UNIT") ;
            String r_PRICE = request.getParameter("r_PRICE") ;
            String r_INSTRUCTION = request.getParameter("r_INSTRUCTION") ;
            String r_IMAGE = request.getParameter("r_IMAGE") ;
            System.out.println(r_IMAGE);
            recipe recipe = new recipe(245,r_NAME,r_GENRE,r_UNIT,r_PRICE,r_INSTRUCTION,r_IMAGE);
            System.out.println(recipe);

            int i = recipeService.addCp(recipe);
            System.out.println(i);

            if (i>0){
                res = "0";
            }

            PrintWriter out = response.getWriter();
            out.println(res);

//            if (i>0) {
//                res = "0";
//            }
//            PrintWriter out = response.getWriter();
//            out.println(res);
        }
        else if (uri.endsWith("addImage.do")){
            String s = UploadFileUtil.uploadFile(request, response) ;
            System.out.println(s);
//          保存到数据库中
            //拼接前端json格式
//            String jsonrs = "{\"code\":0,\"msg\":\"\",\"count\":"+count+",\"data\":"+json+"}";
            String jsonrs = "{\"code\":0,\"msg\":\"\",\"data\":\"\"}";
            System.out.println("----->"+jsonrs);
            PrintWriter out = response.getWriter() ;
            out.println(jsonrs);
            HttpSession session = request.getSession() ;
            session.setAttribute("image",s) ;
        }
        else if(uri.endsWith("selectcheck.do")){
            String name = request.getParameter("name");
            System.out.println(name);
            List<recipe> recipes = recipeService.checkRecipe(name);
            String json = JSON.toJSONString(recipes);
            String jsons = "{\"code\":0,\"msg\":\"\",\"count\":"+json.length()+",\"data\":"+json+"}";
            System.out.println("测试是否查询成功："+jsons);
            PrintWriter out = response.getWriter();
            out.println(jsons);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
