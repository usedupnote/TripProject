package com.tripback.dao;

import java.sql.SQLException;
import java.util.List;

import com.tripback.dto.User;

public interface UserDao {
	int insert(User user) throws SQLException;
	User select(String id) throws SQLException;
	List<User> selectAll() throws SQLException;
	int delete(String id) throws SQLException;
	int update(User user) throws SQLException;
}
