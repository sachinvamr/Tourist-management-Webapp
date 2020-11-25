package com.atma.ui;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.atma.database.BookingDAO;
import com.atma.ui.Booking.send;

public class Confirm extends HttpServlet {
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
				+ "<h2>Invalid!!!";
		String join2 = "</h2>\r\n" + "\r\n"
				+ "<a href=\"Tours2.jsp\"><button class=\"button\"><span>Enter Again </span></button></a>\r\n"
				+ "</body>\r\n" + "</html>";

		System.out.println("reached");
		PrintWriter out = res.getWriter();
		// out.println("reached");
		try {

			HttpSession session = req.getSession();
			String tourid = (String) session.getAttribute("tourid");
			send s = (send) session.getAttribute("temp");
			String date = s.date;
			

			String numOfMembers = s.nom;
			String modeOfTransport = s.mot;
			

			String regid = (String) session.getAttribute("regid");
			
			System.out.println(regid + " " + tourid);
			session.removeAttribute("tourid");
			session.removeAttribute("temp");

			BookingDAO b = new BookingDAO();

			double cost = b.getInfoTour(tourid);

			if (modeOfTransport.compareTo("Car") == 0)
				cost = cost * 1.5 * Integer.parseInt(numOfMembers);
			else if (modeOfTransport.compareTo("Train") == 0)
				cost = cost * 1.25 * Integer.parseInt(numOfMembers);
			else if (modeOfTransport.compareTo("Flight") == 0)
				cost = cost * 2 * Integer.parseInt(numOfMembers);

			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now = LocalDateTime.now();
			String temp = modeOfTransport.substring(0, 2) + "." + tourid + "." + dtf.format(now);
			if (temp.length() < 50) {
				b.book(temp, cost, date, 0, Integer.parseInt(numOfMembers), modeOfTransport, tourid, regid);

			} else {
				b.book(temp.substring(0, 50), cost, date, 0, Integer.parseInt(numOfMembers), modeOfTransport, tourid,
						regid);
			}
			res.sendRedirect("UserDashIndex.jsp");
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Not entered");
			System.out.println("Error occured");
			out.println(join1);
			out.println("Inputs or Seats are not available");
			out.println(".");
			out.println(join2);
		}
	}
}
