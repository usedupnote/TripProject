package service;

import java.sql.SQLException;
import java.util.List;

import model.dao.NoticeDao;
import model.dao.NoticeDaoImpl;
import model.dto.Notice;

public class NoticeServiceImpl implements NoticeService {
	
	private static NoticeService instance = new NoticeServiceImpl();
	private NoticeServiceImpl() {}
	public static NoticeService getInstance() {
		return instance;
	}
	
	NoticeDao dao = NoticeDaoImpl.getInstance();

	@Override
	public int writeArticle(Notice notice) throws SQLException {
		return dao.writeArticle(notice);
	}

	@Override
	public List<Notice> selectAll() throws SQLException {
		return dao.selectAll();
	}

	@Override
	public int updateHit(int articleNo) throws SQLException {
		return dao.updateHit(articleNo);
	}

	@Override
	public int modifyArticle(Notice boardDto) throws SQLException {
		return dao.modifyArticle(boardDto);
	}

	@Override
	public int deleteArticle(int articleNO) throws SQLException {
		return dao.deleteArticle(articleNO);
	}
	@Override
	public Notice selectArticle(int articleNO) throws SQLException {
		return dao.selectArticle(articleNO);
	}
}
