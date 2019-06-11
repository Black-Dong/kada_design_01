package cn.imust.service;

import cn.imust.domain.PageBeanUI;
import cn.imust.domain.User;

import java.util.List;

public interface UserService {

    //测试环境的代码
    public List<User> findUsers(PageBeanUI pageBeanUI);

    //登陆
    User findUserByNameAndPwd(User user);

    //保存
    void saveUser(User user);
}
