package com.zmt.service.impl;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.zmt.dao.IUserMapper;
import com.zmt.pojo.User;
import com.zmt.service.UserServiceI;

@Service("userService")
public class UserServiceImpl implements UserServiceI{

	private static final Logger logger = Logger.getLogger(UserServiceImpl.class);
	
	
	@Resource
	private IUserMapper userMapper;
	
	
	public void test() {
		System.out.println("888");
		
	}


	public void saveUser(User user) {
		if(user == null){
			user = new User();
			user.setAge("no");
			user.setUserName("no");
			
		}
		userMapper.save(user);
		logger.info("over");
		
	}


}
