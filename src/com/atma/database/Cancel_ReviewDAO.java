package com.atma.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.LinkedList;

public class Cancel_ReviewDAO {

	public void cancelTour(String tourid, String regid, String reason) {
		try {
			String url = "jdbc:mysql://localhost:3305/atma";
			String uname = "####";
			String pwd = "####";

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, uname, pwd);
			String query = "insert into cancellation values (?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(query);

			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
			LocalDateTime now = LocalDateTime.now();  
			System.out.println(dtf.format(now));  
			
			// cancelid,reason,refstatus,regid3,tourid3;
			st.setString(1, dtf.format(now) + "." + tourid);
			st.setString(2, reason);
			st.setInt(3, 0);// admin can change
			st.setString(4, regid);
			st.setString(5, tourid);

			int r = st.executeUpdate();
			System.out.println(r + " rows affected");

			st.close();
			con.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("Error in cancelling tour");
		}
	}

	public void storeReview(String tourid2, String regid2, String feedback, int rating) {
		try {
			String url = "jdbc:mysql://localhost:3305/atma";
			String uname = "####";
			String pwd = "####";

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, uname, pwd);
			String query = "insert into review values (?,?,?,?)";
			PreparedStatement st = con.prepareStatement(query);

			// reviewid,feedback,regid2,tourid2
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
			LocalDateTime now = LocalDateTime.now();
			String temp = tourid2 + dtf.format(now) + "." + rating;
			System.out.println("en");
			if (temp.length() < 50) {
				st.setString(1, temp);
			} else {
				st.setString(1, temp.substring(0, 50));
			}
			System.out.println("en");
			st.setString(2, feedback);
			st.setString(3, regid2);
			st.setString(4, tourid2.substring(0,tourid2.indexOf(".",tourid2.indexOf(".")+1)));

			int r = st.executeUpdate();
			System.out.println(r + " rows affected");

			st.close();
			con.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("Error in storing review");
		}
	}

	public void updateStatus(String bookingid) {
		try {
			String url = "jdbc:mysql://localhost:3305/atma";
			String uname = "####";
			String pwd = "####";

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, uname, pwd);
			String query = "update booking set status=2 where bookingid=?";
			PreparedStatement st = con.prepareStatement(query);

			// cancelid,reason,refstatus,regid3,tourid3;
			st.setString(1, bookingid);

			int r = st.executeUpdate();
			System.out.println(r + " rows affected");

			st.close();
			con.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("Error in updating status");
		}
	}

	public LinkedList<String> getComment(String tourid) {
		try {
			String url = "jdbc:mysql://localhost:3305/atma";
			String uname = "####";
			String pwd = "####";

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, uname, pwd);
			String query = "select feedback from review where tourid2 like ? ;";
			PreparedStatement st = con.prepareStatement(query);

			st.setString(1, tourid);
			ResultSet r = st.executeQuery();
			
			LinkedList<String> l=new LinkedList<String>();
			while(r.next())
			{
				l.add(r.getString("feedback"));
			}
			System.out.println("feedback collected");

			st.close();
			con.close();
			return l;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("Error in collecting feedback");
		}
		return null;
	}

	// to check
	public static void main(String[] args) {
		// cancelid,reason,refstatus,regid3,tourid3;
		//DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		//LocalDateTime now = LocalDateTime.now();

		
		// '%Chennai%'
		// String temp=tourid2+dtf.format(now);
		Cancel_ReviewDAO c=new Cancel_ReviewDAO();
		LinkedList<String> f=c.getComment("%Chennai%");
		System.out.println(f.get(0));
		
		// c.storeReview("Chennai.Mahabalipuram","sachinvermaboss@gmail.com.12349999","i
		// enjoyed a lot");
	}

}
