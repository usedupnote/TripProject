package com.ssafy.enjoytrip.model.service;

import java.util.List;

import com.ssafy.enjoytrip.dto.Accommodation;

public interface AccommodationService {
	/**Create*/
	int joinAccommodation(Accommodation accommodation) throws Exception;

	/**Read By ID*/
	Accommodation listAccommodationById(String id) throws Exception;
	
	/**Read All*/
	List<Accommodation> listAccommodation() throws Exception;
	
	/**update*/
	int updateAccommodation(Accommodation accommodation) throws Exception;
	
	/**Delete*/
	int deleteAccommodation(String id) throws Exception;
}
