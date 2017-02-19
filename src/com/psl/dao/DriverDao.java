package com.psl.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.psl.entity.TruckDriver;
import com.psl.entity.User;
import com.psl.util.ConnectionUtil;


public class DriverDao {
public DriverDao() {
	// TODO Auto-generated constructor stub
}
public int authenticateUser(String username,String password)
{
	//Session session=HibernateUtility.getSesssion();
	Boolean status=false;
	int driver_id=0;
	Connection conn = ConnectionUtil.createConnection();
	//Query query=session.createQuery("from User where username='"+username+"' AND password='"+password+"'");
	try {
	Statement st =conn.createStatement();
	ResultSet rs=st.executeQuery("select * from truck_driver where username='"+username+"' AND password='"+password+"'");
	//List<User> list=query.list();
	//System.out.println("Size"+list.size());
	
		status=rs.next();
		if(status==true)
		{
	          
			driver_id=rs.getInt(1);
		}
		rs.close();
		st.close();
		conn.close();
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	/*for (User user : list) {
		return user.getUserType()+" "+user.getEmployeeFirstName()+" "+user.getEmployeeID();
		
	}*/
	return driver_id;
}


public boolean insertDriver(TruckDriver tr)
{
	
	
	int i=0;
	Boolean status=false;
	Connection conn = ConnectionUtil.createConnection();
	//Query query=session.createQuery("from User where username='"+username+"' AND password='"+password+"'");
	try {
	//PreparedStatement st =conn.createStatement();
	String sql="INSERT INTO truck_driver(driver_fname,driver_lname,driver_address,driver_status,username,password,mobile,trucktype)"+"VALUES("+tr.getFirstname()+","+tr.getLastname()+","+tr.getAddress()+","+tr.getStatus()+","+tr.getUsername()+","+tr.getPassword()+","+tr.getTrucktype()+")";
	String sql1="INSERT INTO truck_driver(driver_fname,driver_lname,driver_address,driver_status,username,password,mobile,trucktype,lat,lng)VALUES(?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement pb=conn.prepareStatement(sql1);
	pb.setString(1,tr.getFirstname() );
	pb.setString(2,tr.getLastname());
	pb.setString(3,tr.getAddress());
	pb.setString(4,tr.getStatus());
	pb.setString(5, tr.getUsername());
	pb.setString(6,	tr.getPassword());
	pb.setString(7,tr.getMobile());
	pb.setString(8,tr.getTrucktype());
	pb.setFloat(9,tr.getLat());
	pb.setFloat(10,tr.getLoc());
	
	status=pb.execute();
	//i=st.executeUpdate(sql);
	//List<User> list=query.list();
	//System.out.println("Size"+list.size());
	
		//status=rs.next();
		//rs.close();
		pb.close();
		conn.close();
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	return status;
	
	
	}


public int checkusername(String username)
{
	
	//Boolean status=false;
	int id=0;
	Connection conn = ConnectionUtil.createConnection();
	//Query query=session.createQuery("from User where username='"+username+"' AND password='"+password+"'");
	try {
	Statement st =conn.createStatement();
	ResultSet rs=st.executeQuery("select * from truck_driver where username='"+username+"'");
	//List<User> list=query.list();
	//System.out.println("Size"+list.size());
	
		//status=rs.next();
	while(rs.next())
	{
		id=rs.getInt(1);
	}
		
		rs.close();
		st.close();
		conn.close();
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	/*for (User user : list) {
		return user.getUserType()+" "+user.getEmployeeFirstName()+" "+user.getEmployeeID();
		
	}*/
	return id;




}




/*public static void main(String[] args) {
	DriverDao dd = new DriverDao();
	Boolean ch=dd.authenticateUser("ds", "1234");
	System.out.println(ch);
}*/



}
