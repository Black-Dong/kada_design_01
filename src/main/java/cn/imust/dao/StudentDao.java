package cn.imust.dao;

import cn.imust.domain.BedRoom;
import cn.imust.domain.PageBeanUI;
import cn.imust.domain.Student;

import java.util.List;

public interface StudentDao {
    void addStudent(BedRoom bedRoom);

    void deleteStudentById(Integer stuId);

    List<Student> studentList(PageBeanUI pageBeanUI);

    Student findStudentById(Integer stuId);

    void updateStudent(BedRoom bedRoom);
}
