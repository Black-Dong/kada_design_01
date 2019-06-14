package cn.imust.service.impl;

import cn.imust.dao.BedRoomDao;
import cn.imust.domain.BedRoom;
import cn.imust.domain.Room;
import cn.imust.service.BedRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BedRoomServiceImpl implements BedRoomService {

    @Autowired
    private BedRoomDao bedRoomDao;

    @Override
    public void addBedRoom(BedRoom bedRoom, Room room) {
        for (int i=0; i<6; i++){
            bedRoom.setIsFlag("N");
            bedRoom.setRoomBedName(Integer.toString(i+1));
            bedRoom.setRoom(room);
            bedRoomDao.addBedRoom(bedRoom);
        }
    }
}
