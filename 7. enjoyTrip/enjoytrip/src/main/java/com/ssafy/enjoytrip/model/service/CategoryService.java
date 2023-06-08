package com.ssafy.enjoytrip.model.service;

import java.util.List;

import com.ssafy.enjoytrip.dto.Category;

public interface CategoryService {
	List<Category> selectAll();
	Category selectCategoryByName(String name);
	Category selectCategoryById(int id);
}
