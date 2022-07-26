package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.UseDAO;
import com.smhrd.domain.UseVO;


public class UsinglistController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
//		HttpSession session = request.getSession();
//		String mem_id = (String) session.getAttribute("mem_id");

		String mem_id = request.getParameter("mem_id");
		
		System.out.println(mem_id);
		
		
		UseDAO dao = new UseDAO();
		ArrayList<UseVO> list= dao.usinglist(mem_id);
		
		request.setAttribute("list", list);
		
		return "usingList";
		
	}
}

		