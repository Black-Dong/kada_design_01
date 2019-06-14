package cn.imust.dao;

import cn.imust.domain.PageBeanUI;
import cn.imust.domain.Room;
import cn.imust.domain.User;

import java.util.List;

public interface RoomDao {

    List<Room> findAll(User user);

    void addRoom(Room room);
}
