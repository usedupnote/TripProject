package com.ssafy.enjoytrip.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.enjoytrip.dto.Attraction;
import com.ssafy.enjoytrip.dto.User;
import com.ssafy.enjoytrip.model.service.AttractionService;
import com.ssafy.enjoytrip.model.service.UserService;

import io.swagger.v3.oas.annotations.parameters.RequestBody;

@RestController
@RequestMapping("/attraction")
@CrossOrigin("*")
public class AttractionController {
	
	@Autowired
	AttractionService attractionService;	// static 하면 안됨

	@GetMapping("")
	public ResponseEntity<?> listAttraction() throws Exception {
		List<Attraction> attractions = attractionService.listAttraction();
			if (attractions != null && attractions.size() != 0) {
			return new ResponseEntity<List<Attraction>>(attractions, HttpStatus.OK);
		}
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT); 
	}
	
	@GetMapping("/id/{id}")	
	public ResponseEntity<?> listAttractionById(@PathVariable String id) throws Exception {
		Attraction attraction = attractionService.listAttractionById(id);
		if (attraction != null) return new ResponseEntity<Attraction>(attraction, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	}

	@GetMapping("/name/{name}")	
	public ResponseEntity<?> listAttractionByName(@PathVariable String name) throws Exception {
		System.out.println(name);
		List<Attraction> attractions = attractionService.listAttractionByName(name);
		System.out.println(attractions + " " + name);
			if (attractions != null && attractions.size() != 0) {
			return new ResponseEntity<List<Attraction>>(attractions, HttpStatus.OK);
		}
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT); 
	}
	
	@PostMapping("")
	public ResponseEntity<?> joinAttraction(@RequestBody Attraction attraction) throws Exception {
		int result = attractionService.joinAttraction(attraction);
		if (result == 1) return new ResponseEntity<Integer>(result, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PutMapping("")
	public ResponseEntity<?> updateAttraction(@RequestBody Attraction attraction) throws Exception {
		int result = attractionService.updateAttraction(attraction);
		if (result == 1) return new ResponseEntity<Integer>(result, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<?> deleteAttraction(@PathVariable String id) throws Exception {
		int result = attractionService.deleteAttraction(id);
		if (result == 1) return new ResponseEntity<Integer>(result, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
