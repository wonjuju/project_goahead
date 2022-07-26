package com.smhrd.module;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.moduleDAO;
import com.smhrd.domain.moduleVO;

@WebServlet("/module")
public class module extends HttpServlet {

	public static String hel_number_gps ="";
	public static String hel_number_shock ="";
	public static int press = 1;
	public static String gps_lat= "";
	public static String gps_long = "";
	public static int shock= 0;

	moduleDAO dao = new moduleDAO();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//자이로
		if(request.getParameter("shock") != null) {
			shock = Integer.parseInt(request.getParameter("shock"));
			hel_number_shock = request.getParameter("helmetNum1");
			System.out.println("shock:"+shock);
			System.out.println("helmetNum1:"+hel_number_shock);
			
		}
		// GPS 위도
		if(request.getParameter("gps_lat") != null&&request.getParameter("gps_long") != null) {
			
			gps_lat = request.getParameter("gps_lat");
			gps_long = request.getParameter("gps_long");
			System.out.println("gps,압력 wifi 연결중");
			if(!gps_lat.equals("")&&!gps_long.equals("")) {
				System.out.println("gps_lat:"+gps_lat);
				System.out.println("gps_long:"+gps_long);
				hel_number_gps = request.getParameter("helmetNum");
				moduleVO gps_vo = new moduleVO(hel_number_gps,gps_lat,gps_long);
				dao.updateGPS(gps_vo);
				System.out.println(" GPS DB저장 완료");
			}
		}

		// 압력 센서
		if(request.getParameter("press") != null) {
			press = Integer.parseInt(request.getParameter("press"));
			System.out.println("press: " +press);
		}
		
	
	}
}