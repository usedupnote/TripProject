package com.ssafy.enjoytrip.model.repo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.enjoytrip.dto.Category;

@Mapper
public interface CategoryRepo {
	List<Category> selectAll();
	Category selectCategoryByName(String name);
	Category selectCategoryById(int id);
}