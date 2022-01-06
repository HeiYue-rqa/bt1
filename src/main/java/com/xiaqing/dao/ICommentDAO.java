package com.xiaqing.dao;

import java.util.List;

import com.xiaqing.model.CommentModel;

public interface ICommentDAO {
	List<CommentModel> findAll();
	
	CommentModel findOne(Long id);

	Long save(CommentModel commentModel);

	void update(CommentModel updateComment);

	void delete(long id);

	int getTotalItem();
}
