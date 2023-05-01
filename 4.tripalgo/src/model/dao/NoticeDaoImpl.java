package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import DBUtil.DBUtil;
import model.dto.Notice;

public class NoticeDaoImpl implements NoticeDao {
	
	private static NoticeDao instance = new NoticeDaoImpl();
	private NoticeDaoImpl() {}
	public static NoticeDao getInstance() {
		return instance;
	}
	
	DBUtil util = DBUtil.getInstance();

	@Override
	public int writeArticle(Notice notice) throws SQLException {
		String sql = "insert into notice (id, title, content) values (?, ?, ?)";
		
		try(Connection con = util.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setString(1, notice.getId());
			ps.setString(2, notice.getTitle());
			ps.setString(3, notice.getDesc());
			
			return ps.executeUpdate();
		}
	}

	@Override
	public List<Notice> selectAll() throws SQLException {
		List<Notice> list = new ArrayList<>();
		String sql = "select * from notice";
		try(Connection con = util.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);) {
			
			try(ResultSet rs = ps.executeQuery();) {
				while(rs.next()) {
					list.add(new Notice(rs.getInt("article_no"), rs.getString("id"), rs.getString("title"), rs.getString("content"), rs.getInt("hit"), rs.getString("register_time")));
				}
			}
		}
		return list;
	}

	@Override
	public int updateHit(int articleNo) throws SQLException {
		String sql = "update notice set hit = hit+1 where article_no=?";
		
		try(Connection con = util.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setInt(1, articleNo);
			return ps.executeUpdate();
		}
	}

	@Override
	public int modifyArticle(Notice boardDto) throws SQLException {
		String sql = "update notice set title=?, content=? where article_no=?";
		int articleNo = boardDto.getArticleNo();
		String title = boardDto.getTitle();
		String desc = boardDto.getDesc();
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
		String sql = "delete notice where artice_no=?";
		try(Connection con = util.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setInt(1, articleNO);
			return ps.executeUpdate();
		}
	}
	@Override
	public Notice selectArticle(int articleNO) throws SQLException {
		Notice notice = null;
		String sql = "select * from notice where article_no=?";
		try(Connection con = util.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setInt(1, articleNO);
			
			try(ResultSet rs = ps.executeQuery();) {
				if(rs.next()) {
					notice = new Notice(rs.getInt("article_no"), rs.getString("id"), rs.getString("title"), rs.getString("content"), rs.getInt("hit"), rs.getString("register_time"));
				}
			}
		}
		return notice;
	}
}
