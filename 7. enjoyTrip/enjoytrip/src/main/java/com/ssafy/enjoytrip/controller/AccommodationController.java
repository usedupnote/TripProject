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
import com.ssafy.enjoytrip.dto.Place;
import com.ssafy.enjoytrip.model.service.AccommodationService;

import io.swagger.v3.oas.annotations.parameters.RequestBody;

@RestController
@CrossOrigin("*")
@RequestMapping("/accommodation")
public class AccommodationController {
	
	@Autowired
	AccommodationService accommodationService;	// static 하면 안됨

	@GetMapping("")
	public ResponseEntity<?> listAccommodation() throws Exception {
		List<Place> places = accommodationService.listAccommodation();
			if (places != null && places.size() != 0) {
			return new ResponseEntity<List<Place>>(places, HttpStatus.OK);
		}
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT); 
	}
	
	@GetMapping("/{location}")	
	public ResponseEntity<?> listAccommodationByLocation(@PathVariable String location) throws Exception {
		List<Place> places = accommodationService.listAccommodationByLocation(location);
		if (places != null && places.size() != 0) {
			return new ResponseEntity<List<Place>>(places, HttpStatus.OK);
		}
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	}
	
	@PostMapping("")
	public ResponseEntity<?> joinAccommodation(@RequestBody Place place) throws Exception {
		place.setPlaceTypeId(1); // 관광지는 type1
		int result = accommodationService.joinAccommodation(place);
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
