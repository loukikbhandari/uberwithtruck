package com.psl.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.psl.dao.CustomerDao;


public class CustomerLookup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerLookup() {
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
		System.out.print("CustomerLookup");
		CustomerDao checkuser=new CustomerDao();
		String username=request.getParameter("username");
		String password=request.getParameter("password");
	    Boolean ch=checkuser.authenticateUser(username, password); 
	    HttpSession session=request.getSession();
	    
	    
	    
	    /*List<Location> locationList=locationDao.getLocationList();
	    for (Location location : locationList) {
			System.out.println("LLL"+location);
		}
	    JSONArray json=new JSONArray();
	    
	    json.addAll(locationList);
	    */
         if(ch==false)
         {
        	 PrintWriter out=response.getWriter();
        	 //System.out.println("wrong username or password");
        	 out.println("<script type=\"text/javascript\">");
             out.println("alert('User or password incorrect');");
             out.println("location='customerlogin.html';");
             out.println("</script>");
        	// response.sendRedirect("customerlogin.html");
        	 
         }
         else
         {
        	//String data[]= ch.split(" ");
        	// String usertype=data[0];
        	// String firstname=data[1];
        	// long userid=Integer.parseInt(data[2]);
        	 
        	 
        	 session.setAttribute("username",username);
        	 //session.setAttribute("firstname",firstname);
        	 //session.setAttribute("userid",userid);
        	 
        	// System.out.println(userid+usertype+firstname);
        	// if(usertype.equals("Administrator"))
        		//	 {
        		//		System.out.println("in administrator"); 
        				RequestDispatcher rd1=request.getRequestDispatcher("adminUser.jsp");             		        		 
        	          	rd1.forward(request, response);	 
        				 
        		//	 }
        	 
        	/* else if(usertype.equals("Application"))
        	 {
        		 System.out.println("in application");
         		 RequestDispatcher rd2=request.getRequestDispatcher("applicationUser.jsp");
    	          	rd2.forward(request, response);		
        		     		 
        		 
        	 }*/
         
         } 
		
		
		
		
	}

}
