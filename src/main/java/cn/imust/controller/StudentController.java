package cn.imust.controller;

import cn.imust.domain.*;
import cn.imust.service.*;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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

    @Autowired
    private StuImageService stuImageService;

    //文件上传
    @RequestMapping("/uploadStudent")
    public String uploadStudent(StuImage stuImage, MultipartFile myFile, HttpSession session) throws IOException {
        //获取数据
//        System.err.println(stuId+":"+stuName);
//        System.err.println(myFile);

        //保存图片
        String fileName = myFile.getOriginalFilename();
        String name = myFile.getName();

        //文件名称
        fileName = UUID.randomUUID().toString().replace("-","")+fileName;
        // /upload的真实路径
        String realPath = session.getServletContext().getRealPath("/upload");

        //创建文件夹(每天一个)
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String dateFormat = simpleDateFormat.format(new Date());
        File file = new File(realPath+"/"+dateFormat);
        if (!file.exists()){
            file.mkdirs();
        }

        //创建文件
        File newFile = new File(file,fileName);
        //将上传文件写入
        myFile.transferTo(newFile);


        //操作数据库
        // /日期/文件名
        stuImage.setImagePath("/upload/" + dateFormat + "/" + fileName);
        stuImageService.savaStuImage(stuImage);

        return "redirect:studentList";
    }

    //跳转到文件上传页面
    @RequestMapping("/fileUpload")
    public ModelAndView fileUpload(Integer stuId,ModelAndView mv){
        //传递学生信息
        Student student = studentService.findStudentById(stuId);
        mv.addObject("student",student);

        mv.setViewName("forward:/jsp/document/fileUploadStudent.jsp");
        return mv;
    }

    //修改学生
    @RequestMapping("/updateStudent")
    public String updateStudent(BedRoom bedRoom){

        studentService.updateStudent(bedRoom);

        return "redirect:studentList";
    }

    //跳转修改页面
    @RequestMapping("/updateStudentUI")
    public ModelAndView updateStudentUI(Integer stuId,ModelAndView mv,HttpSession session){

        User loginUser = (User) session.getAttribute("loginUser");
        //传递宿舍楼信息
        List<Dormitory> dormitoryList = dormitoryService.findAllByUser(loginUser);

        //传递学生信息
        Student student = studentService.findStudentById(stuId);

        //传递宿舍信息
        List<Room> roomList = roomService.findAllRoomByDormitory(student.getRoom().getDormitory());

        //传递床位信息
        List<BedRoom> bedRoomList = bedRoomService.findAllBedroomByRoom(student.getRoom());

        mv.addObject("bedRoomList",bedRoomList);
        mv.addObject("roomList",roomList);
        mv.addObject("dormitoryList",dormitoryList);
        mv.addObject("student",student);

        mv.setViewName("forward:/jsp/student/showUpdateStudent.jsp");
        return mv;
    }

    //和退住一样
    @RequestMapping("/deleteById")
    public String deleteById(Integer[] ids){

        for (int id:ids) {
            //需要执行删除学生, 修改床位信息 和退住一样
            studentService.deleteStudentById(id);
        }

        return "redirect:studentList";
    }

    // Done: 2019/6/17 添加用户
    @RequestMapping("/addStudent")
    public String addStudent(BedRoom bedRoom){
        // Done: 2019/6/17 和床位添加类似  1.添加学生 2.修改床位信息
        studentService.addStudent(bedRoom);
        return "redirect:studentList";
    }

    // Done: 2019/6/17 ajax 异步请求实现根据room(宿舍)查询所有空床位
    @RequestMapping("/getAjaxBedRoomList")
    public @ResponseBody List<BedRoom> getAjaxBedRoomList(@RequestBody Room room){
        List<BedRoom> bedRoomList = bedRoomService.findAllBedroomByRoom(room);
        System.err.println(bedRoomList);

        return bedRoomList;
    }

    // Done: 2019/6/17 ajax 根据请求实现根据dormitory(宿舍楼)查询所有宿舍
    @RequestMapping("/getAjaxRoomList")
    public @ResponseBody List<Room> getAjaxRoomList(@RequestBody Dormitory dormitory){
        List<Room> roomList = roomService.findAllRoomByDormitory(dormitory);
        System.err.println(dormitory);

        return roomList;
    }

    // Done: 2019/6/17 跳转到添加用户页面
    @RequestMapping("/addStudentUI")
    public ModelAndView addStudent(HttpSession session){
        ModelAndView mv = new ModelAndView();
        User loginUser = (User) session.getAttribute("loginUser");
        List<Dormitory> dormitoryList = dormitoryService.findAllByUser(loginUser);

        mv.addObject("dormitoryList",dormitoryList);
        mv.setViewName("forward:/jsp/student/showAddStudent.jsp");
        return mv;
    }

    // Done: 2019/6/17 学生列表 --包括模糊查询及分页
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
