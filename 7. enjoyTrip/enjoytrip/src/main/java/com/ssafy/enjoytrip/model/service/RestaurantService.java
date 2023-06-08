package com.ssafy.enjoytrip.model.service;

import java.util.List;

import com.ssafy.enjoytrip.dto.Restaurant;

public interface RestaurantService {
	/**Create*/
	int joinRestaurant(Restaurant restaurant) throws Exception;

	/**Read By ID*/
	Restaurant listRestaurantById(String id) throws Exception;
	
	/**Read All*/
	List<Restaurant> listRestaurant() throws Exception;
	
	/**update*/
	int updateRestaurant(Restaurant restaurant) throws Exception;
	
	/**Delete*/
	int deleteRestaurant(String id) throws Exception;
}
