package order.server;

import order.pojo.users;

public interface usersService {
    public users login(String username, String password);
}
