package com.ssafy.enjoytrip.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.enjoytrip.dto.Attraction;
import com.ssafy.enjoytrip.dto.Place;
import com.ssafy.enjoytrip.dto.User;
import com.ssafy.enjoytrip.model.repo.AttractionRepo;
import com.ssafy.enjoytrip.model.repo.UserRepo;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AttractionServiceImpl implements AttractionService {
	
	@Autowired
	private AttractionRepo attractionRepo;
	
	@Override
	public int joinAttraction(Attraction attraction) throws Exception {
		return attractionRepo.joinAttraction(attraction);
	}

	@Override
	public Attraction listAttractionById(String id) throws Exception {
		return attractionRepo.listAttractionById(id);
	}

	@Override
	public List<Attraction> listAttractionByName(String name) throws Exception {
		return attractionRepo.listAttractionByName(name);
	}

	@Override
	public List<Attraction> listAttraction() throws Exception {
		return attractionRepo.listAttraction();
	}

	@Override
	public int updateAttraction(Attraction attraction) throws Exception {
		return attractionRepo.updateAttraction(attraction);
	}

	@Override
	public int deleteAttraction(String id) throws Exception {
		return attractionRepo.deleteAttraction(id);
	}
}
