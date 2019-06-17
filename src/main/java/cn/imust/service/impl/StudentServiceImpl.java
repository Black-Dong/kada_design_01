package cn.imust.service.impl;

import cn.imust.dao.StudentDao;
import cn.imust.domain.PageBeanUI;
import cn.imust.domain.Student;
import cn.imust.service.StudentService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentDao studentDao;

    @Override
    public List<Student> studentList(PageBeanUI pageBeanUI) {

        PageHelper.startPage(pageBeanUI.getPageIndex(),pageBeanUI.getPageSize());
        return studentDao.studentList(pageBeanUI);
    }
}
