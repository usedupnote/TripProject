package model.dao;

import java.sql.SQLException;
import java.util.List;

import model.dto.Notice;


public interface NoticeDao {
	int writeArticle(Notice notice) throws SQLException;
	List<Notice> selectAll() throws SQLException;
	int updateHit(int articleNo) throws SQLException;
	
	int modifyArticle(Notice boardDto) throws SQLException;
	int deleteArticle(int articleNO) throws SQLException;
	Notice selectArticle(int articleNO) throws SQLException;
}
