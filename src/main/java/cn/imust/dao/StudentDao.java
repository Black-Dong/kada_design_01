package cn.imust.dao;

import cn.imust.domain.BedRoom;
import cn.imust.domain.PageBeanUI;

public interface StudentDao {
    void addStudent(BedRoom bedRoom);

    void deleteStudentById(Integer stuId);
}
