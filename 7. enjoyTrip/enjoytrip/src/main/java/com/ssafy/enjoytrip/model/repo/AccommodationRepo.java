package com.ssafy.enjoytrip.model.repo;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.enjoytrip.dto.Accommodation;
import com.ssafy.enjoytrip.dto.Place;

@Mapper
public interface AccommodationRepo {
	/**Create*/
	int joinAccommodation(Place place) throws SQLException;

	/**Read By location*/
	List<Place> listAccommodationByLocation(String location) throws SQLException;
	
	/**Read All*/
	List<Place> listAccommodation() throws SQLException;
	
	/**update*/
	int updateAccommodation(Accommodation accommodation) throws SQLException;
	
	/**Delete*/
	int deleteAccommodation(String id) throws SQLException;
}
