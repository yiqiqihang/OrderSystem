package order.server;

import order.mapper.mealMapper;
import order.mapper.menuMapper;
import order.pojo.*;
import order.util.MybatisUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class mealServiceImpl implements mealService{
    @Override
    public int insertNameMeal(orderMeal orderMeal) {
        //去数据库查询操作
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        //定义接口
        mealMapper mapper =sqlSession.getMapper(mealMapper.class);
        int i = mapper.insertNameMeal(orderMeal);
        System.out.println(i);
        //关闭资源
        sqlSession.close();
        return i;
    }

    @Override
    public List<orderMeal> selectMeal(pageInfo pageInfo) {
        //去数据库查询操作
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        //定义接口
        mealMapper mapper =sqlSession.getMapper(mealMapper.class);
        List<orderMeal> orderMeals = mapper.selectMeal(pageInfo);
        System.out.println(orderMeals);
        //关闭资源
        sqlSession.close();
        return orderMeals;
    }

    @Override
    public int count() {
        //去数据库查询操作
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        //定义接口
        mealMapper mapper =sqlSession.getMapper(mealMapper.class);
        int i = mapper.count();
        System.out.println(i);
        //关闭资源
        sqlSession.close();
        return i;
    }

    @Override
    public int updateNumber(orderMeal orderMeal) {
        //去数据库查询操作
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        //定义接口
        mealMapper mapper =sqlSession.getMapper(mealMapper.class);
        int i = mapper.updateNumber(orderMeal);
        System.out.println(i);
        //关闭资源
        sqlSession.close();
        return i;
    }

    @Override
    public int delectOrderMeal(String oM_NAME) {
        //去数据库查询操作
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        //定义接口
        mealMapper mapper =sqlSession.getMapper(mealMapper.class);
        int i = mapper.delectOrderMeal(oM_NAME);
        System.out.println(i);
        //关闭资源
        sqlSession.close();
        return i;
    }

    @Override
    public int selectstory(String m_name) {
        System.out.println("从Controller得到的数据是："+m_name);
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        mealMapper mapper = sqlSession.getMapper(mealMapper.class);
        int selectstory = mapper.selectstory(m_name);
        System.out.println("数据库查询到的在service中的显示是："+selectstory);
        return selectstory;
    }

    @Override
    public int updateMeal(String m_name) {
        System.out.println("从Controller接收到需要修改的菜品名为："+m_name+"\n");
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        mealMapper mapper = sqlSession.getMapper(mealMapper.class);
        int i = mapper.updateMeal(m_name);
        System.out.println("修改成功数据库的数据："+i+"\n");
        return i;
    }

    @Override
    public Integer getTotalQty() {
        System.out.println("————>进入到了查询总数的getTotalQty方法中");
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        mealMapper mapper = sqlSession.getMapper(mealMapper.class);
        Integer totalQty = mapper.getTotalQty();
        System.out.println("从数据库查询到总数的数量在service中的显示是："+totalQty);
        return totalQty;
    }

    @Override
    public Integer getTotalMoney() {
        System.out.println("————>进入到了查询合计价格的getTotalMoney方法中");
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        mealMapper mapper = sqlSession.getMapper(mealMapper.class);
        Integer totalMoney = mapper.getTotalMoney();
        System.out.println("从数据库查询到总数的数量在service中的显示是："+totalMoney);
        return totalMoney;
    }

    @Override
    public String selectUsers(String o_name) {
        System.out.println("————>进入到了合并订单名的selectUsers方法中"+o_name);
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        mealMapper mapper = sqlSession.getMapper(mealMapper.class);
        String s = mapper.selectUsers(o_name);
        System.out.println("合并的结果在service中的显示是："+s);
        return s;
    }

    @Override
    public List<users> getUserinformations(String o_name) {
        System.out.println("————>进入到了查找用户信息的selectUsers方法中"+o_name);
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        mealMapper mapper = sqlSession.getMapper(mealMapper.class);
        List<users> s = mapper.getUserinformations(o_name);
        System.out.println("用户查找的信息在service中的显示是："+s);
        return s;
    }

    @Override
    public int transform(orderForm orderForm) {
        System.out.println("————>进入到了插入的transform方法中"+orderForm);
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        mealMapper mapper = sqlSession.getMapper(mealMapper.class);
        int transform = mapper.transform(orderForm);
        System.out.println("判断插入O_Form(users)是否成功是："+transform);
        return transform;
    }

    @Override
    public int insertOrderPerson(String o_name) {
        System.out.println("————>进入到了插入的transform方法中"+o_name);
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        mealMapper mapper = sqlSession.getMapper(mealMapper.class);
        int i = mapper.insertOrderPerson(o_name);
        System.out.println("判断插入insertOrderPerson是否成功是："+i);
        return i;
    }

    @Override
    public int delectShopping() {
        System.out.println("————>进入到了delectShopping方法中");
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        mealMapper mapper = sqlSession.getMapper(mealMapper.class);
        int i = mapper.delectShopping();
        System.out.println("判断delectShopping是否成功是："+i);
        return 0;
    }
}
