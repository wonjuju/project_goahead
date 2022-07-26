package com.smhrd.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.controller.Controller;

@SuppressWarnings("serial")
@WebServlet("*.do")
public class MemberFrontController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String reqUrl = request.getRequestURI();
		String ctx = request.getContextPath();
		String command = reqUrl.substring(ctx.length());
		
		Controller controller = null;
		String view = null;
		
		HandlerMapping mappings=new HandlerMapping();
		controller=mappings.getController(command);
		view=controller.execute(request, response);
		
		if (view != null) {
			if (view.indexOf("redirect:/") != -1) {
				response.sendRedirect(view.split(":/")[1]); // redirect:/boardList.do
			} else {
				RequestDispatcher rd = request.getRequestDispatcher(ViewResolver.makeView(view));
				rd.forward(request, response);
			}
		}
	}
}
		
		
		
		
		
	
