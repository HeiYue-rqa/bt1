package com.xiaqing.controller.admin;

import java.io.IOException;

import com.xiaqing.constant.SystemConstant;
import com.xiaqing.model.CommentModel;
import com.xiaqing.service.ICommentService;
import com.xiaqing.utils.FormUtil;
import com.xiaqing.utils.MessageUtil;

import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/admin-comment" })
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	private ICommentService commentService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		CommentModel model = FormUtil.toModel(CommentModel.class, request);
		String view = "";
		if (model.getType().equals(SystemConstant.LIST)) {
			model.setListResult(commentService.findAll());
			view = "/WEB-INF/decorators/admin/admin.jsp?home=clist";
		} else if (model.getType().equals(SystemConstant.EDIT)) {
			  if (model.getId() != null) { model = commentService.findOne(model.getId()); }
			view = "/WEB-INF/decorators/admin/admin.jsp?home=cedit";
		}
		MessageUtil.showMessage(request);
		request.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}

