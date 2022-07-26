package com.smhrd.module;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.dao.MemberDAO;
import com.smhrd.domain.UlocationVO;

@WebServlet("/sosAlert")
public class sosAlert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/json;charset=utf-8");
	
	int ex = Integer.parseInt(request.getParameter("ex"));
	System.out.println(ex);
	
	String shock = Integer.toString(module.shock);
	String hel_number = module.hel_number_shock;
	
	String[] list = {shock, hel_number};
	System.out.println("list목록 , shock : "+ shock + ", hel_number : "+ hel_number);
		
	PrintWriter out = response.getWriter();
	Gson g = new Gson();
	String json = g.toJson(list);
	out.print(json);
	// 임의값 넣어줌
//	int shock = 1;
//	int hel_number = 1;
	}
}
