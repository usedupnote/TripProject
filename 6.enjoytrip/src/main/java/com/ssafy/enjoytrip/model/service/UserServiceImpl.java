package com.ssafy.enjoytrip.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ssafy.enjoytrip.dto.User;
import com.ssafy.enjoytrip.model.repo.UserRepo;

@Service
public class UserServiceImpl implements UserService {

	private UserRepo userRepo;

	public UserServiceImpl(UserRepo userRepo) {
		super();
		this.userRepo = userRepo;
	}
	
	@Override
	public void joinMember(User user) throws Exception {
		userRepo.joinMember(user);
	}

	@Override
	public User select(User user) throws Exception {
		return userRepo.select(user);
	}

	@Override
	public List<User> listUser(Map<String, Object> map) throws Exception {
		return userRepo.listUser(map);
	}
	
	@Override
	public List<User> listUserByEmail(Map<String, Object> map) throws Exception {
		return userRepo.listUserByEmail(map);
	}

	@Override
	public void updateUser(User user) throws Exception {
		userRepo.updateUser(user);
	}

	@Override
	public void deleteUser(String email) throws Exception {
		userRepo.deleteUser(email);
	}

	@Override
	public User loginUser(Map<String, String> map) throws Exception {
		return userRepo.loginUser(map);
	}
}
