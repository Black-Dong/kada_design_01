package cn.imust.controller;

import cn.imust.domain.*;
import cn.imust.service.BedRoomService;
import cn.imust.service.DormitoryService;
import cn.imust.service.RoomService;
import cn.imust.service.StudentService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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

    @Autowired
    private RoomService roomService;

    @Autowired
    private BedRoomService bedRoomService;

    // TODO: 2019/6/17 添加用户
    @RequestMapping("/addStudent")
    public String addStudent(BedRoom bedRoom){
        // TODO: 2019/6/17 和床位添加类似
        studentService.addStudent(bedRoom);
        return "redirect:studentList";
    }

    // TODO: 2019/6/17 ajax 异步请求实现根据room(宿舍)查询所有空床位
    @RequestMapping("/getAjaxBedRoomList")
    public @ResponseBody List<BedRoom> getAjaxBedRoomList(@RequestBody Room room){
        List<BedRoom> bedRoomList = bedRoomService.findAllBedroomByRoom(room);
        System.err.println(bedRoomList);

        return bedRoomList;
    }

    // TODO: 2019/6/17 ajax 根据请求实现根据dormitory(宿舍楼)查询所有宿舍
    @RequestMapping("/getAjaxRoomList")
    public @ResponseBody List<Room> getAjaxRoomList(@RequestBody Dormitory dormitory){
        List<Room> roomList = roomService.findAllRoomByDormitory(dormitory);
        System.err.println(dormitory);

        return roomList;
    }

    // TODO: 2019/6/17 跳转到添加用户页面
    @RequestMapping("/addStudentUI")
    public ModelAndView addStudent(HttpSession session){
        ModelAndView mv = new ModelAndView();
        User loginUser = (User) session.getAttribute("loginUser");
        List<Dormitory> dormitoryList = dormitoryService.findAllByUser(loginUser);

        mv.addObject("dormitoryList",dormitoryList);
        mv.setViewName("forward:/jsp/student/showAddStudent.jsp");
        return mv;
    }

    // TODO: 2019/6/17 学生列表 --包括模糊查询及分页
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
