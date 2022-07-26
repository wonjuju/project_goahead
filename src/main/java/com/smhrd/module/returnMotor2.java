package com.smhrd.module; 

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@SuppressWarnings("serial")
@WebServlet("/returnMotor2")
public class returnMotor2 extends HttpServlet {
	public static int alcohol = 0;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int motor = Integer.parseInt((String)session.getAttribute("motor"));
		int mag = Integer.parseInt((String)session.getAttribute("mag"));
		
		System.out.println(motor);
		System.out.println(mag);
		
		
		//if(request.getParameter("alcohol") != null) {
		//	alcohol = Integer.parseInt(request.getParameter("alcohol"));
//		    System.out.println(alcohol);
	//}
	//	System.out.println(module.press);
	//	PrintWriter out = response.getWriter();
		
		//if (module.press > 10&&motor==1) {
		//	out.println("1");
			//System.out.println("presson");
	//	} else if(motor==0) {
	//		out.println("2");
//			System.out.println("pressoff");
	//	} else {
		//	out.println("0");
//		//	System.out.println("pressoff");
//		}
	}
}