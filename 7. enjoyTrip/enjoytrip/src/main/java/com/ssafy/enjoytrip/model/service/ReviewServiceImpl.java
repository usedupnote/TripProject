package com.ssafy.enjoytrip.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.enjoytrip.dto.Review;
import com.ssafy.enjoytrip.model.repo.ReviewRepo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {

	private final ReviewRepo reviewRepo;
	
	@Override
	public List<Review> selectReviewsByID(int id) throws SQLException {
		return reviewRepo.selectReviewsByID(id);
	}

	@Override
	public int insertReview(Review review) throws SQLException {
		return reviewRepo.insertReview(review);
	}

}
