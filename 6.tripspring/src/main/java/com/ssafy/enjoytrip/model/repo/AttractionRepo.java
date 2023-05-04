package com.ssafy.enjoytrip.model.repo;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.enjoytrip.dto.Attraction;

@Mapper
public interface AttractionRepo {
	/**Create*/
	int joinAttraction(Attraction attraction) throws SQLException;

	/**Read By ID*/
	Attraction listAttractionById(String id) throws SQLException;
	
	/**Read By Name*/
	List<Attraction> listAttractionByName(String name) throws SQLException;
	
	/**Read All*/
	List<Attraction> listAttraction() throws SQLException;
	
	/**update*/
	int updateAttraction(Attraction attraction) throws SQLException;
	
	/**Delete*/
	int deleteAttraction(String id) throws SQLException;
}
