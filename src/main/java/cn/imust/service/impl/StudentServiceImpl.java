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


        //根据传入的roomId查询宿舍, 主要是宿舍名称  --如果有
        Room room = roomDao.finRoomById(bedRoom.getRoom().getRoomId());
        bedRoom.getStudent().setRoomName(room.getRoomName());

        //保存学生
        studentDao.addStudent(bedRoom);

        //修改床位
        if (bedRoom.getBedId() != null){
            bedRoom.setIsFlag("Y");
            bedRoomDao.updateBedRoom(bedRoom);
        }
    }

    @Override
    public void deleteStudentById(int id) {

        //删除学生--通过id
        studentDao.deleteStudentById(id);

        //修改床位信息
            //通过学生id查找对应床位
        BedRoom bedRoom = bedRoomDao.findBedroomByStudentId(id);
        bedRoom.setIsFlag("N");
        bedRoom.getStudent().setStuId(0);
        bedRoomDao.updateBedRoom(bedRoom);
    }

    @Override
    public Student findStudentById(Integer stuId) {
        return studentDao.findStudentById(stuId);
    }

    @Override
    public void updateStudent(BedRoom bedRoom) {

        //根据传入的roomId查询宿舍, 主要是宿舍名称
        Room room = roomDao.finRoomById(bedRoom.getRoom().getRoomId());
        bedRoom.getStudent().setRoomName(room.getRoomName());

        studentDao.updateStudent(bedRoom);

        //修改床位
        if (bedRoom.getBedId() != null){
            bedRoom.setIsFlag("Y");
            bedRoomDao.updateBedRoom(bedRoom);

            bedRoom.setIsFlag("N");
            bedRoom.setBedId(bedRoom.getStudent().getBedRoomId());
            bedRoom.getStudent().setStuId(0);
            bedRoomDao.updateBedRoom(bedRoom);
        }
    }
}
