package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import DBUtil.DBUtil;
import model.dto.Trip;

public class TripDaoImpl implements TripDao {
	private static TripDao instance = new TripDaoImpl(); 
	private TripDaoImpl() {}
	public static TripDao getInstance() {
		return instance;
	}
	
	DBUtil util =  DBUtil.getInstance();
	
	@Override
	public List<Trip> selectAll(int sidoCode, int cotentTypeId, String keyword) throws SQLException {
		List<Trip> trips = new ArrayList<>();
		
		String sql = "select ai.content_id, ai.title, ai.addr1, ai.addr2, ai.first_image, ai.latitude, ai.longitude, CONCAT(LEFT(ad.overview, 30), '...') as overview\r\n" + 
					 "from attraction_info ai, attraction_description ad\r\n" + 
					 "where ai.sido_code = ? and ai.content_type_id = ? and ai.content_id = ad.content_id\r\n" + 
					 "and ai.title like ?";
		
		try(Connection con = util.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setInt(1, sidoCode);
			ps.setInt(2, cotentTypeId);
			ps.setString(3, "%"+keyword+"%");
			

			try(ResultSet rs = ps.executeQuery();) {
				while(rs.next()) {
					trips.add(new Trip(rs.getString("content_id"), rs.getString("title"), rs.getString("addr1"), rs.getString("addr2"), rs.getString("first_image"), rs.getDouble("latitude"), rs.getDouble("longitude"), rs.getString("overview")));
				}
			}
		}
		return trips;
	}
//	public static void main(String[] args) throws SQLException {
//		TripDao dao = TripDaoImpl.getInstance();
//		for(Trip t : dao.selectAll(1, 14, "극장")) {
//			 System.out.println(t);
//		}
//	}
}
