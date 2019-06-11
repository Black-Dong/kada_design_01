package cn.imust.domain;

public class Room {
    /**
     * room_id INT PRIMARY KEY AUTO_INCREMENT ,
     room_name VARCHAR(32), #宿舍号
     room_dor_id INT #所属宿舍楼
     */
    private Integer roomId;
    private String roomName;
    private Dormitory dormitory;
    private BedRoom bedRoom;

    public BedRoom getBedRoom() {
        return bedRoom;
    }

    public void setBedRoom(BedRoom bedRoom) {
        this.bedRoom = bedRoom;
    }

    @Override
    public String toString() {
        return "Room{" +
                "roomId=" + roomId +
                ", roomName='" + roomName + '\'' +
                ", dormitory=" + dormitory +
                ", bedRoom=" + bedRoom +
                '}';
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public Dormitory getDormitory() {
        return dormitory;
    }

    public void setDormitory(Dormitory dormitory) {
        this.dormitory = dormitory;
    }
}
