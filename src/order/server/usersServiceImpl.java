package order.server;

import order.mapper.usersMapper;
import order.pojo.users;
import order.util.MybatisUtil;
import org.apache.ibatis.session.SqlSession;

public class usersServiceImpl implements usersService{
    //去数据库查询，mybatis框架
    private SqlSession sqlSession = MybatisUtil.getSqlSession();
    private usersMapper mapper = sqlSession.getMapper(usersMapper.class);

    @Override
    public users login(String username, String password) {
        users users = mapper.selectUser(username);
        System.out.println("users==="+users);
        //判断密码是否正确
        if(users!=null){
            if(users.getPASSWORD().equals(password)){
                //说明登录成功
                return users;
            }
        }
        sqlSession.close();
        return null;
    }
}
