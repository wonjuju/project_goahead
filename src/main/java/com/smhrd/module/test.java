package com.smhrd.module;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.frontcontroller.ViewResolver;


@WebServlet("/test")
public class test extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Object[] String = null;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	int shock = 10;
	int hel_num = 1;
	
	int[] list = new int[2];

	RequestDispatcher rd = request.getRequestDispatcher("");
	rd.forward(request, response);
//	Gson g = new Gson();
//	String json = g.toJson(list);
//	System.out.println("json성공!");
	
	}

}
