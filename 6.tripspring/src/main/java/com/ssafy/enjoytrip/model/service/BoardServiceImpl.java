package com.ssafy.enjoytrip.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.enjoytrip.dto.Board;
import com.ssafy.enjoytrip.model.repo.BoardRepo;
import com.ssafy.enjoytrip.util.TimeStamp;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {

	final BoardRepo repo;
	
	@Override
	public int insert(Board board) {
		return repo.insert(board);
	}

	@Override
	public int update(Board board) {
		board.setUpdateTime(TimeStamp.getCurrentTimeStamp());
		return repo.update(board);
	}

	@Override
	public int delete(String id) {
		return repo.delete(id);
	}

	@Override
	public Board select(String id) {
		return repo.select(id);
	}

	@Override
	public List<Board> selectAll() {
		return repo.selectAll();
	}
	
}
