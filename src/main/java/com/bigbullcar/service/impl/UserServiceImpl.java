package com.bigbullcar.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bigbullcar.dao.UserMapper;
import com.bigbullcar.entity.User;
import com.bigbullcar.service.UserService;

/**
 * 用户服务实现类
 * @author zxt
 *
 */
@Service
public class UserServiceImpl implements UserService{

	@Resource
	private UserMapper userDao;
	
	@Override
	public List<User> getUserList() {
		// TODO 自动生成的方法存根
		return userDao.getUserList();
	}

	@Override
	public User getUser(User user) {
		// TODO 自动生成的方法存根
		return userDao.getUser(user);
	}

	@Override
	public int insertUser(User user) {
		// TODO 自动生成的方法存根
		return userDao.add(user);
	}

	@Override
	public int deleteUser(User user) {
		// TODO 自动生成的方法存根
		return userDao.delete(user);
	}

	@Override
	public int updateUser(User user) {
		// TODO 自动生成的方法存根
		return userDao.updateUser(user);
	}
	@Override
	public List<String> getUserByName() {
		// TODO 自动生成的方法存根
		return userDao.getUserByName();
	}
}
