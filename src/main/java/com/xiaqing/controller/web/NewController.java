package com.xiaqing.controller.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xiaqing.constant.SystemConstant;
import com.xiaqing.model.NewModel;
import com.xiaqing.service.ICategoryService;
import com.xiaqing.service.INewService;
import com.xiaqing.utils.FormUtil;

	@WebServlet(urlPatterns = {"/trang-new"})
	public class NewController extends HttpServlet {
		private static final long serialVersionUID = 1L;
	       
		@Inject
		private ICategoryService categoryService;
		
		@Inject
		private INewService newService;
		
        @Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        	request.setCharacterEncoding("UTF-8");
        	NewModel model = FormUtil.toModel(NewModel.class, request);
			String view = "";
			String action = request.getParameter("action");
			if (action != null && action.equals("read")) {
				String read = request.getParameter("submitRead");
				Long id = Long.parseLong(read);
				NewModel readNew = newService.findOne(id);
				request.setAttribute("readNew", readNew);
				request.setAttribute("categories", categoryService.findAll());
				view = "/WEB-INF/decorators/web/web.jsp?home=blog";
				RequestDispatcher rd = request.getRequestDispatcher(view);
				rd.forward(request, response);
			} else {
				if (action != null && action.equals("search")) {
					model.setListResult(newService.findSome(model.getSearch()));
				} else if (action != null && action.equals("find")) {
					String find = request.getParameter("submitFind");
					Long cId = Long.parseLong(find);
					model.setListResult(newService.findByCategoryId(cId));
				} else if (action == null) {
					model.setListResult(newService.findAll());
				}
				
				if(model.getListResult().size() == 0) {
					view = "/WEB-INF/decorators/web/web.jsp?home=notfound";
				} else {
					List<NewModel> list = model.getListResult();
					List<Long> longs = new ArrayList<>();
					for(int i = 0; i < list.size(); i++) {
						longs.add(list.get(i).getId());
					}
					Long maxId = Collections.max(longs).longValue();
					NewModel maxNew = newService.findOne(maxId);
					request.setAttribute("maxNew", maxNew);
					view = "/WEB-INF/decorators/web/web.jsp?home=benhly";
				}
				
				request.setAttribute(SystemConstant.MODEL, model);
				request.setAttribute("categories", categoryService.findAll());
				RequestDispatcher rd = request.getRequestDispatcher(view);
				rd.forward(request, response);
			}
		}

	        @Override
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			doGet(request, response);
		}

	}
