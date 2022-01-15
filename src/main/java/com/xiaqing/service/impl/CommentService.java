package com.xiaqing.service.impl;

import java.sql.Date;
import java.util.List;

import com.xiaqing.dao.ICommentDAO;
import com.xiaqing.model.CommentModel;
import com.xiaqing.service.ICommentService;

import javax.inject.Inject;

public class CommentService implements ICommentService {
	
	@Inject
	private ICommentDAO commentDao;
	
	@Override
	public List<CommentModel> findAll() {
		return commentDao.findAll();
	}

	@Override
	public CommentModel save(CommentModel commentModel) {
		commentModel.setCreatedDate(new Date(System.currentTimeMillis()));
		Long commentId = commentDao.save(commentModel);
		return commentDao.findOne(commentId);
	}

	@Override
	public CommentModel update(CommentModel updateComment) {
		CommentModel oldComment = commentDao.findOne(updateComment.getId());
		updateComment.setCreatedDate(oldComment.getCreatedDate());
		updateComment.setCreatedBy(oldComment.getCreatedBy());
		updateComment.setModifiedDate(new Date(System.currentTimeMillis()));
		commentDao.update(updateComment);
		return commentDao.findOne(updateComment.getId());
	}

	@Override
	public void delete(long[] ids) {
		for (long id: ids) {
			//1.delete comment (khoa ngoai Comment_id)
			//2.delete Comments
			commentDao.delete(id);
		}
	}

	@Override
	public int getTotalItem() {
		return commentDao.getTotalItem();
	}

    @Override
    public CommentModel findOne(long id) {
		CommentModel commentModel = commentDao.findOne(id);
        return commentModel;
    }
    
}

