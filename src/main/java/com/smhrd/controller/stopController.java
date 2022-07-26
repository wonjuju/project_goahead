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
import com.smhrd.dao.UseDAO;
import com.smhrd.domain.HelmetVO;
import com.smhrd.domain.UseVO;


@WebServlet("/stop.do")
public class stopController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/json;charset=utf-8");
		
		String mem_id = request.getParameter("mem_id");
		
		UseDAO dao = new UseDAO();
		UseVO result = dao.useList(mem_id);
		
		String hel_number = result.getHel_number();
		HelmetVO helVO = dao.startGPS(hel_number);
		
		int use_number = result.getUse_number();
		String end_loc_lat = helVO.getHel_loc_lat();
		String end_loc_long = helVO.getHel_loc_long();
		
		UseVO vo = new UseVO(use_number, end_loc_lat, end_loc_long);
		dao.stopGPS(vo);
		
		int row = dao.stop(mem_id);
		
		System.out.println("stopController json성공!");
	    PrintWriter out =response.getWriter();
	    response.setContentType("text/json;charset=utf-8");
	    out.println(row);
	}

}
