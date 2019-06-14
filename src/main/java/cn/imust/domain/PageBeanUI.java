package cn.imust.domain;

public class PageBeanUI {
    private Integer pageNumber =1 ;
    private Integer pageSize = 2;
    private User user;
    private Room room;
    private BedRoom bedRoom;

    //模糊查询添加
    private String user_name = "";
    private String dormitory_dorId = "";

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getDormitory_dorId() {
        return dormitory_dorId;
    }

    public void setDormitory_dorId(String dormitory_dorId) {
        this.dormitory_dorId = dormitory_dorId;
    }

    @Override
    public String toString() {
        return "PageBeanUI{" +
                "pageNumber=" + pageNumber +
                ", pageSize=" + pageSize +
                ", user=" + user +
                ", room=" + room +
                ", bedRoom=" + bedRoom +
                ", user_name='" + user_name + '\'' +
                ", dormitory_dorId='" + dormitory_dorId + '\'' +
                ", startIndex=" + startIndex +
                '}';
    }

    public BedRoom getBedRoom() {
        return bedRoom;
    }

    public void setBedRoom(BedRoom bedRoom) {
        this.bedRoom = bedRoom;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    private Integer startIndex;

    public void setStartIndex(Integer startIndex) {
        this.startIndex = startIndex;
    }

    public Integer getStartIndex() {
        startIndex = (pageNumber-1)*pageSize;
        return startIndex;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }



    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
