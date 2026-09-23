package order.server;

import order.mapper.recipeMapper;
import order.pojo.pageInfo;
import order.pojo.recipe;
import order.util.MybatisUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class recipeServicelmpl implements recipeService{

    @Override
    public List<recipe> getRecipe() {
        //查询操作
        SqlSession sqlSession = MybatisUtil.getSqlSession();
        //定义接口
        recipeMapper mapper = sqlSession.getMapper(recipeMapper.class);
        List<recipe> recipes = mapper.selectRecipe();
        //关闭资源
        sqlSession.close();
        return recipes;
    }

    @Override
    public List<recipe> selectALLrecipeByPage(pageInfo pageInfo) {
        //查询操作
        SqlSession sqlSession = MybatisUtil.getSqlSession();

        //定义接口
        recipeMapper mapper = sqlSession.getMapper(recipeMapper.class);

        List<recipe> recipes = mapper.selectAllrecipe(pageInfo);

        //关闭资源
        sqlSession.close();

        return recipes;
    }

    @Override
    public int selectByCount() {
        //查询操作
        SqlSession sqlSession = MybatisUtil.getSqlSession();

        //定义接口
        recipeMapper mapper = sqlSession.getMapper(recipeMapper.class);

        int i = mapper.countRecipe();

        //关闭资源
        sqlSession.close();

        return i;
    }

    @Override
    public int delectName(String r_naem) {
        //查询操作
        SqlSession sqlSession = MybatisUtil.getSqlSession();

        //定义接口
        recipeMapper mapper = sqlSession.getMapper(recipeMapper.class);

        int recipe = mapper.delectName(r_naem);

        //关闭资源
        sqlSession.close();

        return recipe;
    }

    @Override
    public int  updateRecipe(recipe recipe) {
        System.out.println(recipe);

        //查询操作
        SqlSession sqlSession = MybatisUtil.getSqlSession();

        //定义接口
        recipeMapper mapper = sqlSession.getMapper(recipeMapper.class);

        int recipes = mapper.updateRecipe(recipe);
        System.out.println(recipes);

        //关闭资源
        sqlSession.close();

        return recipes;
    }

    @Override
    public int addCp(recipe recipe) {
        //查询操作
        SqlSession sqlSession = MybatisUtil.getSqlSession();

        //定义接口
        recipeMapper mapper = sqlSession.getMapper(recipeMapper.class);

        int i = mapper.insertRecipe(recipe);

        sqlSession.close();

        return i;
    }

    @Override
    public List<recipe> checkRecipe(String name) {
        System.out.println(name);
        //查询操作
        SqlSession sqlSession = MybatisUtil.getSqlSession();

        //定义接口
        recipeMapper mapper = sqlSession.getMapper(recipeMapper.class);

        List<recipe> recipes = mapper.checkRecipe(name);

        sqlSession.close();

        return recipes;
    }


}
