package com.bdk.service;

import java.util.List;

import com.bdk.mapper.User;

public interface IUserService {
	void save(User user);

	int update(User user);

	int delete(int id);

	User findById(int id);

	List<User> findAll();
	/**
	 * 校验用户名 密码
	 * @Description:
	 * @param name
	 * @param pwd
	 * @return
	 * @author ChenQuan
	 * @date 2017年5月9日上午10:45:19
	 * @version:1.0.0
	 */
	User login(String name,String pwd);
	
	/**
	 * 修改用户登录密码
	 * @Description:
	 * @param user
	 * @return
	 * @author Wu Jingde
	 * @date 2017年5月11日下午4:16:01
	 * @version:1.0.0
	 */
	void updatePassword(User user);
	
	/**
	 * 根据条件查询用户列表
	 * @Description:
	 * @param userName
	 * @param pageNo  当前页数
	 * @param pageSize  每页条数
	 * @return
	 * @return
	 * @author Wu Jingde
	 * @date 2017年5月16日下午1:55:12
	 * @version:1.0.0
	 */
	public List<User> queryUserList(String userName, int pageNo, int pageSize);
	
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
	public int queryTotal(String userName);

	/**
	 * 查询所有的用户名
	 * @Description: 
	 * @param userName
	 * @author 岳崇武
	 * @date 2017年5月22日下午12:01:12
	 * @version:1.0.0
	 */
	public int queryUserName(String userName);
}
