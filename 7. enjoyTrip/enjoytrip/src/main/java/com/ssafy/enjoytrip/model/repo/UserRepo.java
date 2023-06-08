package com.ssafy.enjoytrip.model.repo;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.enjoytrip.dto.User;

@Mapper
public interface UserRepo {
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
}
