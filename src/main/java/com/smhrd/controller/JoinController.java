package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.DAO;
import com.smhrd.domain.Member;

public class JoinController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		String mem_name = request.getParameter("mem_name");
		String mem_gender = request.getParameter("mem_gender");
		String mem_blood = request.getParameter("mem_blood");
		String mem_phone = request.getParameter("mem_phone");
		String mem_subphone = request.getParameter("mem_subphone");
		String mem_birth = request.getParameter("mem_birth");
		String drivenum = request.getParameter("drivenum");
		
		Member vo = new Member(0, mem_id, mem_pw, mem_name, mem_gender, mem_blood, mem_phone, mem_subphone, mem_birth, drivenum);
		DAO dao = new DAO();
		
		int row = dao.Join(vo);
		
		request.setAttribute("mem_id", mem_id);
		
		return "join_success";	
		
	}
}

		