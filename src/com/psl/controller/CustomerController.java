package com.psl.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.psl.dao.CustomerDao;
import com.psl.dao.DriverDao;
import com.psl.entity.Customer;
import com.psl.entity.TruckDriver;

/**
 * Servlet implementation class CustomerController
 */

public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println(" in dopost method");
		CustomerDao userDao = new CustomerDao();
		Customer tr=new Customer();
		tr.setFirstname(request.getParameter("firstname"));
		//Long userid =Long.parseLong(request.getParameter("userid"));
				tr.setLastname(request.getParameter("lastname"));
		tr.setAddress(request.getParameter("address"));
		tr.setUsername(request.getParameter("email"));
	tr.setPassword(request.getParameter("password")); 
	tr.setMobile(request.getParameter("mobile"));
	System.out.println(request.getParameter("loc"));
	tr.setLoc(Float.parseFloat(request.getParameter("loc")));
	tr.setLat(Float.parseFloat(request.getParameter("lat")));
		
	  int j=0;
	  j=userDao.checkusername(tr.getUsername());
	  if(j==0)
	  {	
	
		boolean i=userDao.insertCustomer(tr);
		PrintWriter out=response.getWriter();
		out.print(i);
		response.sendRedirect("customerlogin.html");
		
	  }
	  
	  
	  else
	  {
			PrintWriter out =response.getWriter();
			out.println("<script type=\"text/javascript\">");
          out.println("alert('Username already exist');");
          out.println("location='addCustomer.html';");
          out.println("</script>");
			
			
			
		}	
		
		
		
		/*//user.setEmployeeID(userid);
		user.setEmployeeFirstName(firstname);
		user.setDesignation(designation);
		user.setEmployeeLastName(lastname);
		user.setUsername(username);
		user.setPassword(password);
		user.setUserType(usertype);
		System.out.println("hhhhhhhhhhhh");*/
		
		//boolean inserted=userDao.addUser(user);
	/*
		if(inserted==false)
		{
			System.out.println("inside inserted=false");
			request.setAttribute("inserted",inserted);
			request.setAttribute("firstname",firstname);
			request.setAttribute("lastname",lastname);
			
			RequestDispatcher rd1=request.getRequestDispatcher("addUser.jsp");             		        		 
	      	rd1.forward(request, response);
		}*/
		//else
		//{
	/*	request.setAttribute("inserted",inserted);
		RequestDispatcher rd1=request.getRequestDispatcher("adminUser.jsp");             		        		 
      	rd1.forward(request, response);	*/
		//	response.sendRedirect("adminUser.jsp");
		//}
		
		
		
		
	}

}
