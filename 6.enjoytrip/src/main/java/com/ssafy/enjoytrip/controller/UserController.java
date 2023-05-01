package com.ssafy.enjoytrip.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.enjoytrip.dto.User;
import com.ssafy.enjoytrip.model.service.UserService;

import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/user")
//@CrossOrigin("*")
public class UserController {
	static UserService userService;
	
	public UserController(UserService userService) {
		super();
		this.userService = userService;
	}

//	@GetMapping("")
//	public ResponseEntity<?> selectAll() {
//		List<User> users = userService.listUser();
//		if (users != null) {
//			return new ResponseEntity<List<User>>(users, HttpStatus.OK);
//		}
//		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT); 
//	}
//	
//	@GetMapping("/{email}")
//	public ResponseEntity<?> select(@PathVariable String email) {
//		User user = userService.select(email);
//		if (user != null) return new ResponseEntity<User>(user, HttpStatus.OK);
//		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
//	}
//	
//	@PostMapping("")
//	public ResponseEntity<?> insert(@RequestBody User user) {
//		int result = userService.joinMember(User);
//		if (result == 1) return new ResponseEntity<Integer>(result, HttpStatus.OK);
//		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
//	
//	@PutMapping("")
//	public ResponseEntity<?> update(@RequestBody User user {
//		int result = userService.updateUser(user);
//		if (result == 1) return new ResponseEntity<Integer>(result, HttpStatus.OK);
//		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
//
//	@DeleteMapping("/{email}")
//	public ResponseEntity<?> delete(@PathVariable String email) {
//		int result = userService.deleteUser(email);
//		if (result == 1) return new ResponseEntity<Integer>(result, HttpStatus.OK);
//		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}

//	@GetMapping("/login")
//	public String login(User user) {
//	int result = userService.loginUser(user);
//	if (result == 1) return new ResponseEntity<Integer>(result, HttpStatus.OK);
//	return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
	
	
//	/**Create*/
//	void joinMember(User user) throws SQLException;
//
//	/**Read*/
//	User select(User user) throws SQLException;
//	
//	/**Read All*/
//	List<User> listUser(Map<String, Object> map) throws SQLException;
//
//	/**update*/
//	void updateUser(User user) throws SQLException;
//	
//	/**Delete*/
//	void deleteUser(String email) throws SQLException;
//
//	/**login*/
//	User loginUser(Map<String, String> map) throws SQLException;
	
}
