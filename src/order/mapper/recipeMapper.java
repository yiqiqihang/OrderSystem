package order.mapper;

import order.pojo.pageInfo;
import order.pojo.recipe;

import java.util.List;

public interface recipeMapper {

//<!--    1、查询菜谱所有数据-->
    List<recipe> selectAllrecipe(pageInfo pageInfo);

//    添加课程
    int addrecipe(recipe recipe);

//    查询课程
    int countRecipe();

//    查询菜谱
    List<recipe> selectRecipe();

//    删除菜品
    int delectName(String r_name);

//    跟新菜品
    int  updateRecipe(recipe recipe);

//    add
    int insertRecipe(recipe recipe);
//  查询
    List<recipe> checkRecipe(String name);

}
