package com.zmt.dao;

import java.util.List;

import com.zmt.pojo.User;

/**
 * author: Fern
 * Date:2017年6月4日下午9:33:41
 * 说明：
 */
public interface IUserMapper {

	void save(User user);  
    boolean update(User user);
	
    boolean delete(int id);  
    User findById(int id);  
    List<User> findAll(); 
}
