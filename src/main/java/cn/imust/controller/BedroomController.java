package cn.imust.controller;

import cn.imust.domain.Dormitory;
import cn.imust.domain.User;
import cn.imust.service.BedRoomService;
import cn.imust.service.DormitoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.net.HttpCookie;
import java.util.List;

@RequestMapping("/bedroom")
@Controller
public class BedroomController {

    @Autowired
    private BedRoomService bedRoomService;

    @Autowired
    private DormitoryService dormitoryService;

    @RequestMapping("/bedRoomList")
    public ModelAndView bedRoomList(HttpSession session){

        ModelAndView mv = new ModelAndView();

        User user = (User) session.getAttribute("loginUser");
        List<Dormitory> dormitoryList = dormitoryService.findAllByUser(user);
        mv.addObject("dormitoryList", dormitoryList);



        mv.setViewName("forward:/jsp/bedroom/bedroom.jsp");
        return mv;
    }
}
