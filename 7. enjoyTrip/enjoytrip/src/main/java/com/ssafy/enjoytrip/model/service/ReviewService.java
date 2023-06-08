package com.ssafy.enjoytrip.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.enjoytrip.dto.Review;

public interface ReviewService {
	List<Review> selectReviewsByID(int id) throws SQLException;
	int insertReview(Review review) throws SQLException;
}
