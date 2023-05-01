package service;

import java.sql.SQLException;
import java.util.List;

import model.dao.TripDao;
import model.dao.TripDaoImpl;
import model.dto.Trip;

public class TripServiceImpl implements TripService {
	
	private static TripService instance = new TripServiceImpl();
	private TripServiceImpl() {}
	public static TripService getInstance() {
		return instance;
	}
	
	TripDao dao = TripDaoImpl.getInstance();

	@Override
	public List<Trip> selectAll(int sidoCode, int cotentTypeId, String keyword) throws SQLException {
		return dao.selectAll(sidoCode, cotentTypeId, keyword);
	}

}
