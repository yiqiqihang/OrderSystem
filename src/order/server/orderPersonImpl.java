package order.server;

import order.mapper.orderPersonMapper;
import order.pojo.orderPerson;
import order.util.MybatisUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.Date;
import java.util.List;

public class orderPersonImpl implements orderPersonService{

    @Override
    public List<orderPerson> selectOrderPerson(String name) {
        System.out.println("————>进入到了查找个人订单的selectForm方法中"+name);
        SqlSession sqlSession  = MybatisUtil.getSqlSession();
        orderPersonMapper mapper = sqlSession.getMapper(orderPersonMapper.class);
        List<orderPerson> orderForms = mapper.selectOrderPerson(name);
        System.out.println("查找到的信息在service中的显示是："+orderForms);
        sqlSession.close();
        return orderForms;
    }

    @Override
    public int cancelOrderPerson(String r_id) {
        System.out.println("判断是否进入cancelOrderPersonService"+r_id+"\n");
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        orderPersonMapper mapper = sqlSession.getMapper(orderPersonMapper.class);
        int i = mapper.cancelOrderPerson(r_id);
        sqlSession.close();
        return i;
    }

    @Override
    public int cancelOrderForm(String r_id) {
        System.out.println("判断是否进入cancelOrderFormService"+r_id+"\n");
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        orderPersonMapper mapper = sqlSession.getMapper(orderPersonMapper.class);
        int i = mapper.cancelOrderForm(r_id);
        sqlSession.close();
        return i;
    }

    @Override
    public List<orderPerson> selectPersonTime(Date beginTime, Date endTime) {
        System.out.println("判断是否进入selectPersonTime"+beginTime+"\n"+endTime+"\n");
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        orderPersonMapper mapper = sqlSession.getMapper(orderPersonMapper.class);
        List<orderPerson> orderPeople = mapper.selectPersonTime(beginTime, endTime);
        sqlSession.close();
        return orderPeople;
    }

    @Override
    public List<orderPerson> selectPersonLikeTime(Date beginTime) {
        System.out.println("判断是否进入selectPersonLikeTime"+beginTime);
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        orderPersonMapper mapper = sqlSession.getMapper(orderPersonMapper.class);
        List<orderPerson> orderPeople = mapper.selectPersonLikeTime(beginTime);
        sqlSession.close();
        return orderPeople;
    }

    @Override
    public List<orderPerson> M_OrderList() {
        System.out.println("判断是否进入M_OrderList");
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        orderPersonMapper mapper = sqlSession.getMapper(orderPersonMapper.class);
        List<orderPerson> orderPeople = mapper.M_OrderList();
        return orderPeople;
    }

    @Override
    public List<orderPerson> M_personOrderList(String intext) {
        System.out.println("判断是否进入M_personOrderList");
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        orderPersonMapper mapper = sqlSession.getMapper(orderPersonMapper.class);
        List<orderPerson> orderPeople = mapper.M_personOrderList(intext);
        return orderPeople;
    }

    @Override
    public int selectO_price() {
        System.out.println("判断是否进入selectO_price");
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        orderPersonMapper mapper = sqlSession.getMapper(orderPersonMapper.class);
        int i = mapper.selectO_price();
        return i;
    }

    @Override
    public int selectPersonO_price(String name) {
        System.out.println("判断是否进入selectO_price");
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        orderPersonMapper mapper = sqlSession.getMapper(orderPersonMapper.class);
        int i = mapper.selectPersonO_price(name);
        return i;
    }

    @Override
    public List<orderPerson> monthCountUser(String o_name) {
        System.out.println("判断是否进入monthCountUser"+o_name);
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        orderPersonMapper mapper = sqlSession.getMapper(orderPersonMapper.class);
        List<orderPerson> orderPeople = mapper.monthCountUser(o_name);
        System.out.println("查询到的数据是-->："+orderPeople);
        return orderPeople;
    }
}
