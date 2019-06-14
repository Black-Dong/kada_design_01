package cn.imust.service;


import cn.imust.domain.Dormitory;
import cn.imust.domain.User;

import java.util.List;

public interface DormitoryService {

    void add(Dormitory dormitory);

    Dormitory findDormitoryById(Integer dorId);

    void deleteById(Integer[] ids);

    void updateDormitory(Dormitory dormitory);

    List<Dormitory> findAllByUser(User user);
}
