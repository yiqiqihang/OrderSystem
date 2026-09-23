package order.server;

import order.mapper.blanketOrderMapper;
import order.mapper.mealMapper;
import order.pojo.blanketOrder;
import order.pojo.orderForm;
import order.pojo.pageInfo;
import order.util.MybatisUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class blanketOrderServiceImpl implements blanketOrderService{

    @Override
    public List<blanketOrder> selectBlanketOrder(pageInfo pageInfo) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        blanketOrderMapper mapper = sqlSession.getMapper(blanketOrderMapper.class);
        List<blanketOrder> blanketOrders = mapper.selectBlanketOrder(pageInfo);
        sqlSession.close();
        return blanketOrders;
    }

    @Override
    public int count() {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        blanketOrderMapper mapper = sqlSession.getMapper(blanketOrderMapper.class);
        int count = mapper.count();
        sqlSession.close();
        return count;
    }

    @Override
    public List<orderForm> selectCaterInformation(pageInfo pageInfo) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        blanketOrderMapper mapper = sqlSession.getMapper(blanketOrderMapper.class);
        List<orderForm> orderForms = mapper.selectCaterInformation(pageInfo);
        sqlSession.close();
        return orderForms;
    }

    @Override
    public int orderFormscount() {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        blanketOrderMapper mapper = sqlSession.getMapper(blanketOrderMapper.class);
        int i = mapper.orderFormscount();
        sqlSession.close();
        return i;
    }
}
