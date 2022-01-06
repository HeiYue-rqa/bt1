package com.xiaqing.dao.impl;

import java.util.List;

import com.xiaqing.dao.IUserDAO;
import com.xiaqing.mapper.UserMapper;
import com.xiaqing.model.UserModel;

public class UserDAO extends AbstractDAO<UserModel> implements IUserDAO  {

	@Override
	public UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status) {
		StringBuilder sql = new StringBuilder("SELECT * FROM webuser AS u");
		sql.append(" INNER JOIN role AS r ON r.id = u.roleid");
		sql.append(" WHERE username = ? AND password = ? AND status = ?");
		List<UserModel> users = query(sql.toString(), new UserMapper(), userName, password, status);
		return users.isEmpty() ? null : users.get(0);
	}
	
	public static void main(String[] args) {
		UserDAO dao = new UserDAO();
		UserModel users = dao.findByUserNameAndPasswordAndStatus("xiaqing", "123456", 1);
		System.out.println(users);
	}
}
