package order.mapper;

import order.pojo.orderPerson;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface orderPersonMapper {
    List<orderPerson> selectOrderPerson(String name);

    int cancelOrderPerson(String r_id);

    int cancelOrderForm(String r_id);

    List<orderPerson> selectPersonTime(@Param("beginTime") Date beginTime,@Param("endTime") Date endTime);

    List<orderPerson> selectPersonLikeTime(Date beginTime);

    List<orderPerson> M_OrderList();

    List<orderPerson> M_personOrderList(String intext);

    int selectO_price();

    int selectPersonO_price(String name);

    List<orderPerson> monthCountUser(String o_name);
}
