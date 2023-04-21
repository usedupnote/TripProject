package com.tripback.service;

import java.sql.SQLException;

import com.tripback.dto.User;

public interface UserService {
	
	public int insert(User user) throws SQLException;
	public User select(String id) throws SQLException;
	public int delete(String id) throws SQLException;
	public int update(User user) throws SQLException;
}
