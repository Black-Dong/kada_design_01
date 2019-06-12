package cn.imust.controller;

import cn.imust.domain.Dormitory;
import cn.imust.domain.User;
import cn.imust.service.DormitoryService;
import cn.imust.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/dormitory")
public class DormitoryController {

    @Autowired
    private DormitoryService dormitoryService;
    @Autowired
    private UserService userService;

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


    @RequestMapping("/add")
    public String add(Dormitory dormitory){

        dormitoryService.add(dormitory);

        return "redirect:dormitoryList";
    }

    @RequestMapping("/showAdd")
    public ModelAndView showAdd(){
        ModelAndView mv = new ModelAndView();
        List<User> users = userService.findUsers(null);
        mv.addObject("users", users);
        mv.setViewName("dormitory/dormitoryAdd");
        return mv;
    }

    @RequestMapping("/dormitoryList")
    public ModelAndView dormitoryList(){

        ModelAndView mv = new ModelAndView();
        List<Dormitory> dormitoryList = dormitoryService.findAll();
        for (Dormitory dormitory : dormitoryList){
            System.out.println(dormitory);
        }
        mv.addObject("dormitoryList", dormitoryList);
        mv.setViewName("forward:/jsp/dormitory/dormitory.jsp");

        return mv;
    }
}
