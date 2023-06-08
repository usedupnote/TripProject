package com.ssafy.enjoytrip.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.enjoytrip.dto.User;
import com.ssafy.enjoytrip.model.service.JwtService;
import com.ssafy.enjoytrip.model.service.UserService;

import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@RestController
@RequestMapping("/user")
@CrossOrigin("*")
public class UserController {
	
	private final UserService userService;
	private final JwtService JwtService;

	@GetMapping("")
	public ResponseEntity<?> selectAllUser() throws Exception {
		List<User> users = userService.selectAllUser();
		if (users != null && users.size() != 0) {
			return new ResponseEntity<List<User>>(users, HttpStatus.OK);
		}
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT); 
	}
	
	@GetMapping("/{email}")	
	public ResponseEntity<?> selectUserByEmail(@PathVariable String email) throws Exception {
		User user = userService.selectUserByEmail(email);
		if (user != null) return new ResponseEntity<User>(user, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	}
	
	@PostMapping("")
	public ResponseEntity<?> createUser(@RequestBody User user) throws Exception {
		int result = userService.createUser(user);
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
	if (userService.login(user.getEmail(), user.getPassword())) {
		return new ResponseEntity<String>(JwtService.createAccessToken("email", user.getEmail()), HttpStatus.OK);
	}
	return new ResponseEntity<String>("인증 실패", HttpStatus.UNAUTHORIZED);
	}
	
}
