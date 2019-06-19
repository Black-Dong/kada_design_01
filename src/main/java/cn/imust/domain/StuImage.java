package cn.imust.domain;

import lombok.Data;

@Data
public class StuImage {

    private Integer imgId;
    private String imagePath;
    private Student student;
}
