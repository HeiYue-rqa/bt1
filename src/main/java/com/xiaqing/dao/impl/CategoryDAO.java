package com.xiaqing.dao.impl;

import java.util.List;

import com.xiaqing.dao.ICategoryDAO;
import com.xiaqing.mapper.CategoryMapper;
import com.xiaqing.model.CategoryModel;

public class CategoryDAO extends AbstractDAO<CategoryModel> implements ICategoryDAO {

	@Override
	public List<CategoryModel> findAll() {
		String sql = "SELECT * FROM category";
		return query(sql, new CategoryMapper());
	}

	@Override
	public CategoryModel findOne(long id) {
		String sql = "SELECT * FROM category WHERE id = ?";
		List<CategoryModel> category = query(sql, new CategoryMapper(), id);
		return category.isEmpty() ? null : category.get(0);
	}

    @Override
    public CategoryModel findOneByCode(String code) {
		String sql = "SELECT * FROM category WHERE code = ?";
		List<CategoryModel> category = query(sql, new CategoryMapper(), code);
		return category.isEmpty() ? null : category.get(0);
    }
    
    public static void main(String[] args) {
    	CategoryDAO dao = new CategoryDAO();
		List<CategoryModel> list = dao.findAll();
		for(CategoryModel o : list) {
			System.out.println(o);
		}
	}

}
