package com.ssafy.enjoytrip.model.service;

import java.util.List;
import java.util.Map;
import com.ssafy.enjoytrip.dto.User;

public interface UserService {
	/**Create*/
	void joinMember(User user) throws Exception;

	/**Read*/
	User select(User user) throws Exception;
	
	/**Read All*/
	List<User> listUser(Map<String, Object> map) throws Exception;

	/**Read by Email*/
	List<User> listUserByEmail(Map<String, Object> map) throws Exception;

	/**update*/
	void updateUser(User user) throws Exception;
	
	/**Delete*/
	void deleteUser(String email) throws Exception;

	/**login*/
	User loginUser(Map<String, String> map) throws Exception;

//	/**idCheck*/
//	int idCheck(String email) throws Exception;

//	/**GetMember*/
//	User getUser(String email) throws Exception;
}
