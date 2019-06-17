package cn.imust.service;

import cn.imust.domain.PageBeanUI;
import cn.imust.domain.Student;

import java.util.List;

public interface StudentService {

    List<Student> studentList(PageBeanUI pageBeanUI);
}
