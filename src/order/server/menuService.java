package order.server;

import order.pojo.menu;
import order.pojo.pageInfo;
import order.pojo.storage;

import java.util.Date;
import java.util.List;

public interface menuService {
    //接收数据
    List<menu> getMenu(pageInfo pageInfo);

    int selectByCount();

    int addMenu(menu menu);

//    String selectName(String r_name);

//    int selecrName(String r_name);

//检查学生这菜是否被选择
    menu checkNameSelect(String r_name);

//    删除一个菜品
    int delectMenu(String m_NAME);

    List<menu> selectcheck(String name);

    int addTOMenu(menu menu);

    int updateTime(String m_id,Date m_time);

    int existence(String m_name);

//    增加历史菜单
//    int addOldMenu(storage storage);


}
