package com.ssafy.enjoytrip.model.repo;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.enjoytrip.dto.User;

@Mapper
public interface UserRepo {
	/**Create*/
	void joinMember(User user) throws SQLException;

	/**Read*/
	User select(User user) throws SQLException;
	
	/**Read All*/
	List<User> listUser(Map<String, Object> map) throws SQLException;
	
	/**Read By Email*/
	List<User> listUserByEmail(Map<String, Object> map) throws Exception;
	
	/**update*/
	void updateUser(User user) throws SQLException;
	
	/**Delete*/
	void deleteUser(String email) throws SQLException;

	/**login*/
	User loginUser(Map<String, String> map) throws SQLException;

//	/**idCheck*/
//	int idCheck(String email) throws SQLException;

//	/**GetMember*/
//	User getUser(String email) throws SQLException;
}
