package cn.imust.service.impl;

import cn.imust.dao.DormitoryDao;
import cn.imust.dao.RoomDao;
import cn.imust.domain.Dormitory;
import cn.imust.domain.User;
import cn.imust.service.DormitoryService;
import cn.imust.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DormitoryServiceImpl implements DormitoryService {

    @Autowired
    private DormitoryDao dormitoryDao;

    @Autowired
    private RoomDao roomDao;

    @Autowired
    private RoomService roomService;


    @Override
    public void add(Dormitory dormitory) {
        dormitoryDao.add(dormitory);
    }

    @Override
    public Dormitory findDormitoryById(Integer dorId) {
        return dormitoryDao.findDormitoryById(dorId);
    }

    @Override
    public void deleteById(Integer[] ids) {
        for (int id : ids){
            //根据宿舍楼id删除宿舍楼
            dormitoryDao.deleteById(id);
            //根据宿舍楼id获取所有宿舍id --
            Integer[] roomIds = roomDao.findRoomIdByDorId(id);
                //根据宿舍id删除宿舍,床位和对应学生    -- 与删除宿舍一样, 所以调用roomService的方法
            for (int roomId: roomIds) {
                roomService.deleteRoomById(roomId);
            }

        }
    }

    @Override
    public void updateDormitory(Dormitory dormitory) {
        dormitoryDao.updateDormitory(dormitory);
    }

    @Override
    public List<Dormitory> findAllByUser(User user) {
        return dormitoryDao.findAllByUser(user);
    }
}
