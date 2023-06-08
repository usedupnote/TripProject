package com.ssafy.enjoytrip.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.enjoytrip.dto.Category;
import com.ssafy.enjoytrip.model.repo.CategoryRepo;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CategoryServiceImpl implements CategoryService {

	final CategoryRepo repo;

	@Override
	public List<Category> selectAll() {
		return repo.selectAll();
	}@Override
	
	public Category selectCategoryByName(String name) {
		return repo.selectCategoryByName(name);
	}

	@Override
	public Category selectCategoryById(int id) {
		return repo.selectCategoryById(id);
	}
	
}
