package com.ssafy.enjoytrip.model.repo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.enjoytrip.dto.Board;

@Mapper
public interface BoardRepo {
	int insert(Board board);
	int update(Board board);
	int delete(String id);
	Board select(String id);
	List<Board> selectAll();
}