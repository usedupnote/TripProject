package com.ssafy.enjoytrip.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.enjoytrip.dto.Plan;

public interface PlanService {
	/**Create*/
	int insertPlan(Plan plan) throws SQLException;
	
	/**Select By Email*/
	List<Plan> selectPlansByEmail(String email) throws SQLException;
	
	/**delete*/
	int deletePlan(int id) throws SQLException;
}
