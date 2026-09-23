package order.server;


import order.pojo.pageInfo;
import order.pojo.recipe;

import java.util.List;

//接口

public interface recipeService {

    List<recipe> getRecipe();

    List<recipe> selectALLrecipeByPage(pageInfo pageInfo);

    //查询总条数
    int selectByCount();

//  删除
    int delectName(String r_naem);

//  更新
    int updateRecipe(recipe recipe);

//    增加菜品
    int addCp(recipe recipe);

// 查询
    List<recipe> checkRecipe(String name);
}
