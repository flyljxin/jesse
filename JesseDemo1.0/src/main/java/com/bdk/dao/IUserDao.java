package com.bdk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bdk.mapper.User;

public interface IUserDao {
	void save(User user);

	int update(User user);

	int delete(int id);

	User findById(int id);

	List<User> findAll();
	
	User login(@Param("name") String name,@Param("password") String password);
	
	/**
	 * 根据条件查询用户列表
	 * @Description:
	 * @param userName
	 * @param pageStart  从第几条开始
	 * @param pageSize  每页条数
	 * @return
	 * @return
	 * @author Wu Jingde
	 * @date 2017年5月16日下午1:55:12
	 * @version:1.0.0
	 */
	public List<User> queryUserList(@Param("userName")String userName, @Param("pageStart")int pageStart, @Param("pageSize")int pageSize);
	
	/**
	 * 根据条件查询用户列表总数 
	 * @Description:
	 * @param userName
	 * @return
	 * @return
	 * @author Wu Jingde
	 * @date 2017年5月16日下午1:55:50
	 * @version:1.0.0
	 */
	public int queryTotal(@Param("userName")String userName);

	/**
	 * 查询所有的用户名
	 * @Description: 
	 * @param userName
	 * @author 岳崇武
	 * @date 2017年5月22日下午12:01:12
	 * @version:1.0.0
	 */
	public int queryUserName(@Param("userName")String userName);
}