package cn.imust.domain;

import lombok.Data;

@Data
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

    private Integer bedRoomId;

    private Room room;
}
