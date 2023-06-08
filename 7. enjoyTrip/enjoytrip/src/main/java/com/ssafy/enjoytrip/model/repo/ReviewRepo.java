package com.ssafy.enjoytrip.model.repo;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.enjoytrip.dto.Review;

@Mapper
public interface ReviewRepo {
	List<Review> selectReviewsByID(int id) throws SQLException;
	int insertReview(Review review) throws SQLException;
}
