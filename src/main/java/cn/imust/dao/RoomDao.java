package cn.imust.dao;

import cn.imust.domain.PageBeanUI;
import cn.imust.domain.Room;

import java.util.List;

public interface RoomDao {

    List<Room> findAll(PageBeanUI pageBeanUI);

    void addRoom(Room room);
}
