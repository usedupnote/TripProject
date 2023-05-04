package com.ssafy.enjoytrip.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.enjoytrip.dto.Board;
import com.ssafy.enjoytrip.model.service.BoardService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/board")
public class BoardController {
	
	final BoardService svc;
	
	@GetMapping("")
	public ResponseEntity<?> selectAll() {
		List<Board> boards = svc.selectAll();
		if (boards != null) {
			return new ResponseEntity<List<Board>>(boards, HttpStatus.OK);
		}
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT); 
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<?> select(@PathVariable String id) {
		Board board = svc.select(id);
		if (board != null) return new ResponseEntity<Board>(board, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	}
	
	@PostMapping("")
	public ResponseEntity<?> insert(@RequestBody Board board) {
		int result = svc.insert(board);
		if (result == 1) return new ResponseEntity<Integer>(result, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PutMapping("")
	public ResponseEntity<?> update(@RequestBody Board board) {
		int result = svc.update(board);
		if (result == 1) return new ResponseEntity<Integer>(result, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<?> delete(@PathVariable String id) {
		int result = svc.delete(id);
		if (result == 1) return new ResponseEntity<Integer>(result, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
