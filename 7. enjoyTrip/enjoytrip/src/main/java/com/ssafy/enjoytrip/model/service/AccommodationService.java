package com.ssafy.enjoytrip.model.service;

import java.util.List;

import com.ssafy.enjoytrip.dto.Accommodation;
import com.ssafy.enjoytrip.dto.Place;

public interface AccommodationService {
	/**Create*/
	int joinAccommodation(Place place) throws Exception;

	/**Read By Location*/
	List<Place> listAccommodationByLocation(String location) throws Exception;
	
	/**Read All*/
	List<Place> listAccommodation() throws Exception;
	
	/**update*/
	int updateAccommodation(Accommodation accommodation) throws Exception;
	
	/**Delete*/
	int deleteAccommodation(String id) throws Exception;
}
