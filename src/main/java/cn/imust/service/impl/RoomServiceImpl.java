package cn.imust.service.impl;

import cn.imust.dao.BedRoomDao;
import cn.imust.dao.RoomDao;
import cn.imust.dao.StudentDao;
import cn.imust.domain.*;
import cn.imust.service.RoomService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomServiceImpl implements RoomService {

    @Autowired
    private RoomDao roomDao;

    @Autowired
    private StudentDao studentDao;

    @Autowired
    private BedRoomDao bedRoomDao;

    @Override
    public List<Room> findAll(PageBeanUI pageBeanUI, Integer pageIndex, Integer pageSize) {

        if (pageIndex == null){
            pageIndex = 1;
        }
        if (pageSize == null){
            pageSize = 2;
        }
        PageHelper.startPage(pageIndex,pageSize);
        return roomDao.findAll(pageBeanUI);
    }

    @Override
    public void addRoom(Room room) {
        roomDao.addRoom(room);
    }

    @Override
    public List<Room> findAllRoomByDormitory(Dormitory dormitory) {
        return roomDao.findAllRoomByDormitory(dormitory);
    }

    @Override
    public void deleteRoomById(int id) {
        //根据roomId删除宿舍
        roomDao.deleteRoomById(id);

        //根据roomId删除学生（需要先知道宿舍的床位id）
        Integer[] stdIds = bedRoomDao.findStuIdsByRoomId(id);
        if (stdIds != null){
            for (int stuId:stdIds) {
                studentDao.deleteStudentById(stuId);
            }
        }

        //根据roomId删除床位
        bedRoomDao.deleteByRoomId(id);

    }
}
