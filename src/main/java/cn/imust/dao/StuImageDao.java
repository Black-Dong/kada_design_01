package cn.imust.dao;

import cn.imust.domain.StuImage;

public interface StuImageDao {
    void savaStuImage(StuImage stuImage);

    Integer findStuId(Integer stuId);

    void updateImage(StuImage stuImage);
}
