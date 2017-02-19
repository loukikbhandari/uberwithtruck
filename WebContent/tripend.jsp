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
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<link href="css/pages/reports.css" rel="stylesheet">
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
            
          </li> -->
          
          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="icon-user"></i> <%=session.getAttribute("username")%> <b class="caret"></b></a>
            
          </li>
          <li>
          <a href="signout.jsp">
				Log out			
			</a>
          <li>
        </ul>
			
			
			
	
		</div> <!-- /container -->
		
	</div> <!-- /navbar-inner -->
	
</div> 


<%
int tripid=0;
String username="";
String start="";
String end="";
float fare=0;
username=(String)session.getAttribute("username");
int driver_id=(Integer)session.getAttribute("driver_id");
//out.println();
start=(String)session.getAttribute("source");
end=(String)session.getAttribute("destination");
//out.println(driver_id);
//out.println(start);
//out.println(end);
fare=(Float)session.getAttribute("fare");
//out.println(fare);
tripid=(Integer)session.getAttribute("tripid");
//out.println(tripid);
/* out.println("latitude:"+lat+"longitude:"+lng+"fare:"+fare+"distance:"+distance+"duration:"+duration+start+end); */ 

/* out.println(name); */
 ConnectionUtil cn = new ConnectionUtil();
Connection conn=cn.createConnection();
Statement st=conn.createStatement();
Statement st1=conn.createStatement();
/* String sql="SELECT driver_id,driver_fname,driver_lname,trucktype,mobile,( 3959 * acos( cos( radians("+lat+") ) * cos( radians( lat ) ) * cos( radians( lng ) - radians("+lng+") ) + sin( radians("+lat+" ) ) * sin( radians( lat ) ) ) ) AS distance FROM truck_driver where driver_status='ll' HAVING distance < 10 ORDER BY distance LIMIT 1;";
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

String sql4="update truck_driver set driver_status='ll' where driver_id='"+driver_id+"'";
String sql2="update trip set status='Completed' where tripid='"+tripid+"'";



Date date=new Date();
st.executeUpdate(sql4);
st1.executeUpdate(sql2);


 
st.close();
st1.close();
conn.close(); 






%>

<!-- /navbar -->



	
	<div style="text-align:center;font-size:500%;class:italics">
		
			
<br>
<h2>Your trip has been completed successfully</h2>
<br>

 <p style="font-size:30%;"><span style="color: #575757;"><strong>Date :</strong></span><span style="color: #575757;"><%=date.toString() %></span></p>
<p style="font-size:30%;"><span style="color: #575757;"><strong>From : </strong><%=start%></span></p>
<p style="font-size:30%;"><span style="color: #575757;"><strong>To :</strong><%=end%></span></p>
<p style="font-size:30%;"><span style="color: #575757;"><strong>Fare : <%=fare%> </strong><span> dollars will be credited  to your account soon.!!! </p>


		
		
	</div> <!-- /content -->
	
	
<%






%>	
	
	



<!-- Text Under Box -->


<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/bootstrap.js"></script>

<script src="js/signin.js"></script>

</body>

 </html>











