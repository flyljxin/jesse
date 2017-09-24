package com.bdk.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bdk.dao.IUserDao;
import com.bdk.mapper.User;
import com.bdk.service.IUserService;

/**
 * 用户相关实现 ClassName: UserServiceImpl
 * 
 * @Description:
 * @author ChenQuan
 * @date 2017年5月4日下午1:57:23
 */
@Service("userService")
public class UserServiceImpl implements IUserService {
	@Resource
	private IUserDao userDao;

	/**
	 * 根据 id 删除 数据
	 */
	public int delete(int id) {
		return userDao.delete(id);
	}

	/**
	 * 查询User的全部数据
	 */
	public List<User> findAll() {
		List<User> findAllList = userDao.findAll();
		return findAllList;
	}

	/**
	 * 根据 id 查询 对应数据
	 */
	public User findById(int id) {
		User user = userDao.findById(id);
		return user;
	}

	/**
	 * 新增数据
	 */
	public void save(User user) {
		userDao.save(user);
	}

	/**
	 * 根据 id 修改对应数据
	 */
	public int update(User user) {
		return userDao.update(user);
	}

	@Override
	public User login(String name, String pwd) {
		return userDao.login(name, pwd);
	}

	@Override
	public void updatePassword(User user) {
		if (user == null || user.getId() < 1) {
			return;
		}

		userDao.update(user);
	}

	@Override
	public List<User> queryUserList(String userName, int pageNo, int pageSize) {
		return userDao.queryUserList(userName, (pageNo - 1) * pageSize, pageSize);
	}

	@Override
	public int queryTotal(String userName) {
		return userDao.queryTotal(userName);
	}

	@Override
	public int queryUserName(String userName) {
		return userDao.queryUserName(userName);
	}
}
