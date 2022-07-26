package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.dao.MemberDAO;
import com.smhrd.domain.UlocationVO;


@WebServlet("/Ulocation.do")
public class UlocationController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/json;charset=utf-8");
	
	String mem_id = request.getParameter("mem_id");
	System.out.println("ajax통신 성공");
	
	System.out.println(mem_id);
	
	MemberDAO dao = new MemberDAO();
	UlocationVO vo = dao.Ulocation(mem_id);
	Gson g = new Gson();
	String json = g.toJson(vo);
	System.out.println("json성공!");
	
	// 값받아짐 확인
	System.out.println(vo.getHel_loc_lat());
	response.setContentType("text/json;charset=utf-8");
    PrintWriter out =response.getWriter();
    out.println(json);

}

}

	