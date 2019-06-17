package cn.imust.domain;

import lombok.Data;

@Data
public class PageBeanUI {

    private User user;
    private Room room;
    private BedRoom bedRoom;
    private Student student;
    private Dormitory dormitory;
    private User loginUser;

    private Integer pageIndex = 1;
    private Integer pageSize = 10;
    private Integer navigatePages = 5;  //导航页条数

}
