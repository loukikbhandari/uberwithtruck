<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>  
<%@ page import="java.util.*" %>   
<%@ page import="java.util.Date" %>
<%@ page import="com.psl.util.*" %>
<%@ page session="true" %>    


<html lang="en">
  
 <head>
    <meta charset="utf-8">
    <title>TruckLine</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes"> 
    
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />

<link href="css/font-awesome.css" rel="stylesheet">
<link href="mycss.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
    
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/pages/signin.css" rel="stylesheet" type="text/css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">

</script>
</head>



<body>
	
	<div class="navbar navbar-fixed-top">
	
	<div class="navbar-inner">
		
		<div class="container">
			
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</a>
			
			<a class="brand" href="adminUser.jsp">
				TruckLine System			
			</a>		
			
			<img alt="" src="image/th.jpg" height="20" width="60">
			 <ul class="nav pull-right">
          <!-- <li class="dropdown"><a href="signout.jsp" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="icon-cog"></i>Logout <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="javascript:;">Settings</a></li>
              <li><a href="javascript:;">Help</a></li>
            </ul>
          </li> -->
          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="icon-user"></i> <%=session.getAttribute("username")%> <b class="caret"></b></a>
            <!-- <ul class="dropdown-menu">
              <li><a href="javascript:;">Profile</a></li>
              <li><a href="javascript:;">Logout</a></li>
            </ul> -->
          </li>
          
           <li>
          <a href="signout.jsp">
				Log out			
			</a>
          <li>
          
          
          
          
        </ul>
			
			
			
			<%-- <div class="nav-collapse">
				<ul class="nav pull-right">
					
			
					<li class="dropdown">						
						<a href="signout.jsp" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-cog"></i> 
							<%=session.getAttribute("username")%>
							<b class="caret"></b>
						</a>
						
											
					</li>
				</ul>
			
				
				
			</div><!--/.nav-collapse -->	 --%>
			
			
			
			<!-- <div class="nav-collapse">
        <ul class="nav pull-right">
          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="icon-cog"></i> Account <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="javascript:;">Settings</a></li>
              <li><a href="javascript:;">Help</a></li>
            </ul>
          </li>
          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="icon-user"></i> EGrappler.com <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="javascript:;">Profile</a></li>
              <li><a href="javascript:;">Logout</a></li>
            </ul>
          </li>
        </ul>
        <form class="navbar-search pull-right">
          <input type="text" class="search-query" placeholder="Search">
        </form>
      </div>
      /.nav-collapse 
    </div> -->
	
		</div> <!-- /container -->
		
	</div> <!-- /navbar-inner -->
	
</div> 


<%
String name,start,end;
int driver_id=0;
String driver_fname="";
String driver_lname="";
String trucktype="";
String mobile="";
String username=(String)session.getAttribute("username");
float fare,distance,duration,lat,lng;
start=request.getParameter("start");
end=request.getParameter("end");
fare=Float.parseFloat(request.getParameter("fare"));
distance=Float.parseFloat(request.getParameter("distance"));
duration=Float.parseFloat(request.getParameter("duration"));
lat=Float.parseFloat(request.getParameter("lat"));
lng=Float.parseFloat(request.getParameter("lng")); 

/* out.println("latitude:"+lat+"longitude:"+lng+"fare:"+fare+"distance:"+distance+"duration:"+duration+start+end); */ 
name = (String)session.getAttribute("username");
/* out.println(name); */
ConnectionUtil cn = new ConnectionUtil();
Connection conn=cn.createConnection();
Statement st=conn.createStatement();
String sql="SELECT driver_id,driver_fname,driver_lname,trucktype,mobile,( 3959 * acos( cos( radians("+lat+") ) * cos( radians( lat ) ) * cos( radians( lng ) - radians("+lng+") ) + sin( radians("+lat+" ) ) * sin( radians( lat ) ) ) ) AS distance FROM truck_driver where driver_status='ll' HAVING distance < 10 ORDER BY distance LIMIT 1;";
System.out.println(sql);
float distancerst=0;
ResultSet rs=st.executeQuery(sql);
while(rs.next())
{
driver_id=rs.getInt(1);
driver_fname=rs.getString(2);
driver_lname=rs.getString(3);
trucktype=rs.getString(4);
mobile=rs.getString(5);
distancerst=rs.getFloat(6);
}
/* out.println(driver_id+driver_fname+driver_lname+trucktype); */
String sql2="select * from truckline.customer where username='"+username+"'";
/* out.println(sql2); */
 ResultSet rs2=st.executeQuery(sql2);
int cust_id=0;
while(rs2.next())
{
cust_id=rs2.getInt(1);
}  
/* out.println(driver_id+driver_fname+driver_lname+trucktype+cust_id); */
if(driver_id!=0)
{
//String sql3="insert into ";
String sql3="INSERT INTO trip(driver_id,cust_id,source,destination,fare,distance,status)VALUES(?,?,?,?,?,?,?)";
PreparedStatement pb=conn.prepareStatement(sql3);
String sql4="update truck_driver set driver_status='dnd' where driver_id='"+driver_id+"'";
pb.setInt(1,driver_id );
pb.setInt(2,cust_id);
pb.setString(3,start);
pb.setString(4,end);
pb.setFloat(5,fare);
pb.setFloat(6,distance);
pb.setString(7,"Not started");

Date date=new Date();

Boolean status= pb.execute();
st.executeUpdate(sql4);



pb.close();
rs2.close();
rs.close(); 
st.close();
conn.close();






%>

<!-- /navbar -->



	
	<div style="text-align:center;font-size:500%;class:italics">
		
			
<br>
<h2>Your trip has been booked successfully</h2>
<br>

<p style="font-size:30%;"><span style="color: #575757;"><strong>Date :</strong></span><span style="color: #575757;"><%=date.toString() %></span></p>
<p style="font-size:30%;"><span style="color: #575757;"><strong>From : </strong><%=start%></span></p>
<p style="font-size:30%;"><span style="color: #575757;"><strong>To :</strong><%=end%></span></p>
<p style="font-size:30%;"><span style="color: #575757;"><strong>Driver : <%=driver_fname%> <%=driver_lname%></strong><span>      (Nearest available driver from your location at a distance <%=String.format("%.2f", distancerst)+" km"%>)</span></p>
<p style="font-size:30%;"><span style="color: #575757;"><strong>Driver Mobile No:</strong><%=mobile%></span></p>
<p style="font-size:30%;"><span style="color: #575757;"><strong>Truck variant</strong> <%=trucktype %></span></p>


		
		
	</div> <!-- /content -->
	
	
<%

}

else
{
	
out.println("<br><br><h2>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspSorry No driver available within radius of 10 kms around your source location!!!!</h2>");
rs2.close();
rs.close(); 
st.close();
conn.close();


}	






%>	
	
	



<!-- Text Under Box -->


<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/bootstrap.js"></script>

<script src="js/signin.js"></script>

</body>

 </html>







<%-- <html>
<body>
<h3>Your trip has been booked successfully</h3>


<p><span style="color: #575757;"><strong>Date </strong></span><span style="color: #575757;"><%=date.toString() %></span></p>
<p><span style="color: #575757;"><strong>From : </strong><%=start%></span></p>
<p><span style="color: #575757;"><strong>To :</strong><%=end%></span></p>
<p><span style="color: #575757;"><strong>Driver : <%=driver_fname%> <%=driver_lname%></strong><span>      (Nearest available driver from your location at a distance <%=String.format("%.2f", distancerst)+" km"%>)</span></p>
<p><span style="color: #575757;"><strong>Driver Mobile No:</strong><%=mobile%></span></p>
<p><span style="color: #575757;"><strong>Truck variant</strong> <%=trucktype %></span></p>

</body>
</html>
 --%>



