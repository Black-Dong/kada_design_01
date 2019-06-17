package cn.imust.controller;

import cn.imust.domain.Dormitory;
import cn.imust.domain.PageBeanUI;
import cn.imust.domain.Student;
import cn.imust.domain.User;
import cn.imust.service.DormitoryService;
import cn.imust.service.StudentService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private DormitoryService dormitoryService;

    @RequestMapping("/studentList")
    public ModelAndView studentList(PageBeanUI pageBeanUI,HttpSession session){
        ModelAndView mv = new ModelAndView();

        User loginUser = (User) session.getAttribute("loginUser");
        pageBeanUI.setLoginUser(loginUser);

        List<Dormitory> dormitoryList = dormitoryService.findAllByUser(loginUser);

        List<Student> studentList = studentService.studentList(pageBeanUI);
        PageInfo pageBean = new PageInfo(studentList,5);

        if (pageBeanUI.getStudent() != null){
            mv.addObject("stuName",pageBeanUI.getStudent().getStuName());
        }
        if (pageBeanUI.getDormitory() != null){
            mv.addObject("dorName",pageBeanUI.getDormitory().getDorName());
        }
        if (pageBeanUI.getRoom() != null){
            mv.addObject("roomName",pageBeanUI.getRoom().getRoomName());
        }

        mv.addObject("dormitoryList",dormitoryList);
        mv.addObject("pageBean",pageBean);
        mv.setViewName("forward:/jsp/student/student.jsp");
        return mv;
    }
}
