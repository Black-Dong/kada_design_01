package cn.imust.controller;

import cn.imust.domain.Dormitory;
import cn.imust.domain.User;
import cn.imust.service.DormitoryService;
import cn.imust.service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/dormitory")
public class DormitoryController {

    @Autowired
    private DormitoryService dormitoryService;
    @Autowired
    private UserService userService;

    //根据宿舍楼id删除宿舍楼
    @RequestMapping("/deleteById")
    public String deleteById(Integer[] ids){

        dormitoryService.deleteById(ids);

        return "redirect:dormitoryList";
    }

    //修改宿舍楼
    @RequestMapping("/updateDormitory")
    public String updateDormitory(Dormitory dormitory){
        dormitoryService.updateDormitory(dormitory);
        return "redirect:dormitoryList";
    }

    //点击查询后的回显
    @RequestMapping("/updateDormitoryUI")
    public ModelAndView updateDormitoryUI(Integer dorId){
        ModelAndView mv = new ModelAndView();
        Dormitory dormitory = dormitoryService.findDormitoryById(dorId);
        mv.addObject("dormitory", dormitory);
        List<User> users = userService.findUsers(null);
        mv.addObject("users", users);
        mv.setViewName("dormitory/showUpdateDormitory");

        return mv;
    }

    //添加宿舍楼
    @RequestMapping("/add")
    public String add(Dormitory dormitory){

        dormitoryService.add(dormitory);

        return "redirect:dormitoryList";
    }

    //展示添加页面
    @RequestMapping("/showAdd")
    public ModelAndView showAdd(){
        ModelAndView mv = new ModelAndView();
        List<User> users = userService.findUsers(null);
        mv.addObject("users", users);
        mv.setViewName("dormitory/dormitoryAdd");
        return mv;
    }

    //获取宿舍楼列表(包括模糊查询)
    @RequestMapping("/dormitoryList")
    public ModelAndView dormitoryList(Integer pageIndex,HttpSession session){

        if (pageIndex == null || pageIndex == 0){
            pageIndex =1;
        }
        ModelAndView mv = new ModelAndView();

        User user = (User) session.getAttribute("loginUser");
//        List<Dormitory> dormitoryList =  dormitoryService.findAllByUser(user);
        List<Dormitory> dormitoryList =  dormitoryService.findAllPgByUser(pageIndex,user);
        for (Dormitory dormitory : dormitoryList){
            System.out.println(dormitory);
        }

        PageInfo pageInfo = new PageInfo(dormitoryList);
        mv.addObject("pageBean", pageInfo);

        mv.setViewName("forward:/jsp/dormitory/dormitory.jsp");

        return mv;
    }
}
