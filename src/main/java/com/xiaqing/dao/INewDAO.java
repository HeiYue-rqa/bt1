package com.xiaqing.dao;

import java.util.List;

import com.xiaqing.model.NewModel;

public interface INewDAO {

	List<NewModel> findAll();
	
	List<NewModel> findSome(String search);

	List<NewModel> findByCategoryId(Long categoryId);
	
	NewModel findOne(Long id);

	Long save(NewModel newModel);

	void update(NewModel updateNew);

	void delete(long id);

	int getTotalItem();

	int getTotalItem(String search);
}
