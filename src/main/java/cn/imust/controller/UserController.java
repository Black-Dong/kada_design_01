package cn.imust.controller;


import cn.imust.domain.PageBeanUI;
import cn.imust.domain.User;
import cn.imust.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @RequestMapping 类级别
 * @RequestMapping 方法级别
 * 访问路径 =  类级别的 + 方法级别的路径
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;//注入service

    /**
     * 用于登陆的方法
     * @param modelAndView
     * @return
     */
    @RequestMapping("/loginUser")
    public ModelAndView loginUser(User user, ModelAndView modelAndView , HttpSession session){
        //调用service
        //因为最后需要将登陆成功的用户数据存入session
        User loginUser = userService.findUserByNameAndPwd(user);
        System.err.println(loginUser);//createDate没有数据
        if(loginUser == null ){//表示没有登陆成功
            modelAndView.addObject("errorMsg" , "您填写的用户名或密码错误");
            modelAndView.setViewName("login");//逻辑视图 请求转发
        }else{//表示登陆成功 将数据放入session
            session.setAttribute("loginUser" , loginUser);//将登陆成功的数据放入session
            //此时重定向到首页即可 因为此时不携带任何数据  此时如果携带 forward 或者 redirect 物理视图 不会拼接前缀后缀  重定向
            modelAndView.setViewName("redirect:/jsp/main.jsp");
        }

        return modelAndView;
    }


    /**
     * 添加用户
     * @param user
     * @return
     */
    @RequestMapping("/addUser")
    public String addUser(User user,HttpSession  session){

        //1.获得用户数据--需要手动封装createDate
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String createDate = simpleDateFormat.format(new Date());
        user.setCreateDate(createDate);
        System.out.println(user);

        //添加的只是普通管理员  超级管理员可以添加  但是普通管理员不应该能操作
        //判断session的用户是超级还是普通即可
        User loginUser = (User)session.getAttribute("loginUser");
        if(loginUser!=null && "2".equals(loginUser.getStatus())){//普通管理员
            return "redirect:/jsp/500.jsp";
        }

        //2.保存
        userService.saveUser(user);

        // 返回时 跳转向查询页面 预留
       return "";
    }

    /**
     * 登出
     * @return
     */
    @RequestMapping("/loginout")
    public String loginout(HttpSession session){
        System.err.println("xxxx");
        session.invalidate();//销毁session
        return "redirect:/jsp/login.jsp";
    }

    /**
     * 查询用户的数据
     * @param modelAndView
     * @return
     */
    @RequestMapping("/userList")
    public ModelAndView userList(PageBeanUI pageBeanUI, ModelAndView modelAndView){
        //由于封装的时候 调用对应的封装方法进行 封装数据 而modelAndView里面已经有status user也有
        //赋值两遍数据 导致 封装不了数据
        //System.err.println(pageBeanUI);
        //查询用户的数据
        List<User> users = userService.findUsers(pageBeanUI);


        //将数据保存到request域中
        modelAndView.addObject("users" , users);
        //用于页面回显数据使用
        modelAndView.addObject("pageBeanUI" , pageBeanUI);

        //请求转发
        modelAndView.setViewName("forward:/jsp/user/user.jsp");
        return modelAndView;
    }


    /**
     * 测试环境搭建的方法
     * @return
     */
    @RequestMapping("/findAll")
    public ModelAndView sayHello(){
        //List<User> users = userService.findUsers(pageBeanUI);
        ModelAndView modelAndView = new ModelAndView();
        //modelAndView.addObject("users" , users);
        modelAndView.setViewName("success");
        return modelAndView;
    }
}
