package com.ssafy.enjoytrip.model.service;

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
	public int joinUser(User user) throws Exception {
		return userRepo.joinUser(user);
	}

	@Override
	public User listUserByEmail(String email) throws Exception {
		return userRepo.listUserByEmail(email);
	}

	@Override
	public List<User> listUser() throws Exception {
		System.out.println(userRepo);
		return userRepo.listUser();
	}

	@Override
	public int updateUser(User user) throws Exception {
		return userRepo.updateUser(user);
	}

	@Override
	public int deleteUser(String email) throws Exception {
		return userRepo.deleteUser(email);
	}

//	@Override
//	public User loginUser(User user) throws Exception {
//		return userRepo.loginUser(user);
//	}
}
