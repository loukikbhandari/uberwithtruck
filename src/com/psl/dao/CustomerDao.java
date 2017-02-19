package com.psl.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.psl.entity.Customer;
import com.psl.util.ConnectionUtil;

public class CustomerDao {

	public CustomerDao() {
	// TODO Auto-generated constructor stub
}

	public Boolean authenticateUser(String username,String password)
	{
		//Session session=HibernateUtility.getSesssion();
		Boolean status=false;
		//Connection cn =new ConnectionUtil();
		
		Connection conn = ConnectionUtil.createConnection();
		//Query query=session.createQuery("from User where username='"+username+"' AND password='"+password+"'");
		try {
		Statement st =conn.createStatement();
		ResultSet rs=st.executeQuery("select * from customer where username='"+username+"' AND password='"+password+"'");
		//List<User> list=query.list();
		//System.out.println("Size"+list.size());
		
			status=rs.next();
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
		return status;
	}


	public boolean insertCustomer(Customer tr)
	{
		
		
		int i=0;
		Boolean status=false;
		Connection conn = ConnectionUtil.createConnection();
		//Query query=session.createQuery("from User where username='"+username+"' AND password='"+password+"'");
		try {
		//PreparedStatement st =conn.createStatement();
		//String sql="INSERT INTO truck_driver(driver_fname,driver_lname,driver_address,driver_status,username,password,mobile,trucktype)"+"VALUES("+tr.getFirstname()+","+tr.getLastname()+","+tr.getAddress()+","+tr.getStatus()+","+tr.getUsername()+","+tr.getPassword()+","+tr.getTrucktype()+")";
		String sql1="INSERT INTO customer(fname,lname,address,username,password,mobile,lat,lng)VALUES(?,?,?,?,?,?,?,?)";
		PreparedStatement pb=conn.prepareStatement(sql1);
		pb.setString(1,tr.getFirstname() );
		pb.setString(2,tr.getLastname());
		pb.setString(3,tr.getAddress());
		pb.setString(4, tr.getUsername());
		pb.setString(5,	tr.getPassword());
		pb.setString(6,tr.getMobile());
		pb.setFloat(7,tr.getLat());
		pb.setFloat(8,tr.getLoc());
		
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
		ResultSet rs=st.executeQuery("select * from customer where username='"+username+"'");
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
