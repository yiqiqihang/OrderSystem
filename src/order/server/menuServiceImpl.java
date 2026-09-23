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

public class menuServiceImpl implements menuService{

    @Override
    public List<menu> getMenu(pageInfo pageInfo) {
        //去数据库查询操作
        SqlSession sqlSession = MybatisUtil.getSqlSession();

        //定义接口
        menuMapper mapper = sqlSession.getMapper(menuMapper.class);

        List<menu> menus = mapper.selectMenu(pageInfo);

        //关闭资源
        sqlSession.close();

        return menus;
    }

    @Override
    public int selectByCount() {
        //查询操作
        SqlSession sqlSession = MybatisUtil.getSqlSession();

        //定义接口
        menuMapper mapper = sqlSession.getMapper(menuMapper.class);

        int i = mapper.countMenu();

        //关闭资源
        sqlSession.close();

        return i;
    }

    @Override
    public int addMenu(menu menu) {
        //查询操作
        SqlSession sqlSession = MybatisUtil.getSqlSession();

        //定义接口
        menuMapper mapper = sqlSession.getMapper(menuMapper.class);

        int i = mapper.insertMenu(menu);

        //关闭资源
        sqlSession.close();

        return i;
    }

    @Override
    public menu checkNameSelect(String r_name) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        menuMapper mapper = sqlSession.getMapper(menuMapper.class);
        menu menu = mapper.checkNameSelect(r_name);
        return menu;
    }

    @Override
    public int delectMenu(String m_NAME) {
        //查询操作
        SqlSession sqlSession = MybatisUtil.getSqlSession();

        //定义接口
        menuMapper mapper = sqlSession.getMapper(menuMapper.class);

        int i = mapper.delectMenu(m_NAME);

        //关闭资源
        sqlSession.close();

        return i;
    }

    @Override
    public List<menu> selectcheck(String name) {
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        menuMapper mapper  = sqlSession.getMapper(menuMapper.class);
        List<menu> selectcheck = mapper.selectcheck(name);
        sqlSession.close();
        return selectcheck;
    }

    @Override
    public int addTOMenu(menu menu) {
        System.out.println("从Controller中得到的storage数据是："+menu+"\n");
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        menuMapper mapper = sqlSession.getMapper(menuMapper.class);
        int i = mapper.addToMenu(menu);
        System.out.println("从Mapper传回的信息是（判断是否添加菜单成功）："+i+"\n");
        sqlSession.close();
        return i;
    }

    @Override
    public int updateTime(String m_id,Date m_time) {
        System.out.println("从Controller中得到的storage数据是："+m_time+"\n");
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        menuMapper mapper = sqlSession.getMapper(menuMapper.class);
        int i = mapper.updateTime(m_id,m_time);
        System.out.println("从Mapper传回的信息是（判断是否添加菜单成功）："+i+"\n");
        sqlSession.close();
        return i;
    }

    @Override
    public int existence(String m_name) {
        System.out.println("从Controller中得到的existence数据是："+m_name+"\n");
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        menuMapper mapper = sqlSession.getMapper(menuMapper.class);
        int i = mapper.existence(m_name);
        System.out.println("从Mapper传回的信息是（判断是否是否存在）："+i+"\n");
        sqlSession.close();
        return i;
    }

//    @Override
//    public int addOldMenu(storage storage) {
//        //查询操作
//        SqlSession sqlSession = MybatisUtil.getSqlSession();
//
//        //定义接口
//        menuMapper mapper = sqlSession.getMapper(menuMapper.class);
//
//        int i = mapper.addOldMenu(storage);
//
//        //关闭资源
//        sqlSession.close();
//
//        return i;
//    }

//    @Override
//    public int selecrName(String r_name) {
//        SqlSession sqlSession = MybatisUtil.getSqlSession();
//
//        menuMapper mapper= sqlSession.getMapper(menuMapper.class);
//
//        int selectname = mapper.selectname(r_name);
//        return selectname;
//    }

//    @Override
//    public menu checkNameSelect(String r_name) {
//        SqlSession sqlSession = MybatisUtil.getSqlSession();
//
//        menuMapper mapper = sqlSession.getMapper(menuMapper.class);
//
//        menu checkNameSelect = mapper.checkNameSelect(r_name);
//
//        return checkNameSelect;
//    }

//    @Override
//    public String selectName(String r_name) {
//        //查询操作
//        SqlSession sqlSession = MybatisUtil.getSqlSession();
//
//        //定义接口
//        menuMapper mapper = sqlSession.getMapper(menuMapper.class);
//
//        String s = mapper.selecrName(r_name);
//        //关闭资源
//        sqlSession.close();
//        return s;
//    }


}
