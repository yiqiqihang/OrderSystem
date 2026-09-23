package order.mapper;

import order.pojo.menu;
import order.pojo.pageInfo;
import order.pojo.storage;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface menuMapper {
    List<menu> selectMenu(pageInfo pageInfo);

    int countMenu();

    int insertMenu(menu menu);

//    int selectname(String r_name);
//    返回一个对象
    menu checkNameSelect(String m_name);

//    delect
    int delectMenu(String m_NAME);

    List<menu> selectcheck(String name);

    int addToMenu(menu menu);

    int updateTime(@Param("m_id") String m_id,@Param("m_time") Date m_time);

    int existence(String m_name);


//    Date seleceMenuTime(String r_id);

//    int addOldMenu(storage storage);
    

}
