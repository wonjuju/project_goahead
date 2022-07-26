package com.smhrd.frontcontroller;

import java.util.HashMap;

import com.smhrd.controller.AccController;
import com.smhrd.controller.Controller;
import com.smhrd.controller.JoinController;
import com.smhrd.controller.LoginController;
import com.smhrd.controller.LogoutController;
import com.smhrd.controller.MemberlistController;
import com.smhrd.controller.UlocationController;
import com.smhrd.controller.UseController;
import com.smhrd.controller.UsinglistController;
import com.smhrd.controller.ViewBlackboxController;
import com.smhrd.controller.ViewHlocationController;
import com.smhrd.controller.FAQController;
import com.smhrd.controller.ViewJoinController;
import com.smhrd.controller.ViewLoginController;
import com.smhrd.controller.ViewMainController;
import com.smhrd.controller.ViewUlocationController;
import com.smhrd.controller.ViewUseController;
import com.smhrd.dao.moduleDAO;

public class HandlerMapping {
	private HashMap<String, Controller> mappings;
	
	public HandlerMapping() {
		
	mappings=new HashMap<String, Controller>();
	mappings.put("/join.do", new JoinController());
	mappings.put("/viewMain.do", new ViewMainController());
	mappings.put("/viewJoin.do", new ViewJoinController());
	mappings.put("/viewLogin.do", new ViewLoginController());
	mappings.put("/login.do", new LoginController());
	mappings.put("/memberlist.do", new MemberlistController());
	mappings.put("/faq.do", new FAQController());
//	mappings.put("/use.do", new UseController());
	mappings.put("/viewUse.do", new ViewUseController());
	mappings.put("/viewUlocation.do", new ViewUlocationController());
	mappings.put("/logout.do", new LogoutController());
	mappings.put("/viewHlocation.do", new ViewHlocationController());
	mappings.put("/acc.do", new AccController());
	mappings.put("/usinglist.do", new UsinglistController());
	mappings.put("/viewBlackbox.do" , new ViewBlackboxController()) ;

	}
	
	
	public Controller getController(String command) {
		return mappings.get(command);
	}

}
