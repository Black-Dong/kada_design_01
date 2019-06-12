package cn.imust.service;


import cn.imust.domain.PageBeanUI;
import cn.imust.domain.Room;

import java.util.List;

public interface RoomService {

    List<Room> findAll(PageBeanUI pageBeanUI);

    void addRoom(Room room);
}
