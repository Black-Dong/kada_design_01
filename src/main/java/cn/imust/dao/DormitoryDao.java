package cn.imust.dao;


import cn.imust.domain.Dormitory;
import cn.imust.domain.User;

import java.util.List;

public interface DormitoryDao {
    List<Dormitory> findAll();

    void add(Dormitory dormitory);

    Dormitory findDormitoryById(int dorId);

    void deleteById(int id);

    void updateDormitory(Dormitory dormitory);

    List<Dormitory> findAllByUser(User user);

}
