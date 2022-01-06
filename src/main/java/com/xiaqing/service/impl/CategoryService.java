package com.xiaqing.service.impl;

import java.util.List;

import jakarta.inject.Inject;

import com.xiaqing.dao.ICategoryDAO;
import com.xiaqing.model.CategoryModel;
import com.xiaqing.service.ICategoryService;

public class CategoryService implements ICategoryService {
	
	@Inject
	private ICategoryDAO categoryDao;

	@Override
	public List<CategoryModel> findAll() {
		return categoryDao.findAll();
	}
}
