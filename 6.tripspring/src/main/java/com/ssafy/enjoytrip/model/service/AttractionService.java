package com.ssafy.enjoytrip.model.service;

import java.util.List;

import com.ssafy.enjoytrip.dto.Attraction;

public interface AttractionService {
	/**Create*/
	int joinAttraction(Attraction attraction) throws Exception;

	/**Read By ID*/
	Attraction listAttractionById(String id) throws Exception;
	
	/**Read By Name*/
	List<Attraction> listAttractionByName(String name) throws Exception;
	
	/**Read All*/
	List<Attraction> listAttraction() throws Exception;
	
	/**update*/
	int updateAttraction(Attraction attraction) throws Exception;
	
	/**Delete*/
	int deleteAttraction(String id) throws Exception;
}
