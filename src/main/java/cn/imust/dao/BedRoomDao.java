package cn.imust.dao;

import cn.imust.domain.BedRoom;
import cn.imust.domain.PageBeanUI;
import cn.imust.domain.Room;

import java.util.List;

public interface BedRoomDao {

    void addBedRoom(BedRoom bedRoom);

    List<BedRoom> findAllBedroom(PageBeanUI pageBeanUI);
}
