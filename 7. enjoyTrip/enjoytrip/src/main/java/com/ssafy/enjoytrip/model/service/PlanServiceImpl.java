package com.ssafy.enjoytrip.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.enjoytrip.dto.Plan;
import com.ssafy.enjoytrip.model.repo.PlanRepo;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class PlanServiceImpl implements PlanService {

	final PlanRepo repo;
	
	@Override
	public int insertPlan(Plan plan) throws SQLException {
		return repo.insertPlan(plan);
	}

	@Override
	public List<Plan> selectPlansByEmail(String email) throws SQLException {
		return repo.selectPlansByEmail(email);
	}

	@Override
	public int deletePlan(int id) throws SQLException {
		return repo.deletePlan(id);
	}

}
