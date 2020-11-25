package com.atma.ui;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutS extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
	
		try {
		HttpSession session=req.getSession();
		session.removeAttribute("regid");
		
		session.removeAttribute("admin");
		res.sendRedirect("Login_v19/index.html");
		}
		catch(Exception e){
			System.out.println(e);
			res.sendRedirect("Login_v19/index.html");
			
		}
		
		
	}

}
