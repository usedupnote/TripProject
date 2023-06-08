package com.ssafy.enjoytrip.model.repo;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.enjoytrip.dto.Plan;
import com.ssafy.enjoytrip.dto.User;

@Mapper
public interface PlanRepo {
	/**Create*/
	int insertPlan(Plan plan) throws SQLException;
	
	/**Select By Email*/
	List<Plan> selectPlansByEmail(String email) throws SQLException;
	
	/**delete*/
	int deletePlan(int id) throws SQLException;
}
