package com.ssafy.enjoytrip.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.enjoytrip.dto.Plan;
import com.ssafy.enjoytrip.dto.User;
import com.ssafy.enjoytrip.model.service.JwtService;
import com.ssafy.enjoytrip.model.service.PlanService;
import com.ssafy.enjoytrip.model.service.UserService;

import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@RestController
@RequestMapping("/plan")
@CrossOrigin("*")
public class PlanController {
	
	private final PlanService planService;

	@GetMapping("")
	public ResponseEntity<?> selectPlansByEmail(String email) throws Exception {
		List<Plan> plans = planService.selectPlansByEmail(email);
		if (plans != null && plans.size() != 0) {
			return new ResponseEntity<List<Plan>>(plans, HttpStatus.OK);
		}
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT); 
	}
	
	@PostMapping("")
	public ResponseEntity<?> insertPlan(@RequestBody Plan plan) throws Exception {
		System.out.println(plan);
		int result = planService.insertPlan(plan);
		if (result == 1) return new ResponseEntity<Integer>(result, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	

	@DeleteMapping("/{id}")
	public ResponseEntity<?> deleteUser(@PathVariable int id) throws Exception {
		int result = planService.deletePlan(id);
		if (result == 1) return new ResponseEntity<Integer>(result, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
