package cn.imust.dao;

import cn.imust.domain.PageBeanUI;
import cn.imust.domain.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserDao {

    //查询所有用户的方法
    public List<User> findUsers(PageBeanUI pageBeanUI);

    //登陆方法
    User findUserByNameAndPwd(User user);

    void saveUser(User user);

    User findUserById(Integer uid);

    void updateUser(User user);

    void deleteById(int id);

    User findByUsername(String username);
}
