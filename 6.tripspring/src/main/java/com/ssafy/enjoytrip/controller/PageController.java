package com.ssafy.enjoytrip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

// TODO: 다음 프로젝트 때 jsp와 함께 삭지
@Controller
public class PageController {
	@GetMapping({ "/", "/index" })
	public String index() {
		return "index";
	}
	
	@GetMapping("member_edit")
	public String memberEdit() {
		return "member_edit";
	}
	
	@GetMapping("member_profile")
	public String memberProfile() {
		return "member_profile";
	}
	
	@GetMapping("my_trip")
	public String myTrip() {
		return "my_trip";
	}
	
	@GetMapping("postWrite")
	public String postWrite() {
		return "postWrite";
	}
	
	@GetMapping("sample-inner-page")
	public String sampleInnerPage() {
		return "sample-inner-page";
	}
	
	@GetMapping("tripsearch")
	public String tripSearch() {
		return "tripsearch";
	}
	
	@GetMapping("view")
	public String view() {
		return "view";
	}
}
