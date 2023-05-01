package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBUtil.DBUtil;
import model.dto.Notice;
import model.dto.Review;

public class ReviewDaoImpl implements ReviewDao {
	
	private static ReviewDao instance = new ReviewDaoImpl();
	private ReviewDaoImpl() {}
	public static ReviewDao getInstance() {
		return instance;
	}
	
	DBUtil util = DBUtil.getInstance();

	@Override
	public int writeArticle(Review review) throws SQLException {
		String sql = "insert into review (id, title, content) values(?,?,?)";
		
		try(Connection con = util.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setString(1, review.getId());
			ps.setString(2, review.getTitle());
			ps.setString(3, review.getDesc());
			
			return ps.executeUpdate();
		}
	}

	@Override
	public List<Review> selectAll() throws SQLException {
		List<Review> list = new ArrayList<>();
		String sql = "select * from review";
		try(Connection con = util.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);) {
			
			try(ResultSet rs = ps.executeQuery();) {
				while(rs.next()) {
					list.add(new Review(rs.getInt("article_no"), rs.getString("id"), rs.getString("title"), rs.getString("content"), rs.getString("img"), rs.getInt("hit"), rs.getString("register_time")));
				}
			}
		}
		return list;
	}

	@Override
	public int updateLike(int articleNo) throws SQLException {
		String sql = "update review set hit = hit+1 where article_no=?";
		
		try(Connection con = util.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setInt(1, articleNo);
			return ps.executeUpdate();
		}
	}
	
	@Override
	public int removeLike(int articleNo) throws SQLException {
		String sql = "update review set hit = hit-1 where article_no=?";
		
		try(Connection con = util.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setInt(1, articleNo);
			return ps.executeUpdate();
		}
	}

	@Override
	public int modifyArticle(Review review) throws SQLException {
		String sql = "update review set title = ?, content = ? where article_no = ?";
		int articleNo = review.getArticleNo();
		String title = review.getTitle();
		String desc = review.getDesc();
		try(Connection con = util.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);) {
				ps.setString(1, title);
				ps.setString(2, desc);
				ps.setInt(3, articleNo);
				return ps.executeUpdate();
			}
		
	}

	@Override
	public int deleteArticle(int articleNO) throws SQLException {
		String sql = "delete from review where article_no=?";
		try(Connection con = util.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setInt(1, articleNO);
			return ps.executeUpdate();
		}
	}
	@Override
	public Review selectArticle(int articleNO) throws SQLException {
		Review review = null;
		String sql = "select * from review where article_no=?";
		try(Connection con = util.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setInt(1, articleNO);
			try(ResultSet rs = ps.executeQuery();) {
				if(rs.next()) {
					review = new Review(rs.getInt("article_no"), rs.getString("id"), rs.getString("title"), rs.getString("content"), rs.getString("img"), rs.getInt("hit"), rs.getString("register_time"));
				}
			}
		}
		return review;
	}
}
