package com.psl.util;
import  java.sql.*;

public class ConnectionUtil {
	
	private static Connection connection;
	
    public static Connection createConnection(){
	try
	{
	String connectionURL = "jdbc:mysql://localhost:3306/truckline101"; 
	System.out.println(connectionURL);

	// declare a connection by using Connection interface 
	//Connection connection = null; 

	// Load JBBC driver "com.mysql.jdbc.Driver" 
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 

	/* Create a connection by using getConnection() method that takes parameters of 
	string type connection url, user name and password to connect to database. */ 
	connection = DriverManager.getConnection(connectionURL,"truckuser","truckuser");

	// check weather connection is established or not by isClosed() method 
	if(!connection.isClosed())

	System.out.println("Successfully connected to " + "MySQL server using TCP/IP...");
	//connection.close();
	}
	catch(Exception ex){
	
	System.out.println("Unable to connect to database.");
	}
	return connection;
	
    }
	
	/*public static void main(String[] args) {
		ConnectionUtil cn =new ConnectionUtil();
		cn.createConnection();
		System.out.println("connected");
	}
	
	*/
	
}
