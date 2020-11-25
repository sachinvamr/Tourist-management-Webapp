package com.atma.ui;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.atma.database.FilterAndOtherDAO;

public class Filter extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		try {
			String cat=req.getParameter("select");
			String cost=req.getParameter("Cost");;
			String NumberOfDays=req.getParameter("days");
			String Rating=req.getParameter("rating");
			FilterAndOtherDAO f=new FilterAndOtherDAO();
			LinkedList<String> l=f.getTourid(cat,cost.substring(0,cost.indexOf("-")),cost.substring(cost.indexOf("-")+1),NumberOfDays,Rating);
			PrintWriter out=res.getWriter();
			if(l.size()<=0)
			{
				res.sendRedirect("index2.jsp");
				
			}
			else {
				if((l.get(0)).toUpperCase().indexOf("MUMBAI")>=0)
					res.sendRedirect("Mumbai2.jsp");
				else if((l.get(0)).toUpperCase().indexOf("BANGALORE")>=0)
					res.sendRedirect("blr2.jsp");
				else if((l.get(0)).toUpperCase().indexOf("DELHI")>=0)
					res.sendRedirect("Delhi2.jsp");
				else if((l.get(0)).toUpperCase().indexOf("KOLKATA")>=0)
					res.sendRedirect("Kolkata2.jsp");
				else if((l.get(0)).toUpperCase().indexOf("MUMBAI")>=0)
					res.sendRedirect("Mumbai2.jsp");
				else if((l.get(0)).toUpperCase().indexOf("MYSORE")>=0)
					res.sendRedirect("Mysore2.jsp");
				else
					res.sendRedirect("Chennai2.jsp");
				
			}
			
			
			
		}
		catch(Exception e){
			System.out.println(e);
			res.sendRedirect("index2.jsp");
			
		}
		
		
	}
}
