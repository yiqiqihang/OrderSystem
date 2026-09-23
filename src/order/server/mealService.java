package order.server;

import order.pojo.orderForm;
import order.pojo.orderMeal;
import order.pojo.pageInfo;
import order.pojo.users;

import java.util.List;

public interface mealService {
    int insertNameMeal(orderMeal orderMeal);

    List<orderMeal> selectMeal(pageInfo pageInfo);

    int count();

    int updateNumber(orderMeal orderMeal);

    int delectOrderMeal(String oM_NAME);

    int selectstory(String m_name);

    int updateMeal(String m_name);

    Integer getTotalQty();

    Integer getTotalMoney();

    String selectUsers(String o_name);

    List<users> getUserinformations(String o_name);

    int transform(orderForm orderForm);

    int insertOrderPerson(String o_name);

    int delectShopping();

}
