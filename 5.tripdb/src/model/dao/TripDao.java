package model.dao;

import java.sql.SQLException;
import java.util.List;

import model.dto.Trip;

public interface TripDao {
	//Trip select(String contentId) throws SQLException;
	List<Trip> selectAll(int sidoCode, int cotentTypeId, String keyword) throws SQLException;
}
