package com.xiaqing.service;

import java.util.List;

import com.xiaqing.model.NewModel;

public interface INewService {
	List<NewModel> findAll();
	List<NewModel> findSome(String search);
	List<NewModel> findByCategoryId(Long categoryId);
	NewModel findOne(long id);
	NewModel save(NewModel newModel);
	NewModel update(NewModel updateNew);
	void delete(long[] ids);
	int getTotalItem();
	int getTotalItem(String search);
}
