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

import com.ssafy.enjoytrip.dto.Restaurant;
import com.ssafy.enjoytrip.model.service.RestaurantService;

import io.swagger.v3.oas.annotations.parameters.RequestBody;

@RestController
@RequestMapping("/restaurant")
@CrossOrigin("*")
public class RestaurantController {
	
	@Autowired
	RestaurantService restaurantService;	// static 하면 안됨

	@GetMapping("")
	public ResponseEntity<?> listRestaurant() throws Exception {
		List<Restaurant> restaurants = restaurantService.listRestaurant();
			if (restaurants != null && restaurants.size() != 0) {
			return new ResponseEntity<List<Restaurant>>(restaurants, HttpStatus.OK);
		}
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT); 
	}
	
	@GetMapping("/{id}")	
	public ResponseEntity<?> listRestaurantById(@PathVariable String id) throws Exception {
		Restaurant restaurant = restaurantService.listRestaurantById(id);
		if (restaurant != null) return new ResponseEntity<Restaurant>(restaurant, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	}
	
	@PostMapping("")
	public ResponseEntity<?> joinRestaurant(@RequestBody Restaurant restaurant) throws Exception {
		int result = restaurantService.joinRestaurant(restaurant);
		if (result == 1) return new ResponseEntity<Integer>(result, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PutMapping("")
	public ResponseEntity<?> updateRestaurant(@RequestBody Restaurant restaurant) throws Exception {
		int result = restaurantService.updateRestaurant(restaurant);
		if (result == 1) return new ResponseEntity<Integer>(result, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<?> deleteRestaurant(@PathVariable String id) throws Exception {
		int result = restaurantService.deleteRestaurant(id);
		if (result == 1) return new ResponseEntity<Integer>(result, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
