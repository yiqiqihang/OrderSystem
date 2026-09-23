package order.server;

import order.mapper.menuMapper;
import order.mapper.oldMenuMapper;
import order.pojo.menu;
import order.pojo.pageInfo;
import order.pojo.storage;
import order.util.MybatisUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.Date;
import java.util.List;

public class oldMenuServiceImpl implements oldMenuService{
    @Override
    public int addOldMenu(storage storage) {
        System.out.println(storage);
        //查询操作
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        //定义接口
        oldMenuMapper mapper = sqlSession.getMapper(oldMenuMapper.class);
        int i = mapper.addOldMenu(storage);
        //关闭资源
        sqlSession.close();

        return i;
    }

    @Override
    public int selectByCount() {
        //查询操作
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        //定义接口
        oldMenuMapper mapper = sqlSession.getMapper(oldMenuMapper.class);
        int i = mapper.selectByCount();
        //关闭资源
        sqlSession.close();
        return i;
    }

    @Override
    public List<storage> selectAllrecipeByPage(pageInfo pageInfo) {
        //查询操作
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        //定义接口
        oldMenuMapper mapper = sqlSession.getMapper(oldMenuMapper.class);
        List<order.pojo.storage> storages = mapper.selectAllrecipeByPage(pageInfo);
        System.out.println(storages);
        //关闭资源
        sqlSession.close();
        return storages;
    }

    @Override
    public int delectOldMenu(String s_ID) {
        //查询操作
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        //定义接口
        oldMenuMapper mapper = sqlSession.getMapper(oldMenuMapper.class);
        int i = mapper.delectOldMenu(s_ID);
        //关闭资源
        sqlSession.close();
        return i;
    }

    @Override
    public int remitOldMenu(String r_ID) {
//        System.out.println("从Controller中得到的数据是："+r_ID+"\n"+m_TIME);
        //查询操作
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        //定义接口
        oldMenuMapper mapper = sqlSession.getMapper(oldMenuMapper.class);
        int i = mapper.remitOldMenu(r_ID);
        System.out.println("从Mapper中得到的数据是："+i);
        //关闭资源
        sqlSession.close();
        return i;
    }

    @Override
    public List<storage> selectTime(Date beginTime, Date endTime) {
        System.out.println(beginTime+"\n"+endTime);
        //查询操作
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        //定义接口
        oldMenuMapper mapper = sqlSession.getMapper(oldMenuMapper.class);
        List<storage> storages = mapper.selectTime(beginTime,endTime);
        System.out.println(storages+"\n");

        //关闭资源
        sqlSession.close();
        return storages;
    }

//    @Override
//    public Date  seleceMenuTime(String r_id) {
//        System.out.println("从Controller中得到的数据是："+r_id);
//        //查询操作
//        SqlSession sqlSession = MybatisUtil.getSqlSession();
//        //定义接口
//        oldMenuMapper mapper = sqlSession.getMapper(oldMenuMapper.class);
//        Date date = mapper.seleceMenuTime(r_id);
//        System.out.println("从Mapper中返回的数据是："+date);
//        return date;
//    }
//
//    @Override
//    public Date selectStorageTime(String r_id) {
//        System.out.println("从Controller中得到的数据是(2)："+r_id);
//        //查询操作
//        SqlSession sqlSession = MybatisUtil.getSqlSession();
//        //定义接口
//        oldMenuMapper mapper = sqlSession.getMapper(oldMenuMapper.class);
//        Date date = mapper.selectStorageTime(r_id);
//        System.out.println("从Mapper中返回的数据是(2)："+date);
//        return date;
//    }
}
