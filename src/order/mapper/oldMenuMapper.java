package order.mapper;

import order.pojo.menu;
import order.pojo.pageInfo;
import order.pojo.storage;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface oldMenuMapper {

    int addOldMenu(storage storage);

    int selectByCount();

    List<storage> selectAllrecipeByPage(pageInfo pageInfo);

    int delectOldMenu(String r_ID);

    int remitOldMenu(String r_ID);

    List<storage> selectTime(@Param("beginTime") Date beginTime,@Param("endTime") Date endTime);


//
//    Date seleceMenuTime(String r_id);
//
//    Date selectStorageTime(String r_id);
}
