package order.server;

import order.pojo.menu;
import order.pojo.pageInfo;
import order.pojo.storage;

import java.util.Date;
import java.util.List;

public interface oldMenuService {

    int addOldMenu(storage storage);

    int selectByCount();

    List<storage> selectAllrecipeByPage(pageInfo pageInfo);

    int delectOldMenu(String s_ID);

    int remitOldMenu(String r_ID);

    List<storage> selectTime(Date beginTime,Date endTime);


//
//    Date seleceMenuTime(String r_id);
//
//    Date selectStorageTime(String r_id);
}
