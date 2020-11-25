package com.atma.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

public class AdminDAO {

	public LinkedList<Bookd> getBookingInfo() {
		try {
			String url = "jdbc:mysql://localhost:3305/atma";
			String uname = "####";
			String pwd = "####";

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, uname, pwd);
			String query = "select * from booking";
			PreparedStatement st = con.prepareStatement(query);

			ResultSet r = st.executeQuery();

			// bookid,totalcost,bookdate,status,memebers,transmode
			// tourid,regid
			LinkedList<Bookd> l = new LinkedList<Bookd>();
			while (r.next()) {
				Bookd b = new Bookd(r.getString("Bookingid"), r.getString("bookdate"), r.getString("transmode"),
						r.getString("regid"), r.getString("tourid"), r.getInt("totalcost"), r.getInt("status"),
						r.getInt("members"));
				l.add(b);
			}
			System.out.println("Fetched booking details");
			r.close();
			st.close();
			con.close();
			return l;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("Error in fetching booking data");
		}
		return null;
	}

	public int updateConfirm(int status, String date1, String date2) {
		try {
			String url = "jdbc:mysql://localhost:3305/atma";
			String uname = "####";
			String pwd = "####";

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, uname, pwd);
			String query = "update booking set status=? where status=0 and (bookdate between ? and ? )";
			PreparedStatement st = con.prepareStatement(query);
			st.setInt(1, status);
			st.setString(2, date1);
			st.setString(3, date2);
			int r = st.executeUpdate();
			System.out.println(r + " rows affected");

			st.close();
			con.close();
			return r;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("Error in updating status");
		}
		return 0;
	}

	public String getType(String email) {
		try {
			String url = "jdbc:mysql://localhost:3305/atma";
			String uname = "####";
			String pwd = "####";

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, uname, pwd);
			String query = "select type from user where email=? ";
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, email);
			ResultSet r = st.executeQuery();
			String t = null;
			if (r.next()) {
				t = r.getString("type");
				System.out.println("type : " + t);
			}
			System.out.println("Got type");
			st.close();
			con.close();
			return t;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("Error in getting user type");
		}
		return null;
	}

	public LinkedList<Bookd> getBookdMonthly(String date) {
		try {
			String url = "jdbc:mysql://localhost:3305/atma";
			String uname = "####";
			String pwd = "####";

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, uname, pwd);
			String query = "select * from booking where  bookdate like ?";
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, date);
			ResultSet r = st.executeQuery();

			LinkedList<Bookd> l = new LinkedList();
			while (r.next()) {

				Bookd b = new Bookd(r.getString("Bookingid"), r.getString("bookdate"), r.getString("transmode"),
						r.getString("regid"), r.getString("tourid"), r.getInt("totalcost"), r.getInt("status"),
						r.getInt("members"));
				l.add(b);

			}
			System.out.println("Fetched monthly data");
			r.close();
			st.close();
			con.close();
			return l;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("Error in getting monthly data");
		}
		return null;
	}

	public int[] getChartData() {
		try {
			String url = "jdbc:mysql://localhost:3305/atma";
			String uname = "####";
			String pwd = "####";

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, uname, pwd);

			String query1 = "select sum(totalcost) from booking where bookingid like '%Chennai%' and status=1";
			PreparedStatement st1 = con.prepareStatement(query1);
			ResultSet r1 = st1.executeQuery();

			String query2 = "select sum(totalcost) from booking where bookingid like '%Delhi%' and status=1";
			PreparedStatement st2 = con.prepareStatement(query2);
			ResultSet r2 = st2.executeQuery();

			String query3 = "select sum(totalcost) from booking where bookingid like '%Kolkata%'   and status=1";
			PreparedStatement st3 = con.prepareStatement(query3);
			ResultSet r3 = st3.executeQuery();

			String query4 = "select sum(totalcost) from booking where bookingid like '%Mysore%'  and status=1";
			PreparedStatement st4 = con.prepareStatement(query4);
			ResultSet r4 = st4.executeQuery();

			String query5 = "select sum(totalcost) from booking where bookingid like '%Mumbai%' and status=1";
			PreparedStatement st5 = con.prepareStatement(query5);
			ResultSet r5 = st5.executeQuery();

			String query6 = "select sum(totalcost) from booking where bookingid like '%Bangalore%' and status=1;";
			PreparedStatement st6 = con.prepareStatement(query6);
			ResultSet r6 = st6.executeQuery();

			int[] a = new int[6];

			// 1
			if (r1.next()) {
				a[0] = r1.getInt("sum(totalcost)");
			} else {
				a[0] = 0;
			}

			// 2
			if (r2.next()) {
				a[1] = r2.getInt("sum(totalcost)");
			} else {
				a[1] = 0;
			}

			// 3
			if (r3.next()) {
				a[2] = r3.getInt("sum(totalcost)");
			} else {
				a[2] = 0;
			}

			// 4
			if (r4.next()) {
				a[3] = r4.getInt("sum(totalcost)");
			} else {
				a[3] = 0;
			}

			// 5
			if (r5.next()) {
				a[4] = r5.getInt("sum(totalcost)");
			} else {
				a[4] = 0;
			}

			// 6
			if (r6.next()) {
				a[5] = r6.getInt("sum(totalcost)");
			} else {
				a[5] = 0;
			}

			System.out.println("Fetched data for bar chart ");
			r1.close();
			st1.close();
			r2.close();
			st2.close();
			r3.close();
			st3.close();
			r4.close();
			st4.close();
			r5.close();
			st5.close();
			r6.close();
			st6.close();
			con.close();
			return a;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("Error in fetching totalcost for bar chart");
		}
		return null;
	}

	public LinkedList<cancel> getReasons() {
		try {
			String url = "jdbc:mysql://localhost:3305/atma";
			String uname = "####";
			String pwd = "####";

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, uname, pwd);
			String query = "select * from cancellation";
			PreparedStatement st = con.prepareStatement(query);
			ResultSet r = st.executeQuery();

			LinkedList<cancel> l = new LinkedList<cancel>();
			while (r.next()) {
				cancel c = new cancel(r.getString("cancelid"), r.getString("reason"), r.getString("refstatus"),
						r.getString("regid3"), r.getString("tourid3"));
				l.add(c);
			}

			System.out.println("Fetched cancellation data");
			r.close();
			st.close();
			con.close();
			return l;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("Error in getting cancellation data");
		}
		return null;
	}

	public LinkedList<agency> getDataAgency() {
		try {
			String url = "jdbc:mysql://localhost:3305/atma";
			String uname = "####";
			String pwd = "####";

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, uname, pwd);
			String query = "select * from agencyrecord";
			PreparedStatement st = con.prepareStatement(query);
			ResultSet r = st.executeQuery();

			LinkedList<agency> l = new LinkedList<agency>();
			while (r.next()) {
				agency c = new agency(r.getString("recordid"), r.getDouble("outcash"), r.getDouble("turnover"),
						r.getString("tourid5"));
				l.add(c);
			}

			System.out.println("Fetched agency record");
			r.close();
			st.close();
			con.close();
			return l;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("Error in fetching agency record");
		}
		return null;
	}

	// for checking
	public static void main(String[] args) {
		AdminDAO a = new AdminDAO();
		LinkedList<agency> l = a.getDataAgency();

		System.out.println(l.get(0).outcash);
		System.out.println(l.get(1).recordid);

	}

	public class agency {
		public String recordid, tourid5;
		public Double outcash, turnover;

		public agency(String recordid, Double outcash, Double turnover, String tourid5) {
			super();
			this.recordid = recordid;
			this.outcash = outcash;
			this.turnover = turnover;
			this.tourid5 = tourid5;
		}

	}

	public class cancel {
		public String cancelid, reason, refstatus, regid3, tourid3;

		public cancel(String cancelid, String reason, String refstatus, String regid3, String tourid3) {
			super();
			this.cancelid = cancelid;
			this.reason = reason;
			this.refstatus = refstatus;
			this.regid3 = regid3;
			this.tourid3 = tourid3;
		}

	}

	public class Bookd {
		public String bookingid, bookdate, transmode, regid, tourid;
		public int totalcost, status, memebers;

		public Bookd(String bookingid, String bookdate, String transmode, String regid, String tourid, int totalcost,
				int status, int memebers) {
			super();
			this.bookingid = bookingid;
			this.bookdate = bookdate;
			this.transmode = transmode;
			this.regid = regid;
			this.tourid = tourid;
			this.totalcost = totalcost;
			this.status = status;
			this.memebers = memebers;
		}

	}

}
