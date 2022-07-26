package com.smhrd.module;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.moduleDAO;
import com.smhrd.domain.moduleVO;

@SuppressWarnings("serial")
@WebServlet("/moduleController")
public class moduleController extends HttpServlet {
	public static int motor = 0;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		motor = Integer.parseInt(request.getParameter("motor"));
		String hel_number = module.hel_number_gps;
		int magnetic = returnMotor.magnetic;
		
		moduleDAO dao = new moduleDAO();
		System.out.println("moduleController motor data : " + motor);
		
		if (motor == 0) {
			if (magnetic == 0) {
				dao.updateLost(hel_number);
			}
		}
		
		response.sendRedirect("returnMotor");
	}
}