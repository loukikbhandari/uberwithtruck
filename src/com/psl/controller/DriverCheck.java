package com.psl.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.psl.dao.DriverDao;

/**
 * Servlet implementation class DriverCheck
 */
public class DriverCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverCheck() {
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
		System.out.print("fdsfdsf");
		DriverDao checkuser=new DriverDao();
		String username=request.getParameter("username");
		String password=request.getParameter("password");
	    int ch=checkuser.authenticateUser(username, password); 
	    HttpSession session=request.getSession();
	    
	    
	    
	    /*List<Location> locationList=locationDao.getLocationList();
	    for (Location location : locationList) {
			System.out.println("LLL"+location);
		}
	    JSONArray json=new JSONArray();
	    
	    json.addAll(locationList);
	    */
	    //System.out.print(ch);
         if(ch==0)
         {
             //System.out.print("ch is o"+ch);
        	// response.sendRedirect("driverlogin.html");
        	 PrintWriter out=response.getWriter();
        	 //System.out.println("wrong username or password");
        	 out.println("<script type=\"text/javascript\">");
             out.println("alert('User or password incorrect');");
             out.println("location='driverlogin.html';");
             out.println("</script>");
        	 
        	 
        	 
        	 
         }
         else
         {
        	
        	 //System.out.print("ch is o"+ch);
        	 session.setAttribute("driver_id",ch);
        	 session.setAttribute("username",username);
        	// response.sendRedirect("driverUser.jsp");
        				RequestDispatcher rd1=request.getRequestDispatcher("driverUser.jsp");             		        		 
        	          	rd1.forward(request, response);	 
        				 
        		         
         } 
		
		
		
		
	}

}
