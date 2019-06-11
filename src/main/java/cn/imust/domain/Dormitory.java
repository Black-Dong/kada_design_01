package cn.imust.domain;

public class Dormitory {
    /**
     CREATE TABLE tbl_dormitory(
        dor_id INT PRIMARY KEY AUTO_INCREMENT ,
        dor_name VARCHAR(32) ,#宿舍楼名称
        user_id INT #所属用户
     );
     */
    private Integer dorId;
    private String dorName;
    private User user;

    @Override
    public String toString() {
        return "Dormitory{" +
                "dorId=" + dorId +
                ", dorName='" + dorName + '\'' +
                ", user=" + user +
                '}';
    }

    public Integer getDorId() {
        return dorId;
    }

    public void setDorId(Integer dorId) {
        this.dorId = dorId;
    }

    public String getDorName() {
        return dorName;
    }

    public void setDorName(String dorName) {
        this.dorName = dorName;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
