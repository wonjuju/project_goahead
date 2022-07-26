package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.MemberDAO;
import com.smhrd.domain.Member;


public class MemberlistController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		MemberDAO dao = new MemberDAO();
		ArrayList<Member> list = dao.getAllList();
		
		request.setAttribute("list", list);
		return "memberList";	
		
	}
}

		