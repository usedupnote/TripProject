package com.ssafy.enjoytrip.model.repo;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.ssafy.enjoytrip.dto.Restaurant;

@Mapper
public interface RestaurantRepo {
	/**Create*/
	int joinRestaurant(Restaurant restaurant) throws SQLException;

	/**Read By ID*/
	Restaurant listRestaurantById(String id) throws SQLException;
	
	/**Read All*/
	List<Restaurant> listRestaurant() throws SQLException;
	
	/**update*/
	int updateRestaurant(Restaurant restaurant) throws SQLException;
	
	/**Delete*/
	int deleteRestaurant(String id) throws SQLException;
}
