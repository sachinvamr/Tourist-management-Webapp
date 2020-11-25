package com.atma.ui;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.atma.database.BookingDAO;

public class Booking extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
		// bookingid,totalcost,bookdate,status,memebers,tourid,regid
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
				+ "<h2>Invalid!!!";
		String join2 = "</h2>\r\n" + "\r\n"
				+ "<a href=\"Tours2.jsp\"><button class=\"button\"><span>Enter Again </span></button></a>\r\n"
				+ "</body>\r\n" + "</html>";
		
		
		PrintWriter out = res.getWriter();
		try {
			
			if (req.getParameter("start") == "" || req.getParameter("select") == ""
					|| req.getParameter("mode") == "") {

				out.println(join1);
				if (req.getParameter("start") == "") {
					out.println("Start Date,");
				}
				out.println(".");
				out.println(join2);

			} else {

				HttpSession session = req.getSession();
				String tourid = (String) session.getAttribute("tourid");
				String date = req.getParameter("start");
				
				String numOfMembers = req.getParameter("select");
				String modeOfTransport = req.getParameter("mode");
				
				String regid = (String) session.getAttribute("regid");
				System.out.println(regid + " " + tourid);
				//session.removeAttribute("tourid");
				
				BookingDAO b = new BookingDAO();

				
				double cost = b.getInfoTour(tourid);

				if (modeOfTransport.compareTo("Car") == 0)
					cost = cost * 1.5 * Integer.parseInt(numOfMembers);
				else if (modeOfTransport.compareTo("Train") == 0)
					cost = cost * 1.25 * Integer.parseInt(numOfMembers);
				else if (modeOfTransport.compareTo("Flight") == 0)
					cost = cost * 2 * Integer.parseInt(numOfMembers);
				
				
				
				boolean i = b.reduceSeat(Integer.parseInt(numOfMembers), tourid);

				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
				LocalDateTime now = LocalDateTime.now();  
				
				if (i != false) {
					
					send s=new send(date,""+cost+"",numOfMembers,modeOfTransport);
					session.setAttribute("temp",s);
					String confirm="<!DOCTYPE html>\r\n" + 
							"<html>\r\n" + 
							"<head>\r\n" + 
							"<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"><title>Confirm Booking</title>\r\n" + 
							"<style>\r\n" + 
							"body {\r\n" + 
							"  font-family: Arial, Helvetica, sans-serif;\r\n" + 
							"  background-color: black;\r\n" + 
							"}\r\n" + 
							"\r\n" + 
							"* {\r\n" + 
							"  box-sizing: border-box;\r\n" + 
							"}\r\n" + 
							"\r\n" + 
							"/* Add padding to containers */\r\n" + 
							".container {\r\n" + 
							"  padding: 16px;\r\n" + 
							"  background-color: white;\r\n" + 
							"}\r\n" + 
							"\r\n" + 
							"input[type=text]{\r\n" + 
							"  width: 100%;\r\n" + 
							"  text-color:white;\r\n" + 
							"  padding: 15px;\r\n" + 
							"  margin: 5px 0 22px 0;\r\n" + 
							"  display: inline-block;\r\n" + 
							"  border: none;\r\n" + 
							"  background: #f1f1f1;\r\n" + 
							"}\r\n" + 
							"\r\n" + 
							"::placeholder{\r\n" + 
							"color:black;\r\n" + 
							"}\r\n" + 
							"\r\n" + 
							"hr {\r\n" + 
							"  border: 1px solid #f1f1f1;\r\n" + 
							"  margin-bottom: 25px;\r\n" + 
							"}\r\n" + 
							"\r\n" + 
							".registerbtn {\r\n" + 
							"  background-color: #4CAF50;\r\n" + 
							"  color: white;\r\n" + 
							"  padding: 16px 20px;\r\n" + 
							"  margin: 8px 0;\r\n" + 
							"  border: none;\r\n" + 
							"  cursor: pointer;\r\n" + 
							"  width: 100%;\r\n" + 
							"  opacity: 0.9;\r\n" + 
							"}\r\n" + 
							"\r\n" + 
							".registerbtn:hover {\r\n" + 
							"  opacity: 1;\r\n" + 
							"}\r\n" + 
							"\r\n" + 
							"</style>\r\n" + 
							"</head>\r\n" + 
							"<body>\r\n" + 
							"\r\n" + 
							"<form action=\"cfbook\" method=\"get\">\r\n" + 
							"  <div class=\"container\">\r\n" + 
							"    <h1>Confirm Booking!</h1>\r\n" + 
							"    <hr>\r\n" + 
							"\r\n" + 
							"    <label ><b>Date</b></label>\r\n" + 
							"    <input type=\"text\" placeholder=\""
							+date+ "\" name=\"start\" "+" value=\""+date+"\" disabled>\r\n" + 
							"    <br>\r\n" + 
							"\r\n" + 
							"    <label ><b>TotalCost</b></label>\r\n" + 
							"    <input type=\"text\" placeholder=\""
							+cost+ "\" name=\"cost\" "+" value=\""+cost+"\" disabled>\r\n" +
							"    <br>\r\n" + 
							"    \r\n" + 
							"     <label ><b>Number of Members</b></label>\r\n" + 
							"    <input type=\"text\" placeholder=\""
							+numOfMembers+ "\" name=\"select\" "+" value=\""+numOfMembers+"\" disabled>\r\n" + 
							"    \r\n" + 
							"     <label ><b>Mode of Transport</b></label>\r\n" + 
							"    <input type=\"text\" placeholder=\""
							+modeOfTransport+ "\" name=\"mode\"  "+" value=\""+modeOfTransport+"\" disabled>\r\n" +
							"\r\n" + 
							"   <input type=\"submit\" name=\"Book\" class=\"registerbtn\" />\r\n" + 
							"  </div>\r\n" + 
							"  \r\n" + 
							"</form>\r\n" + 
							"\r\n" + 
							"</body>\r\n" + 
							"</html>\r\n" + 
							"";
					out.println(confirm);
					//RequestDispatcher rd=req.getRequestDispatcher("cfbook");
					//rd.forward(req,res);
					/*
					String temp=modeOfTransport.substring(0,2) + "." +tourid+"."+dtf.format(now);
					if(temp.length()<50)
						b.book(temp , cost, date, 0, Integer.parseInt(numOfMembers),
							modeOfTransport, tourid, regid);
					else {
						b.book(temp.substring(0,50) , cost, date, 0, Integer.parseInt(numOfMembers),
								modeOfTransport, tourid, regid);
					}
					res.sendRedirect("UserDashIndex.jsp");
					*/
				} else {
					System.out.println("Not entered");
					System.out.println("Error occured");
					out.println(join1);
					out.println("Inputs or Seats are not available");
					out.println(".");
					out.println(join2);
				}

			}
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Error occured");
			out.println(join1);
			out.println("Inputs");
			out.println(".");
			out.println(join2);
		}

	}
	public class send{
		public String date,cost,nom,mot;

		public send(String date, String cost, String nom, String mot) {
			super();
			this.date = date;
			this.cost = cost;
			this.nom = nom;
			this.mot = mot;
		}
		
		
		
	}

}