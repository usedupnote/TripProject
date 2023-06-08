package com.ssafy.enjoytrip.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.enjoytrip.dto.Star;
import com.ssafy.enjoytrip.dto.User;
import com.ssafy.enjoytrip.model.repo.StarRepo;
import com.ssafy.enjoytrip.model.repo.UserRepo;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class StarServiceImpl implements StarService {
	
	@Autowired
	private StarRepo starRepo;

	@Override
	public int createStar(Star star) throws SQLException {
		return starRepo.createStar(star);
	}

	@Override
	public Star selectUserByIdandEmail(int board_id, String user_email) throws SQLException {
		return starRepo.selectUserByIdandEmail(board_id, user_email);
	}

	@Override
	public List<Star> selectAll() throws SQLException {
		return starRepo.selectAll();
	}

	@Override
	public List<Star> selectAllByEmail(String email) throws SQLException {
		return starRepo.selectAllByEmail(email);
	}

	@Override
	public List<Star> selectAllByBoardId(int board_id) throws SQLException {
		return starRepo.selectAllByBoardId(board_id);
	}

	@Override
	public int deleteStar(Star star) throws SQLException {
		return starRepo.deleteStar(star);
	}
}
