package cn.imust.test;

import cn.imust.dao.UserDao;
import cn.imust.domain.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class MyBatisTest {

    @Test
    public void test() throws IOException {

        InputStream in = Resources.getResourceAsStream("");
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(in);

        SqlSession sqlSession = sqlSessionFactory.openSession();

        UserDao userDao = sqlSession.getMapper(UserDao.class);
/*
        List<User> userList = userDao.findUserList();
        for (User user : userList) {
            System.out.println(user);
        }
*/

    }
}
