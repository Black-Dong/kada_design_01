package cn.imust.domain;

public class BedRoom {
    /**
     bed_id INT PRIMARY KEY AUTO_INCREMENT ,#唯一标识
     room_bed_name VARCHAR(32),#床位编号
     is_flag VARCHAR(10) DEFAULT 'N',# 是否有人居住 N表示没有 Y表示有
     stu_id INT DEFAULT 0, #居住学员id 0表示没有学员 否则为学员id
     room_id INT #所属宿舍
     */
    private Integer bedId;
    private String  roomBedName;
    private String isFlag;
    private Student student;
    private Room room;

    @Override
    public String toString() {
        return "BedRoom{" +
                "bedId=" + bedId +
                ", roomBedName='" + roomBedName + '\'' +
                ", isFlag='" + isFlag + '\'' +
                ", student=" + student +
                ", room=" + room +
                '}';
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Integer getBedId() {
        return bedId;
    }

    public void setBedId(Integer bedId) {
        this.bedId = bedId;
    }

    public String getRoomBedName() {
        return roomBedName;
    }

    public void setRoomBedName(String roomBedName) {
        this.roomBedName = roomBedName;
    }

    public String getIsFlag() {
        return isFlag;
    }

    public void setIsFlag(String isFlag) {
        this.isFlag = isFlag;
    }


    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }
}
