package com.atma.ui;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.atma.database.AdminDAO;
import com.atma.database.AdminDAO.Bookd;

public class AdminMonthlyYearly extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String join1 = "<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n"
				+ "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n" + "<style>\r\n"
				+ ".button {\r\n" + "  border-radius: 4px;\r\n" + "  background-color:	#0000FF;\r\n"
				+ "  border: none;\r\n" + "  color: #FFFFFF;\r\n" + "  text-align: center;\r\n"
				+ "  font-size: 20px;\r\n" + "  padding: 20px;\r\n" + "  width: 200px;\r\n"
				+ "  transition: all 0.5s;\r\n" + "  cursor: pointer;\r\n" + "  margin: 5px;\r\n" + "}\r\n" + "\r\n"
				+ ".button span {\r\n" + "  cursor: pointer;\r\n" + "  display: inline-block;\r\n"
				+ "  position: relative;\r\n" + "  transition: 0.5s;\r\n" + "}\r\n" + "\r\n"
				+ ".button span:after {\r\n" + "  content: '\\00bb';\r\n" + "  position: absolute;\r\n"
				+ "  opacity: 0;\r\n" + "  top: 0;\r\n" + "  right: -20px;\r\n" + "  transition: 0.5s;\r\n" + "}\r\n"
				+ "\r\n" + ".button:hover span {\r\n" + "  padding-right: 25px;\r\n" + "}\r\n" + "\r\n"
				+ ".button:hover span:after {\r\n" + "  opacity: 1;\r\n" + "  right: 0;\r\n" + "}\r\n" + "\r\n"
				+ "h2\r\n" + "{\r\n" + "	font-size: 40px;\r\n" + "	margin: 5px;\r\n" + "    color:red;\r\n"
				+ "    padding-bottom:50px;\r\n" + "}\r\n" + "</style>\r\n" + "</head>\r\n" + "<body>\r\n" + "\r\n"
				+ "<h2>Invalid!!! ";
		String join2 = "</h2>\r\n" + "\r\n"
				+ "<a href=\"chart2.jsp\"><button class=\"button\"><span>Enter Again </span></button></a>\r\n"
				+ "</body>\r\n" + "</html>";
		PrintWriter out = res.getWriter();
		try {
			out.println(join1);
			if (req.getParameter("year") == "" && req.getParameter("month") == "") {
				out.println(" Year,Month.");
				out.println(".");
				out.println(join2);
			} else if (req.getParameter("month") != null || req.getParameter("year") != null) {

				if (req.getParameter("month") != null) {
					AdminDAO a = new AdminDAO();
					String month = req.getParameter("month");
					LinkedList<Bookd> m = a.getBookdMonthly(month + "%");
					HttpSession session = req.getSession();
					session.setAttribute("monthly", m);
					System.out.println("M Confirmed");
				}
				if (req.getParameter("year") != null) {
					AdminDAO a = new AdminDAO();
					String year = req.getParameter("year");
					LinkedList<Bookd> y = a.getBookdMonthly(year + "%");
					HttpSession session = req.getSession();
					session.setAttribute("yearly", y);
					System.out.println("Y Confirmed");
				}
				res.sendRedirect("chart2.jsp");
			}
			else {
				out.println(join1);
				out.println("Inputs");
				out.println(".");
				out.println(join2);
			}
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Error occured");
			System.out.println("44");
			out.println(join1);
			out.println("Inputs");
			out.println(".");
			out.println(join2);
		}

	}

}
