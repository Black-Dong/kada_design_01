package cn.imust.service.impl;


import cn.imust.dao.StuImageDao;
import cn.imust.domain.StuImage;
import cn.imust.service.StuImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StuImageServiceImpl implements StuImageService {

    @Autowired
    private StuImageDao stuImageDao;

    @Override
    public void savaStuImage(StuImage stuImage) {
        Integer imgId = stuImageDao.findStuId(stuImage.getStudent().getStuId());
        if (imgId != null){
            stuImage.setImgId(imgId);
            stuImageDao.updateImage(stuImage);
        }else {
            stuImageDao.savaStuImage(stuImage);
        }
    }
}
