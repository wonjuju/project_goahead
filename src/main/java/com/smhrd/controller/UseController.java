package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import com.google.gson.Gson;
import com.smhrd.dao.MemberDAO;
import com.smhrd.dao.UseDAO;
import com.smhrd.domain.HelmetVO;
import com.smhrd.domain.UlocationVO;
import com.smhrd.domain.UseVO;
import com.smhrd.module.module;

@WebServlet("/use.do")
public class UseController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/json;charset=utf-8");
		HttpSession session = request.getSession();
		
		String hel_number = request.getParameter("hel_num");
		String kick_number = request.getParameter("kick_num");
		String mem_id = (String)session.getAttribute("mem_id");
		
		UseDAO dao = new UseDAO();
		HelmetVO helVO = dao.startGPS(hel_number);
		
		String start_loc_lat = helVO.getHel_loc_lat();
		String start_loc_long = helVO.getHel_loc_long();
		
		UseVO vo = new UseVO(kick_number, hel_number, mem_id, start_loc_lat, start_loc_long);
		dao.useInsert(vo);

		UseVO result = dao.useList(mem_id);
		
		Gson g = new Gson();
		String json = g.toJson(result);
	    PrintWriter out =response.getWriter();
	    response.setContentType("text/json;charset=utf-8");
	    out.println(json);
	}

}


