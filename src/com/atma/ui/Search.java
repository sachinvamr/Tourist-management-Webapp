package com.atma.ui;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Search extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
	
		try {
			System.out.println("en");
			System.out.println(req.getParameter("search"));
		
			String s=req.getParameter("search");
			if(s.toLowerCase().equals("bangalore"))
				res.sendRedirect("blr2.jsp");
			else if(s.toLowerCase().equals("chennai"))
				res.sendRedirect("Chennai2.jsp");
			else if(s.toLowerCase().equals("delhi"))
				res.sendRedirect("Delhi2.jsp");
			else if(s.toLowerCase().equals("delhi"))
				res.sendRedirect("Kolkata2.jsp");
			else if(s.toLowerCase().equals("mumbai"))
				res.sendRedirect("Mumbai2.jsp");
			else if(s.toLowerCase().equals("mysore"))
				res.sendRedirect("Mysore2.jsp");
			else 
				res.sendRedirect("index2.jsp");

		
		}
		catch(Exception e){
			System.out.println(e);
			res.sendRedirect("blr2.jsp");
			
		}
		
		
	}

}
