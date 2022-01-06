package com.xiaqing.service.impl;

import com.xiaqing.dao.IUserDAO;
import com.xiaqing.dao.impl.UserDAO;
import com.xiaqing.model.UserModel;
import com.xiaqing.service.IUserService;

public class UserService implements IUserService {

	private IUserDAO userDAO;

	public UserService() {
		userDAO = new UserDAO();
	}
	
	@Override
	public UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status) {
		return userDAO.findByUserNameAndPasswordAndStatus(userName, password, status);
	}
	
	public static void main(String[] args) {
		UserService dao = new UserService();
		UserModel users = dao.findByUserNameAndPasswordAndStatus("xiaqing", "123456", 1);
		System.out.println(users);
	}
	
}
