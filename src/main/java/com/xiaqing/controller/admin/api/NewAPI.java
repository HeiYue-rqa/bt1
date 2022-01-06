package com.xiaqing.controller.admin.api;

import java.io.IOException;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.xiaqing.model.NewModel;
import com.xiaqing.model.UserModel;
import com.xiaqing.service.INewService;
import com.xiaqing.utils.HttpUtil;
import com.xiaqing.utils.SessionUtil;

@WebServlet(urlPatterns = {"/api-admin-new"})
public class NewAPI extends HttpServlet {
	
	@Inject
	private INewService newService;

	private static final long serialVersionUID = -915988021506484384L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		NewModel newModel =  HttpUtil.of(request.getReader()).toModel(NewModel.class);
		newModel.setCreatedBy(((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL")).getUserName());
		newModel = newService.save(newModel);
		mapper.writeValue(response.getOutputStream(), newModel);
	}
	
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		NewModel updateNew =  HttpUtil.of(request.getReader()).toModel(NewModel.class);
		updateNew.setModifiedBy(((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL")).getUserName());
		updateNew = newService.update(updateNew);
		mapper.writeValue(response.getOutputStream(), updateNew);
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		NewModel newModel =  HttpUtil.of(request.getReader()).toModel(NewModel.class);
		newService.delete(newModel.getIds());
		mapper.writeValue(response.getOutputStream(), "{}");
	}
}
