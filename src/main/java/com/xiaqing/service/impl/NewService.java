package com.xiaqing.service.impl;

import java.sql.Date;
import java.util.List;

import jakarta.inject.Inject;

import com.xiaqing.dao.ICategoryDAO;
import com.xiaqing.dao.INewDAO;
import com.xiaqing.model.CategoryModel;
import com.xiaqing.model.NewModel;
import com.xiaqing.paging.Pageble;
import com.xiaqing.service.INewService;

public class NewService implements INewService {
	
	@Inject
	private INewDAO newDao;

	@Inject
	private ICategoryDAO categoryDAO;
	
	@Override
	public List<NewModel> findAll() {
		return newDao.findAll();
	}
	
	@Override
	public List<NewModel> findSome(String search) {
		return newDao.findSome(search);
	}

	@Override
	public List<NewModel> findByCategoryId(Long categoryId) {
		return newDao.findByCategoryId(categoryId);
	}

	@Override
	public NewModel save(NewModel newModel) {
		newModel.setCreatedDate(new Date(System.currentTimeMillis()));
		CategoryModel category = categoryDAO.findOneByCode(newModel.getCategoryCode());
		newModel.setCategoryId(category.getId());
		Long newId = newDao.save(newModel);
		return newDao.findOne(newId);
	}

	@Override
	public NewModel update(NewModel updateNew) {
		NewModel oldNew = newDao.findOne(updateNew.getId());
		updateNew.setCreatedDate(oldNew.getCreatedDate());
		updateNew.setCreatedBy(oldNew.getCreatedBy());
		updateNew.setModifiedDate(new Date(System.currentTimeMillis()));
		CategoryModel category = categoryDAO.findOneByCode(updateNew.getCategoryCode());
		updateNew.setCategoryId(category.getId());
		newDao.update(updateNew);
		return newDao.findOne(updateNew.getId());
	}

	@Override
	public void delete(long[] ids) {
		for (long id: ids) {
			//1.delete comment (khoa ngoai new_id)
			//2.delete news
			newDao.delete(id);
		}
	}

	@Override
	public int getTotalItem() {
		return newDao.getTotalItem();
	}

    @Override
    public NewModel findOne(long id) {
		NewModel newModel = newDao.findOne(id);
		CategoryModel categoryModel = categoryDAO.findOne(newModel.getCategoryId());
		newModel.setCategoryCode(categoryModel.getCode());
        return newModel;
    }

	@Override
	public int getTotalItem(String search) {
		return newDao.getTotalItem(search);
	}
    
}
