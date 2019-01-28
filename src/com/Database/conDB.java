package com.Database;
import java.sql.*;
public class conDB 
{
	private Connection conn;
	public int connectDB()
	{
		try
		{
			String host = "localhost:3306";
			String database = "registration";
			String user = "root";
			String password="root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn =  DriverManager.getConnection("jdbc:mysql://"+host+"/"+database+"?user="+user+"&password="+password);
			System.out.println("OK");
			return 1;
		}catch(Exception e)
		{
		    e.printStackTrace();
			return -1;
		}
	}
}

