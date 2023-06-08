package com.ssafy.enjoytrip.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.enjoytrip.dto.Restaurant;
import com.ssafy.enjoytrip.dto.User;
import com.ssafy.enjoytrip.model.repo.RestaurantRepo;
import com.ssafy.enjoytrip.model.repo.UserRepo;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class RestaurantServiceImpl implements RestaurantService {
	
	@Autowired
	private RestaurantRepo restaurantRepo;
	
	@Override
	public int joinRestaurant(Restaurant restaurant) throws Exception {
		return restaurantRepo.joinRestaurant(restaurant);
	}

	@Override
	public Restaurant listRestaurantById(String id) throws Exception {
		return restaurantRepo.listRestaurantById(id);
	}

	@Override
	public List<Restaurant> listRestaurant() throws Exception {
		return restaurantRepo.listRestaurant();
	}

	@Override
	public int updateRestaurant(Restaurant restaurant) throws Exception {
		return restaurantRepo.updateRestaurant(restaurant);
	}

	@Override
	public int deleteRestaurant(String id) throws Exception {
		return restaurantRepo.deleteRestaurant(id);
	}
}
