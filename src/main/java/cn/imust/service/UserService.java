package cn.imust.service;

import cn.imust.domain.PageBeanUI;
import cn.imust.domain.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {

    //查找用户
    public List<User> findUsers(PageBeanUI pageBeanUI);

    //登陆
    User findUserByNameAndPwd(User user);

    //保存
    void saveUser(User user);

    //根据id查询用户
    User finduserById(Integer uid);

    //修改用户
    void updateUser(User user);

    //删除用户
    void deleteById(Integer[] ids);
}
