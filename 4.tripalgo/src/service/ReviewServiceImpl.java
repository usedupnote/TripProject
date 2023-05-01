package service;

import java.sql.SQLException;
import java.util.List;

import model.dao.ReviewDao;
import model.dao.ReviewDaoImpl;
import model.dto.Review;

public class ReviewServiceImpl implements ReviewService {
	
	private static ReviewService instance = new ReviewServiceImpl();
	private ReviewServiceImpl() {}
	public static ReviewService getInstance() {
		return instance;
	}
	
	ReviewDao dao = ReviewDaoImpl.getInstance();

	@Override
	public int writeArticle(Review review) throws SQLException {
		return dao.writeArticle(review);
	}

	@Override
	public List<Review> selectAll() throws SQLException {
		return dao.selectAll();
	}

	@Override
	public int updateLike(int articleNo) throws SQLException {
		return dao.updateLike(articleNo);
	}
	
	@Override
	public int removeLike(int articleNo) throws SQLException {
		return dao.removeLike(articleNo);
	}

	@Override
	public int modifyArticle(Review review) throws SQLException {
		return dao.modifyArticle(review);
	}

	@Override
	public int deleteArticle(int articleNO) throws SQLException {
		return dao.deleteArticle(articleNO);
	}
	@Override
	public Review selectArticle(int articleNO) throws SQLException {
		return dao.selectArticle(articleNO);
	}
}
