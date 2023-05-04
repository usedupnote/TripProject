package com.ssafy.enjoytrip.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.enjoytrip.dto.User;
import com.ssafy.enjoytrip.model.service.UserService;

import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/user")
@CrossOrigin("*")
public class UserController {
	
	@Autowired
	UserService userService;	// static 하면 안됨

	@GetMapping("")
	public ResponseEntity<?> listUser() throws Exception {
		List<User> users = userService.listUser();
		if (users != null && users.size() != 0) {
			return new ResponseEntity<List<User>>(users, HttpStatus.OK);
		}
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT); 
	}
	
	@GetMapping("/{email}")	
	public ResponseEntity<?> listUserByEmail(@PathVariable String email) throws Exception {
		User user = userService.listUserByEmail(email);
		if (user != null) return new ResponseEntity<User>(user, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	}
	
	@PostMapping("")
	public ResponseEntity<?> joinUser(@RequestBody User user) throws Exception {
		int result = userService.joinUser(user);
		if (result == 1) return new ResponseEntity<Integer>(result, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PutMapping("")
	public ResponseEntity<?> updateUser(@RequestBody User user) throws Exception {
		int result = userService.updateUser(user);
		if (result == 1) return new ResponseEntity<Integer>(result, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@DeleteMapping("/{email}")
	public ResponseEntity<?> deleteUser(@PathVariable String email) throws Exception {
		int result = userService.deleteUser(email);
		if (result == 1) return new ResponseEntity<Integer>(result, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@PostMapping("/login")
	public ResponseEntity<?> loginUser(@RequestBody User user) throws Exception {
	User login  = userService.listUserByEmail(user.getEmail());
	if (login != null && login.getEmail().contentEquals(user.getEmail()) && login.getPassword().equals(user.getPassword())) return new ResponseEntity<User>(login, HttpStatus.OK);
	return new ResponseEntity<Void>(HttpStatus.UNAUTHORIZED);
	}
	/**
	 * 
	 * login 기능 구현 필요
	 * 
	*/
//	@PostMapping("")
//	public ResponseEntity<?> loginUser(@RequestBody User user) throws Exception {
//		
//		if (user != null) return new ResponseEntity<User>(user, HttpStatus.OK);
//		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
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
