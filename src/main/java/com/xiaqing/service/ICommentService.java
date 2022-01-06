package com.xiaqing.service;

import java.util.List;

import com.xiaqing.model.CommentModel;

public interface ICommentService {
	List<CommentModel> findAll();	
	CommentModel findOne(long id);
	CommentModel save(CommentModel commentModel);
	CommentModel update(CommentModel updateComment);
	void delete(long[] ids);
	int getTotalItem();
}
