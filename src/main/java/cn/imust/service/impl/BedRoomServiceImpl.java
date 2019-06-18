package cn.imust.service.impl;

import cn.imust.dao.BedRoomDao;
import cn.imust.dao.StudentDao;
import cn.imust.domain.BedRoom;
import cn.imust.domain.PageBeanUI;
import cn.imust.domain.Room;
import cn.imust.service.BedRoomService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BedRoomServiceImpl implements BedRoomService {

    @Autowired
    private BedRoomDao bedRoomDao;

    @Autowired
    private StudentDao studentDao;

    @Override
    public void addBedRoom(BedRoom bedRoom, Room room) {
        for (int i=0; i<6; i++){
            bedRoom.setIsFlag("N");
            bedRoom.setRoomBedName(Integer.toString(i+1));
            bedRoom.setRoom(room);
            bedRoomDao.addBedRoom(bedRoom);
        }
    }

    @Override
    public List<BedRoom> findAllBedroom(PageBeanUI pageBeanUI) {
        PageHelper.startPage(pageBeanUI.getPageIndex(),pageBeanUI.getPageSize());
        return bedRoomDao.findAllBedroom(pageBeanUI);
    }

    @Override
    public BedRoom findBedroomById(Integer bedId) {
        return bedRoomDao.findBedroomById(bedId);
    }

    @Override
    public void inRoom(BedRoom bedRoom) {

        //操作 student 表
        studentDao.addStudent(bedRoom);

        //更新 room 的 bedroom
        bedRoomDao.updateBedRoom(bedRoom);

    }

    @Override
    public void outRoom(BedRoom bedRoom) {

        studentDao.deleteStudentById(bedRoom.getStudent().getStuId());
        bedRoom.setIsFlag("N");
        bedRoom.getStudent().setStuId(0);
        bedRoomDao.updateBedRoom(bedRoom);

    }

    @Override
    public List<BedRoom> findAllBedroomByRoom(Room room) {
        return bedRoomDao.findAllBedroomByRoom(room);
    }

}
