package cn.imust.service;

import cn.imust.domain.BedRoom;
import cn.imust.domain.PageBeanUI;
import cn.imust.domain.Room;
import org.springframework.stereotype.Service;

import java.util.List;

public interface BedRoomService {
    void addBedRoom(BedRoom bedRoom,Room room);

    // Done: 2019/6/17 查询床位信息列表
    List<BedRoom> findAllBedroom(PageBeanUI pageBeanUI);

    BedRoom findBedroomById(Integer bedId);

    void inRoom(BedRoom bedRoom);

    void outRoom(BedRoom bedRoom);

    List<BedRoom> findAllBedroomByRoom(Room room);
}
