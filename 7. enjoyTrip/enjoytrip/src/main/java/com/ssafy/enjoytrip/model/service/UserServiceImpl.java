package com.ssafy.enjoytrip.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.enjoytrip.dto.User;
import com.ssafy.enjoytrip.model.repo.UserRepo;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserRepo userRepo;
	
	@Override
	public int createUser(User user) throws SQLException {
		return userRepo.createUser(user);
	}

	@Override
	public User selectUserByEmail(String email) throws SQLException {
		return userRepo.selectUserByEmail(email);
	}

	@Override
	public List<User> selectAllUser() throws SQLException {
		return userRepo.selectAllUser();
	}

	@Override
	public int updateUser(User user) throws SQLException {
		return userRepo.updateUser(user);
	}

	@Override
	public int deleteUser(String email) throws SQLException {
		return userRepo.deleteUser(email);
	}

	@Override
	public boolean login(String email, String password) throws SQLException {
		User user = userRepo.selectUserByEmail(email);
		System.out.println(user);
		if (user != null && user.getPassword().equals(password)) {
			return true;
		}
		return false;
	}
}
