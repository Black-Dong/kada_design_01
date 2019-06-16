package cn.imust.domain;

import lombok.Data;

@Data
public class PageBeanUI {

    private User user;
    private Room room;
    private BedRoom bedRoom;
    private User loginUser;

    private Integer pageIndex = 1;
    private Integer pageSize = 2;

}
