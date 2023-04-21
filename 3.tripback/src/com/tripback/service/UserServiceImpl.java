package com.tripback.service;

import java.sql.SQLException;

import com.tripback.dao.UserDao;
import com.tripback.dao.UserDaoImpl;
import com.tripback.dto.User;

public class UserServiceImpl implements UserService {

	private static UserService instance=new UserServiceImpl();
	private UserServiceImpl() {}
	public static UserService getInstance() {
		return instance;
	}

	private UserDao dao=UserDaoImpl.getInstance();

	@Override
	public int insert(User user) throws SQLException {
		return dao.insert(user);
	}

	@Override
	public User select(String id) throws SQLException {
		return dao.select(id);
	}
	@Override
	public int delete(String id) throws SQLException {
		return dao.delete(id);
	}
	@Override
	public int update(User user) throws SQLException {
		return dao.update(user);
	}
}
