package com.xiaqing.controller.admin;

import java.io.IOException;

import com.xiaqing.service.ICommentService;
import com.xiaqing.service.INewService;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HomeController
 */

@WebServlet(urlPatterns = {"/admin-home"})
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private INewService newService;
	
	@Inject
	private ICommentService commentService;
       
        @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("ncount", newService.getTotalItem());
        request.setAttribute("ccount", commentService.getTotalItem());
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/decorators/admin/admin.jsp");
		rd.forward(request, response);
	}

        @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
