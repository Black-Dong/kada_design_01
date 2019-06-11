package cn.imust.domain;

public class User {
    /**
     uid INT PRIMARY KEY AUTO_INCREMENT,#主键
     username VARCHAR(32) , #登陆名称
     NAME VARCHAR(32) , #真实姓名

     PASSWORD VARCHAR(32), #密码
     STATUS VARCHAR(2) , #用户状态
     create_date VARCHAR(32),#最后修改时间

     gender VARCHAR(2) ,#性别
     email VARCHAR(32),#邮箱
     telephone VARCHAR(32) ,#联系电话
     */
    private Integer uid;
    private String username;
    private String name;

    private String password;
    private String status;
    private String createDate;

    private String gender ;
    private String telephone ;
    private String email;

    private String code;

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", username='" + username + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", status='" + status + '\'' +
                ", createDate='" + createDate + '\'' +
                ", gender='" + gender + '\'' +
                ", telephone='" + telephone + '\'' +
                ", email='" + email + '\'' +
                ", code='" + code + '\'' +
                '}';
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
