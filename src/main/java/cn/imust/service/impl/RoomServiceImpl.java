package cn.imust.service.impl;

import cn.imust.dao.RoomDao;
import cn.imust.domain.PageBeanUI;
import cn.imust.domain.Room;
import cn.imust.domain.User;
import cn.imust.service.RoomService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomServiceImpl implements RoomService {

    @Autowired
    private RoomDao roomDao;

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
}
