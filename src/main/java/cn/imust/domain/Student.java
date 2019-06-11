package cn.imust.domain;

public class Student {
    /**
     stu_id INT PRIMARY KEY AUTO_INCREMENT ,
     stu_name VARCHAR(32) , #学员姓名
     stu_phone VARCHAR(32),#学员电话

     stu_family_phone VARCHAR(32),#学员家庭电话
     stu_teacher_name VARCHAR(32),#学员导师
     stu_teacher_phone VARCHAR(32),#学员导师电话

     stu_gender VARCHAR(10),#学员性别
     stu_address VARCHAR(64),#学员家庭住址
     room_name VARCHAR(32),#房间的名称

     room_id INT  #居住的房间
     */
    private Integer stuId;
    private String stuName;
    private String stuPhone;

    private String stuFamilyPhone;
    private String stuTeacherName;
    private String stuTeacherPhone;

    private String stuGender;
    private String stuAddress;
    private String roomName;

    private Room room;

    @Override
    public String toString() {
        return "Student{" +
                "stuId=" + stuId +
                ", stuName='" + stuName + '\'' +
                ", stuPhone='" + stuPhone + '\'' +
                ", stuFamilyPhone='" + stuFamilyPhone + '\'' +
                ", stuTeacherName='" + stuTeacherName + '\'' +
                ", stuTeacherPhone='" + stuTeacherPhone + '\'' +
                ", stuGender='" + stuGender + '\'' +
                ", stuAddress='" + stuAddress + '\'' +
                ", roomName='" + roomName + '\'' +
                ", room=" + room +
                '}';
    }

    public Integer getStuId() {
        return stuId;
    }

    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getStuPhone() {
        return stuPhone;
    }

    public void setStuPhone(String stuPhone) {
        this.stuPhone = stuPhone;
    }

    public String getStuFamilyPhone() {
        return stuFamilyPhone;
    }

    public void setStuFamilyPhone(String stuFamilyPhone) {
        this.stuFamilyPhone = stuFamilyPhone;
    }

    public String getStuTeacherName() {
        return stuTeacherName;
    }

    public void setStuTeacherName(String stuTeacherName) {
        this.stuTeacherName = stuTeacherName;
    }

    public String getStuTeacherPhone() {
        return stuTeacherPhone;
    }

    public void setStuTeacherPhone(String stuTeacherPhone) {
        this.stuTeacherPhone = stuTeacherPhone;
    }

    public String getStuGender() {
        return stuGender;
    }

    public void setStuGender(String stuGender) {
        this.stuGender = stuGender;
    }

    public String getStuAddress() {
        return stuAddress;
    }

    public void setStuAddress(String stuAddress) {
        this.stuAddress = stuAddress;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }



}
