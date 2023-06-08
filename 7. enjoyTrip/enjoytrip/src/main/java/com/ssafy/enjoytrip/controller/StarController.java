package com.ssafy.enjoytrip.controller;

import java.io.Console;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.enjoytrip.dto.Star;
import com.ssafy.enjoytrip.model.service.StarService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/star")
@CrossOrigin("*")
public class StarController {
	
	private final StarService starService;

//	int createStar(Star star) throws SQLException;
//	Star selectUserByIdandEmail(int board_id, String user_email) throws SQLException;
//	List<Star> selectAll(String user_email) throws SQLException;
	
//	int deleteStar(int board_id, String user_email) throws SQLException;

	@GetMapping("/selectAll")
	public ResponseEntity<?> selectAll() throws Exception {
		List<Star> stars = starService.selectAll();
		if (stars != null && stars.size() != 0) {
			return new ResponseEntity<List<Star>>(stars, HttpStatus.OK);
		}
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT); 
	}

	@PostMapping("/create")
	public ResponseEntity<?> createStar(@RequestBody Star star) throws Exception {
		System.out.println(star);
		int result = starService.createStar(star);
		System.out.println(result);
		if (result == 1) return new ResponseEntity<Integer>(result, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping("/selectAllByEmail/{email}")
	public ResponseEntity<?> selectAllByEmail(@PathVariable String email) throws Exception {
		System.out.println("selectAllByEmail");
		List<Star> stars = starService.selectAllByEmail(email);
		if (stars != null && stars.size() != 0) {
			return new ResponseEntity<List<Star>>(stars, HttpStatus.OK);
		}
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT); 
	}
	
	@GetMapping("/selectAllByBoardId/{board_id}")
	public ResponseEntity<?> selectAllByBoardId(@PathVariable Integer board_id) throws Exception {
		System.out.println(board_id);
		List<Star> stars = starService.selectAllByBoardId(board_id);
		if (stars != null && stars.size() != 0) {
			return new ResponseEntity<List<Star>>(stars, HttpStatus.OK);
		}
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT); 
	}
	
	@PostMapping("/delete")
	public ResponseEntity<?> deleteStar(@RequestBody Star star) throws Exception {
		System.out.println(star);
		int result = starService.deleteStar(star);
		if (result == 1) return new ResponseEntity<Integer>(result, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
