package com.ssafy.enjoytrip.model.repo;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.enjoytrip.dto.Accommodation;

@Mapper
public interface AccommodationRepo {
	/**Create*/
	int joinAccommodation(Accommodation accommodation) throws SQLException;

	/**Read By ID*/
	Accommodation listAccommodationById(String id) throws SQLException;
	
	/**Read All*/
	List<Accommodation> listAccommodation() throws SQLException;
	
	/**update*/
	int updateAccommodation(Accommodation accommodation) throws SQLException;
	
	/**Delete*/
	int deleteAccommodation(String id) throws SQLException;
}
