package com.smhrd.frontcontroller;

public class ViewResolver {
	public static String makeView(String viewname) {
		return "appkit-landing-v2.3/"+viewname+".jsp";	
	}
}
