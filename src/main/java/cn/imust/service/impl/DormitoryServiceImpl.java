package cn.imust.service.impl;

import cn.imust.dao.DormitoryDao;
import cn.imust.domain.Dormitory;
import cn.imust.service.DormitoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DormitoryServiceImpl implements DormitoryService {

    @Autowired
    private DormitoryDao dormitoryDao;

    @Override
    public List<Dormitory> findAll() {
        return dormitoryDao.findAll();
    }

    @Override
    public void add(Dormitory dormitory) {
        dormitoryDao.add(dormitory);
    }

    @Override
    public Dormitory findDormitoryById(Integer dorId) {
        return dormitoryDao.findDormitoryById(dorId);
    }

    @Override
    public void deleteById(Integer[] ids) {
        for (int id : ids){
            dormitoryDao.deleteById(id);
        }
    }
}