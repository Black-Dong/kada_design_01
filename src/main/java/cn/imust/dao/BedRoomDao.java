package cn.imust.dao;

import cn.imust.domain.BedRoom;
import cn.imust.domain.PageBeanUI;
import cn.imust.domain.Room;

import java.util.List;

public interface BedRoomDao {

    void addBedRoom(BedRoom bedRoom);

    List<BedRoom> findAllBedroom(PageBeanUI pageBeanUI);

    BedRoom findBedroomById(Integer bedId);

    void updateBedRoom(BedRoom bedRoom);

    List<BedRoom> findAllBedroomByRoom(Room room);

    BedRoom findBedroomByStudentId(int id);

    Integer[] findStuIdsByRoomId(int id);

    void deleteByRoomId(int id);
}
