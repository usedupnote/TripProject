package com.ssafy.enjoytrip.model.service;

import java.util.List;
import java.util.Map;
import com.ssafy.enjoytrip.dto.User;

public interface UserService {
	/**Create*/
	int joinUser(User user) throws Exception;

	/**Read by Email*/
	User listUserByEmail(String email) throws Exception;
	
	/**Read All*/
	List<User> listUser() throws Exception;

	/**update*/
	int updateUser(User user) throws Exception;
	
	/**Delete*/
	int deleteUser(String email) throws Exception;

	/**login*/
//	User loginUser(User user) throws Exception;

//	/**idCheck*/
//	int idCheck(String email) throws Exception;

//	/**GetMember*/
//	User getUser(String email) throws Exception;
}
