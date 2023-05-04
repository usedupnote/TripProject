package com.ssafy.enjoytrip.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.enjoytrip.dto.Accommodation;
import com.ssafy.enjoytrip.dto.User;
import com.ssafy.enjoytrip.model.repo.AccommodationRepo;
import com.ssafy.enjoytrip.model.repo.UserRepo;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AccommodationServiceImpl implements AccommodationService {
	
	@Autowired
	private AccommodationRepo accommodationRepo;
	
	@Override
	public int joinAccommodation(Accommodation accommodation) throws Exception {
		return accommodationRepo.joinAccommodation(accommodation);
	}

	@Override
	public Accommodation listAccommodationById(String id) throws Exception {
		return accommodationRepo.listAccommodationById(id);
	}

	@Override
	public List<Accommodation> listAccommodation() throws Exception {
		return accommodationRepo.listAccommodation();
	}

	@Override
	public int updateAccommodation(Accommodation accommodation) throws Exception {
		return accommodationRepo.updateAccommodation(accommodation);
	}

	@Override
	public int deleteAccommodation(String id) throws Exception {
		return accommodationRepo.deleteAccommodation(id);
	}
}
