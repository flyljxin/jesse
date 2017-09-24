package com.zmt;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.alibaba.druid.pool.DruidDataSource;
import com.zmt.dao.IUserMapper;
import com.zmt.pojo.User;

public class TestSpring {

	@Test
	public void test() {

		Logger xx = Logger.getLogger(TestSpring.class);
		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "classpath:spring.xml" });
		xx.error("iii");

		TestProperty propertyBean = (TestProperty) ac.getBean("prop");
		DruidDataSource dataSource = (DruidDataSource) ac.getBean("dataSource");

		System.out.println("prop=" + propertyBean.getUsername());
		System.out.println("datasource=" + dataSource.getUsername());
		SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) ac.getBean("sqlSessionFactory");
		SqlSession session = sqlSessionFactory.openSession();
		try {
			IUserMapper mapper = session.getMapper(IUserMapper.class);
			User user = new User();
			user.setId(1);
			user.setAge("15");
			user.setUserName("jesse");
			xx.error("before mapper");
			mapper.save(user);
			xx.error("mapper");
			// do work
		} catch (Exception e) {
			xx.error(e);
		} finally {
			session.close();
		}
	}

}
