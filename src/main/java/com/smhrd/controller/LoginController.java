package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.DAO;
import com.smhrd.domain.Member;

public class LoginController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	request.setCharacterEncoding("UTF-8");
	
	
	String mem_id = request.getParameter("mem_id");
	String mem_pw = request.getParameter("mem_pw");
	System.out.println(mem_id);
	System.out.println(mem_pw);
	Member vo = new Member(0, mem_id, mem_pw, null, null, null, null, null, null, null);		


	DAO dao= new DAO();
	Member result = dao.login(vo); 

	String moveURL = "";

	if(result != null) {
		
		HttpSession session = request.getSession();
		session.setAttribute("member", result);
		session.setAttribute("mem_id", mem_id);
		
		moveURL = "main";

	}else {
		moveURL = "login";
	}
	
		
		
	return moveURL;
}

//	if(result.getMem_num()==1) {
//moveURL = "admin_main";
//} else if(result.getMem_num()== 2){
//		moveURL = "customer_main";
//}
//}else {
//	moveURL = "login";
//}
//
	
	
}

	