package order.util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class MybatisUtil {
    //  封装一个获得session方法
    public static SqlSession getSqlSession(){
        // 读取mybatis的核心配置文件
        String configXml = "mybatis-config.xml";
        InputStream inputStream = null;
        try {
            inputStream = Resources.getResourceAsStream(configXml);
        } catch (IOException e) {
            e.printStackTrace();
        }
        SqlSessionFactory sqlSession = new SqlSessionFactoryBuilder().build(inputStream);
        return sqlSession.openSession(true);
    }
}
