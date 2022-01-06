package com.xiaqing.controller.admin;

import java.io.IOException;
import java.util.List;

import com.xiaqing.constant.SystemConstant;
import com.xiaqing.model.CategoryModel;
import com.xiaqing.model.NewModel;
import com.xiaqing.paging.PageRequest;
import com.xiaqing.paging.Pageble;
import com.xiaqing.service.ICategoryService;
import com.xiaqing.service.INewService;
import com.xiaqing.sort.Sorter;
import com.xiaqing.utils.FormUtil;
import com.xiaqing.utils.MessageUtil;

import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/admin-new" })
public class NewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	private INewService newService;

	@Inject
	private ICategoryService categoryService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		NewModel model = FormUtil.toModel(NewModel.class, request);
		String view = "";
		if (model.getType().equals(SystemConstant.LIST)) {
			model.setListResult(newService.findAll());
			List<NewModel> nlist = model.getListResult();
			List<CategoryModel> clist = categoryService.findAll();
			for(int i = 0; i < nlist.size(); i++) {
				for(int k = 0; k < clist.size(); k++) {
					if (nlist.get(i).getCategoryId() == clist.get(k).getId()) {
						nlist.get(i).setCategoryCode(clist.get(k).getCode());
					}
				}
			}
			view = "/WEB-INF/decorators/admin/admin.jsp?home=nlist";
		} else if (model.getType().equals(SystemConstant.EDIT)) {
			  if (model.getId() != null) { model = newService.findOne(model.getId()); }
			request.setAttribute("categories", categoryService.findAll());
			view = "/WEB-INF/decorators/admin/admin.jsp?home=nedit";
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
