package service;

import java.sql.SQLException;
import java.util.List;

import model.dto.Trip;

public interface TripService {
	List<Trip> selectAll(int sidoCode, int cotentTypeId, String keyword) throws SQLException;
}
