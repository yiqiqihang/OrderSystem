package order.server;

import order.pojo.blanketOrder;
import order.pojo.orderForm;
import order.pojo.pageInfo;

import java.util.List;

public interface blanketOrderService {
    List<blanketOrder> selectBlanketOrder(pageInfo pageInfo);

    int count();

    List<orderForm> selectCaterInformation(pageInfo pageInfo);

    int orderFormscount();
}
