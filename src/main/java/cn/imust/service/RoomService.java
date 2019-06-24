package cn.imust.service;


import cn.imust.domain.*;

import java.util.List;

public interface RoomService {

    List<Room> findAll(PageBeanUI pageBeanUI,Integer pageIndex,Integer pageSize);

    void addRoom(Room room);

    List<Room> findAllRoomByDormitory(Dormitory dormitory);

    void deleteRoomById(int id);

    Room findRoomById(Integer roomId);

    void roomUpdate(Room room);
}
