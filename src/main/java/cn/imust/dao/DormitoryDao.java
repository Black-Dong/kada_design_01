package cn.imust.dao;


import cn.imust.domain.Dormitory;

import java.util.List;

public interface DormitoryDao {
    List<Dormitory> findAll();

    void add(Dormitory dormitory);

    Dormitory findDormitoryById(int dorId);
}
