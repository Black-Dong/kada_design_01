package cn.imust.service;


import cn.imust.domain.Dormitory;

import java.util.List;

public interface DormitoryService {
    List<Dormitory> findAll();

    void add(Dormitory dormitory);

    Dormitory findDormitoryById(Integer dorId);
}
