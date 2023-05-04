package com.ssafy.enjoytrip.model.repo;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.enjoytrip.dto.User;

@Mapper
public interface UserRepo {
	/**Create*/
	int joinUser(User user) throws SQLException;

	/**Read By Email*/
	User listUserByEmail(String email) throws SQLException;
	
	/**Read All*/
	List<User> listUser() throws SQLException;
	
	/**update*/
	int updateUser(User user) throws SQLException;
	
	/**Delete*/
	int deleteUser(String email) throws SQLException;

	/**login*/
//	User loginUser(User user) throws SQLException;

//	/**idCheck*/
//	int idCheck(String email) throws SQLException;

//	/**GetMember*/
//	User getUser(String email) throws SQLException;
}
