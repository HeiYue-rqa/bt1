package com.xiaqing.controller.web;

import java.io.IOException;
import java.util.List;

import com.xiaqing.constant.SystemConstant;
import com.xiaqing.model.CommentModel;
import com.xiaqing.service.ICategoryService;
import com.xiaqing.service.ICommentService;
import com.xiaqing.sort.Comparator;
import com.xiaqing.utils.FormUtil;
import com.xiaqing.utils.MessageUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/trang-comment" })
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	private ICommentService commentService;
	
	@Inject
	private ICategoryService categoryService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		CommentModel model = FormUtil.toModel(CommentModel.class, request);
		String view = "/WEB-INF/decorators/web/web.jsp?home=tuvan";
		if (model.getId() != null) { model = commentService.findOne(model.getId()); }
		MessageUtil.showMessage(request);

		List<CommentModel> list = commentService.findAll();
		Comparator.reverse(list);
		request.setAttribute("categories", categoryService.findAll());
		request.setAttribute(SystemConstant.MODEL, model);
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
