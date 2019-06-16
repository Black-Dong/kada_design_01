package cn.imust.controller;

import cn.imust.domain.BedRoom;
import cn.imust.domain.Dormitory;
import cn.imust.domain.PageBeanUI;
import cn.imust.domain.User;
import cn.imust.service.BedRoomService;
import cn.imust.service.DormitoryService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    public ModelAndView bedRoomList(PageBeanUI pageBeanUI,HttpSession session){

        ModelAndView mv = new ModelAndView();

        User loginUser = (User) session.getAttribute("loginUser");
        List<Dormitory> dormitoryList = dormitoryService.findAllByUser(loginUser);
        mv.addObject("dormitoryList", dormitoryList);

        pageBeanUI.setLoginUser(loginUser);

        List<BedRoom> bedRoomList = bedRoomService.findAllBedroom(pageBeanUI,pageBeanUI.getPageIndex(),pageBeanUI.getPageSize());
        PageInfo<BedRoom> pageBean = new PageInfo<BedRoom>(bedRoomList,pageBeanUI.getNavigatePages());

        mv.addObject("pageBeanUI", pageBeanUI);
        mv.addObject("pageBean", pageBean);
        mv.setViewName("forward:/jsp/bedroom/bedroom.jsp");
        return mv;
    }
}
