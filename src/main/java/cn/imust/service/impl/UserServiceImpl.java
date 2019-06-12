package cn.imust.service.impl;

import cn.imust.dao.UserDao;
import cn.imust.domain.PageBeanUI;
import cn.imust.domain.User;
import cn.imust.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {


    @Autowired
    private UserDao userDao;//注入一个userDao,按类型注入

    /**
     * 查询用户数据 测试代码
     * @return
     * @param pageBeanUI
     */
    @Override
    public List<User> findUsers(PageBeanUI pageBeanUI) {
        //System.out.println("service findUsers");

        //对象不能为null  以下代码加入了后 回显不好处理
        /*if(pageBeanUI.getUser()!=null){
            //对象中的属性不为null才可以拼接百分号
            if(pageBeanUI.getUser().getUsername()!=null &&!"".equals(pageBeanUI.getUser().getUsername()) ){
                pageBeanUI.getUser().setUsername("%"+ pageBeanUI.getUser().getUsername() +"%");
            }
        }*/
        //System.err.println(pageBeanUI);

        //借助dao 调用方法执行
        List<User> users = userDao.findUsers(pageBeanUI);
        return users;
    }

    /**
     * 登陆代码
     * @param user
     * @return
     */
    @Override
    public User findUserByNameAndPwd(User user) {
        User loginUser = userDao.findUserByNameAndPwd(user);
        return loginUser;
    }

    /**
     * 保存用户
     * @param user
     */
    @Override
    public void saveUser(User user) {
        userDao.saveUser(user);
    }

    /**
     * 根据id查询用户
     * @param uid
     * @return
     */
    @Override
    public User finduserById(Integer uid) {
        return userDao.findUserById(uid);
    }

    @Override
    public void updateUser(User user) {
        //获得用户数据--需要手动封装createDate
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String createDate = simpleDateFormat.format(new Date());
        user.setCreateDate(createDate);
        userDao.updateUser(user);
    }

    @Override
    public void deleteById(Integer[] ids) {
        for (int id : ids){
            userDao.deleteById(id);
        }
    }
}
