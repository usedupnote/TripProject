package service;

import java.sql.SQLException;
import java.util.List;

import model.dto.Notice;


public interface NoticeService {
	int writeArticle(Notice notice) throws SQLException;
	List<Notice> selectAll() throws SQLException;
	int updateHit(int articleNo) throws SQLException;
	
	int modifyArticle(Notice boardDto) throws SQLException;
	int deleteArticle(int articleNO) throws SQLException;
	Notice selectArticle(int articleNO) throws SQLException;
}
