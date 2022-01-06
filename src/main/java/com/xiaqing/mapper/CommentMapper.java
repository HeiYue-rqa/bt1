package com.xiaqing.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.xiaqing.model.CommentModel;

public class CommentMapper implements RowMapper<CommentModel> {

	@Override
	public CommentModel mapRow(ResultSet resultSet) {
		try {
			CommentModel comment = new CommentModel();
			comment.setId(resultSet.getLong("id"));
			comment.setQuestion(resultSet.getString("question"));
			comment.setAnswer(resultSet.getString("answer"));
			comment.setCreatedDate(resultSet.getDate("createddate"));
			comment.setCreatedBy(resultSet.getString("createdby"));
			if (resultSet.getDate("modifieddate") != null) {
				comment.setModifiedDate(resultSet.getDate("modifieddate"));
			}
			if (resultSet.getString("modifiedby") != null) {
				comment.setModifiedBy(resultSet.getString("modifiedby"));
			}
			return comment;
		} catch (SQLException e) {
			return null;
		}	
	}
}
