package com.ssafy.enjoytrip.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.enjoytrip.dto.Category;
import com.ssafy.enjoytrip.model.service.CategoryService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/category")
@CrossOrigin("*")
public class CategoryController {
	
	final CategoryService svc;

	@GetMapping("")
	public ResponseEntity<?> selectAll() {
		List<Category> categorys = svc.selectAll();
		if (categorys != null) {
			return new ResponseEntity<List<Category>>(categorys, HttpStatus.OK);
		}
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT); 
	}
	
	@GetMapping("/byname/{name}")
	public ResponseEntity<?> selectCategoryByName(@PathVariable String name) {
		System.out.println(name);
		Category category = svc.selectCategoryByName(name);
		System.out.println(category);
		if (category != null) return new ResponseEntity<Category>(category, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	}

	@GetMapping("/byid/{id}")
	public ResponseEntity<?> selectCategoryById(@PathVariable int id) {
		System.out.println(id);
		Category category = svc.selectCategoryById(id);
		System.out.println(category);
		if (category != null) return new ResponseEntity<Category>(category, HttpStatus.OK);
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	}
}
