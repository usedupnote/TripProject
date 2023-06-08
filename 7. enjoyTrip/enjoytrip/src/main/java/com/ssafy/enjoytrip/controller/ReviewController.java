package com.ssafy.enjoytrip.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.ssafy.enjoytrip.dto.Restaurant;
import com.ssafy.enjoytrip.dto.Review;
import com.ssafy.enjoytrip.model.service.ReviewService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/reviews")
@CrossOrigin("*")
public class ReviewController {
	
	private final ReviewService reviewService;
	
	@PostMapping("")
	public ResponseEntity<?> postReview(@RequestBody Review review) throws Exception {
		int result = reviewService.insertReview(review);
		if (result == 1) return new ResponseEntity<Integer>(result, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<?> selectReviewsByID(@PathVariable int id) throws Exception {
		List<Review> reviews = reviewService.selectReviewsByID(id);
			if (reviews != null && reviews.size() != 0) {
			return new ResponseEntity<List<Review>>(reviews, HttpStatus.OK);
		}
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT); 
	}
}
