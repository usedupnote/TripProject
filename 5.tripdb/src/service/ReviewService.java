package service;

import java.sql.SQLException;
import java.util.List;

import model.dto.Notice;
import model.dto.Review;


public interface ReviewService {
	int writeArticle(Review review) throws SQLException;
	List<Review> selectAll() throws SQLException;
	int updateLike(int articleNo) throws SQLException;
	int removeLike(int articleNo) throws SQLException;
	
	int modifyArticle(Review boardDto) throws SQLException;
	int deleteArticle(int articleNO) throws SQLException;
	Review selectArticle(int articleNO) throws SQLException;
}
