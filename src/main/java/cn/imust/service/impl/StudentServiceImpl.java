package cn.imust.service.impl;

import cn.imust.dao.BedRoomDao;
import cn.imust.dao.RoomDao;
import cn.imust.dao.StudentDao;
import cn.imust.domain.BedRoom;
import cn.imust.domain.PageBeanUI;
import cn.imust.domain.Room;
import cn.imust.domain.Student;
import cn.imust.service.BedRoomService;
import cn.imust.service.StudentService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentDao studentDao;

    @Autowired
    private BedRoomDao bedRoomDao;

    @Autowired
    private RoomDao roomDao;

    @Override
    public List<Student> studentList(PageBeanUI pageBeanUI) {

        PageHelper.startPage(pageBeanUI.getPageIndex(),pageBeanUI.getPageSize());
        return studentDao.studentList(pageBeanUI);
    }

    @Override
    public void addStudent(BedRoom bedRoom) {

        Room room = roomDao.finRoomById(bedRoom.getRoom().getRoomId());

        bedRoom.getStudent().setRoomName(room.getRoomName());
        studentDao.addStudent(bedRoom);

        bedRoom.setIsFlag("Y");
        bedRoomDao.updateBedRoom(bedRoom);
    }
}
