package com.ssafy.enjoytrip.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import com.ssafy.enjoytrip.dto.User;

public interface UserService {
	/**Create*/
	int createUser(User user) throws SQLException;

	/**Select By Email*/
	User selectUserByEmail(String email) throws SQLException;
	
	/**Read All*/
	List<User> selectAllUser() throws SQLException;
	
	/**update*/
	int updateUser(User user) throws SQLException;
	
	/**Delete*/
	int deleteUser(String email) throws SQLException;
	
	/**login*/
	boolean login(String email, String password) throws SQLException; 
}
