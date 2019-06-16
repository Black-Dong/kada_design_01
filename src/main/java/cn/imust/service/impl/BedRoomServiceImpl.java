package cn.imust.service.impl;

import cn.imust.dao.BedRoomDao;
import cn.imust.domain.BedRoom;
import cn.imust.domain.PageBeanUI;
import cn.imust.domain.Room;
import cn.imust.service.BedRoomService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    public List<BedRoom> findAllBedroom(PageBeanUI pageBeanUI, Integer pageIndex, Integer pageSize) {
        PageHelper.startPage(pageIndex,pageSize);
        return bedRoomDao.findAllBedroom(pageBeanUI);
    }
}
