package DAO;

import java.sql.*;

public abstract class GenericDAO 
{
	static Connection con;
	
	GenericDAO()
	{
		createConnection();	
	}
	
	void createConnection()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			String uname="root";
			String passwd="";
			String conString="jdbc:mysql://localhost/jobhive?autoReconnect=true&useSSL=false"; //check this
			try
			{
				con=DriverManager.getConnection(conString,uname,passwd);
				System.out.println("connected");
				System.out.println("Opened database successfully");
			}
			catch(SQLException e)
			{
				System.out.println(e);
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}
	
}
