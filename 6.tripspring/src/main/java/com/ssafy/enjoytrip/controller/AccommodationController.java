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

import com.ssafy.enjoytrip.dto.Accommodation;
import com.ssafy.enjoytrip.model.service.AccommodationService;

import io.swagger.v3.oas.annotations.parameters.RequestBody;

@RestController
@RequestMapping("/accommodation")
@CrossOrigin("*")
public class AccommodationController {
	
	@Autowired
	AccommodationService accommodationService;	// static 하면 안됨

	@GetMapping("")
	public ResponseEntity<?> listAccommodation() throws Exception {
		List<Accommodation> accommodations = accommodationService.listAccommodation();
			if (accommodations != null && accommodations.size() != 0) {
			return new ResponseEntity<List<Accommodation>>(accommodations, HttpStatus.OK);
		}
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT); 
	}
	
	@GetMapping("/{id}")	
	public ResponseEntity<?> listAccommodationById(@PathVariable String id) throws Exception {
		Accommodation accommodation = accommodationService.listAccommodationById(id);
		if (accommodation != null) return new ResponseEntity<Accommodation>(accommodation, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	}
	
	@PostMapping("")
	public ResponseEntity<?> joinAccommodation(@RequestBody Accommodation accommodation) throws Exception {
		int result = accommodationService.joinAccommodation(accommodation);
		if (result == 1) return new ResponseEntity<Integer>(result, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PutMapping("")
	public ResponseEntity<?> updateAccommodation(@RequestBody Accommodation accommodation) throws Exception {
		int result = accommodationService.updateAccommodation(accommodation);
		if (result == 1) return new ResponseEntity<Integer>(result, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<?> deleteAccommodation(@PathVariable String id) throws Exception {
		int result = accommodationService.deleteAccommodation(id);
		if (result == 1) return new ResponseEntity<Integer>(result, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
