package cn.imust.dao;

import cn.imust.domain.Dormitory;
import cn.imust.domain.PageBeanUI;
import cn.imust.domain.Room;
import cn.imust.domain.User;

import java.util.List;

public interface RoomDao {

    List<Room> findAll(PageBeanUI pageBeanUI);

    void addRoom(Room room);

    List<Room> findAllRoomByDormitory(Dormitory dormitory);

    Room finRoomById(Integer roomId);
}
