package com.atma.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

public class FilterAndOtherDAO {
	public LinkedList<String> getTourid(String cat,String costlb,String costub,String numOfDays,String rating) {
		try {
			String url = "jdbc:mysql://localhost:3305/atma";
			String uname = "####";
			String pwd = "####";

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, uname, pwd);
			String query = "select tourid from tours where category=? and (cost between ? and ? ) and numofdays"+numOfDays+" and rating=?";
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1,cat);
			st.setInt(2,Integer.parseInt(costlb));
			st.setInt(3,Integer.parseInt(costub));
			st.setString(4,rating);
			
			
			ResultSet r = st.executeQuery();
			LinkedList<String> l=new LinkedList<String>();
			
			while(r.next()) {
				l.add(r.getString("tourid"));
			}
			System.out.println("filters got");
			st.close();
			con.close();
			r.close();
			return l;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("Error in geting filter");
		}
		return null;
	}
	
	//to check
	public static void main(String[] args) {
		FilterAndOtherDAO f=new FilterAndOtherDAO();
		LinkedList<String> l=f.getTourid("Heritage","500","1000","<=3","4");
		System.out.println(" size:"+l.size());
		if(l.size()>0)
		{
		System.out.println("111");
		for(String i:l)
		{
			System.out.println(i);
			//System.out.println("111");
		}
		}
		else {
			System.out.println("No");
		}
		
		
	}
}
