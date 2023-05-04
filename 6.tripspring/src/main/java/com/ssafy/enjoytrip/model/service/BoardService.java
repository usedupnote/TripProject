package com.ssafy.enjoytrip.model.service;

import java.util.List;

import com.ssafy.enjoytrip.dto.Board;

public interface BoardService {
	int insert(Board board);
	int update(Board board);
	int delete(String id);
	Board select(String id);
	List<Board> selectAll();
}
