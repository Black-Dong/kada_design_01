package cn.imust.service.impl;

import cn.imust.dao.RoomDao;
import cn.imust.domain.PageBeanUI;
import cn.imust.domain.Room;
import cn.imust.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomServiceImpl implements RoomService {

    @Autowired
    private RoomDao roomDao;

    @Override
    public List<Room> findAll(PageBeanUI pageBeanUI) {
        return roomDao.findAll(pageBeanUI);
    }

    @Override
    public void addRoom(Room room) {
        roomDao.addRoom(room);
    }
}
