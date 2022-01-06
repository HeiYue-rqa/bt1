package com.xiaqing.dao.impl;

import java.util.List;

import com.xiaqing.dao.ICommentDAO;
import com.xiaqing.mapper.CommentMapper;
import com.xiaqing.model.CommentModel;
import com.xiaqing.model.NewModel;

public class CommentDAO extends AbstractDAO<NewModel> implements ICommentDAO{
	@Override
	public List<CommentModel> findAll() {
		String sql = "SELECT * FROM comment";
		return query(sql, new CommentMapper());
	}
	
	@Override
	public CommentModel findOne(Long id) {
		String sql = "SELECT * FROM comment WHERE id = ?";
		List<CommentModel> comment = query(sql, new CommentMapper(), id);
		return comment.isEmpty() ? null : comment.get(0);
	}
	
	@Override
	public Long save(CommentModel commentModel) {
		StringBuilder sql = new StringBuilder("INSERT INTO comment (question,");
		sql.append(" createddate, createdby)");
		sql.append(" VALUES(?, ?, ?)");
		return insert(sql.toString(), commentModel.getQuestion(),
				commentModel.getCreatedDate(), commentModel.getCreatedBy());
	}

	@Override
	public void update(CommentModel updateComment) {
		StringBuilder sql = new StringBuilder("UPDATE comment SET answer = ?,");
		sql.append(" createddate = ?, createdby = ?, modifieddate = ?, modifiedby = ? WHERE id = ?");
		update(sql.toString(), updateComment.getAnswer(), updateComment.getCreatedDate(), 
				updateComment.getCreatedBy(), updateComment.getModifiedDate(), 
				updateComment.getModifiedBy(), updateComment.getId());
	}

	@Override
	public void delete(long id) {
		String sql = "DELETE FROM comment WHERE id = ?";
		update(sql, id);
	}

	@Override
	public int getTotalItem() {
		String sql = "SELECT count(*) FROM comment";
		return count(sql);
	}
	
}
