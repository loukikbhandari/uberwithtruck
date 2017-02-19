<%@ page import="com.psl.entity.* "%>
<%@ page import="com.psl.dao.* "%>
<%@ page import="com.psl.util.* "%>
<%@ page import="java.util.* "%>
<%@ page import="java.sql.* "%>
<%@ page import="java.text.* "%>
<%@ page import="java.util.*"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%@ page session="true" %>

    










<!DOCTYPE html>
<html lang="en">
  
 <head>
    <meta charset="utf-8">
    <title>TruckLine</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-responsive.min.css" rel="stylesheet">
    
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
    <link href="css/font-awesome.css" rel="stylesheet">
    
    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  	
  	
  	
    
    <link href="css/pages/reports.css" rel="stylesheet">
         
 <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3&sensor=false&libraries=places"> </script>
    
    
    	 <style type="text/css">
.colourh3 
{
font-family: Verdana;
color: red;
}
.CSSTableGenerator {
        margin:0px;padding:0px;
        width:100%;
        border:1px solid #000000;
        
        -moz-border-radius-bottomleft:0px;
        -webkit-border-bottom-left-radius:0px;
        border-bottom-left-radius:0px;
        
        -moz-border-radius-bottomright:0px;
        -webkit-border-bottom-right-radius:0px;
        border-bottom-right-radius:0px;
        
        -moz-border-radius-topright:0px;
        -webkit-border-top-right-radius:0px;
        border-top-right-radius:0px;
        
        -moz-border-radius-topleft:0px;
        -webkit-border-top-left-radius:0px;
        border-top-left-radius:0px;
}.CSSTableGenerator table{
    border-collapse: collapse;
        border-spacing: 0;
        width:100%;
        height:100%;
        margin:0px;padding:0px;
}.CSSTableGenerator tr:last-child td:last-child {
        -moz-border-radius-bottomright:0px;
        -webkit-border-bottom-right-radius:0px;
        border-bottom-right-radius:0px;
}
.CSSTableGenerator table tr:first-child td:first-child {
        -moz-border-radius-topleft:0px;
        -webkit-border-top-left-radius:0px;
        border-top-left-radius:0px;
}
.CSSTableGenerator table tr:first-child td:last-child {
        -moz-border-radius-topright:0px;
        -webkit-border-top-right-radius:0px;
        border-top-right-radius:0px;
}.CSSTableGenerator tr:last-child td:first-child{
        -moz-border-radius-bottomleft:0px;
        -webkit-border-bottom-left-radius:0px;
        border-bottom-left-radius:0px;
}.CSSTableGenerator tr:hover td{
        
}
/*  .CSSTableGenerator tr:nth-child(odd){ background-color:#ffaa56; }
.CSSTableGenerator tr:nth-child(even)    { background-color:#ffffff;
} */ .CSSTableGenerator td{
        vertical-align:middle;
        
        
        border:1px solid #000000;
        border-width:0px 1px 1px 0px;
        text-align:left;
        padding:14px;
        font-size:10px;
        font-family:Arial;
        font-weight:normal;
        color:#000000;
}.CSSTableGenerator tr:last-child td{
        border-width:0px 1px 0px 0px;
}.CSSTableGenerator tr td:last-child{
        border-width:0px 0px 1px 0px;
}.CSSTableGenerator tr:last-child td:last-child{
        border-width:0px 0px 0px 0px;
}
.CSSTableGenerator tr:first-child td{
                background:-o-linear-gradient(bottom, #e3e3e3 5%, #e9e9e9
100%);  background:-webkit-gradient( linear, left top, left bottom,
color-stop(0.05, #e3e3e3), color-stop(1, #e9e9e9) );
        background:-moz-linear-gradient( center top, #e3e3e3 5%, #e9e9e9 100% );
        filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#e3e3e3",
endColorstr="#e9e9e9"); background:
-o-linear-gradient(top,#e3e3e3,e9e9e9);

        background-color:#e3e3e3;
        border:0px solid #000000;
        text-align:center;
        border-width:0px 0px 1px 1px;
        font-size:14px;
        font-family:Arial;
        font-weight:bold;
        color:#000;
}
/* .CSSTableGenerator tr:first-child:hover td{
        background:-o-linear-gradient(bottom, #ff7f00 5%, #e9e9e9
100%);  background:-webkit-gradient( linear, left top, left bottom,
color-stop(0.05, #ff7f00), color-stop(1, #bf5f00) );
        background:-moz-linear-gradient( center top, #ff7f00 5%, #e9e9e9 100% );
        filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#ff7f00",
endColorstr="#e9e9e9"); background:
-o-linear-gradient(top,#ff7f00,e9e9e9);

        background-color:#ff7f00;
}
 */.CSSTableGenerator tr:first-child td:first-child{
        border-width:0px 0px 1px 0px;
}
.CSSTableGenerator tr:first-child td:last-child{
        border-width:0px 0px 1px 1px;
}
.c0
{
background-color:green;
}

.c1
{
background-color:red;
}

.c2
{
background-color:orange;
}

</style>
    
    
          
          
  </head>
  
  
  
  
  
  

<body onLoad="getLocation()">

<sql:setDataSource var="enterdata" 
            driver="com.mysql.jdbc.Driver" 
            user="truckuser" password="truckuser" 
            url="jdbc:mysql://localhost:3306/mysqltruckline" />
            <sql:query var = "list"  dataSource="${enterdata}">
            select lat,lng from customer ;
             </sql:query> 



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
          <li class="dropdown"><a href="signout.jsp" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="icon-cog"></i> Logout <b class="caret"></b></a>
            <!-- <ul class="dropdown-menu">
              <li><a href="javascript:;">Settings</a></li>
              <li><a href="javascript:;">Help</a></li>
            </ul> -->
          </li>
          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="icon-user"></i> <%=session.getAttribute("username")%> <b class="caret"></b></a>
            <!-- <ul class="dropdown-menu">
              <li><a href="javascript:;">Profile</a></li>
              <li><a href="javascript:;">Logout</a></li>
            </ul> -->
          </li>
        </ul>
			
			
	</div>
	</div>
	</div>		
			
			
    



    
<div class="subnavbar">

	<div class="subnavbar-inner">
	
		<div class="container">

			<ul class="mainnav">
			
				
				
				
				
				<li class="active">
					<a href="adminUser.jsp">
						
						<i class="icon-dashboard"></i>
						<span>DashBoard</span>
					</a>    				
				</li>
				<li>					
					<a href="payment.html">
						<i class="icon-briefcase"></i>
						
						<span>Payment</span>
					</a>  									
				</li>
				<li>
					<a href=#>
						<i class="icon-list-alt"></i>
						<span>History</span>
					</a>	    				
				</li>
				
				<!-- <li>					
					<a href="addlocation.jsp">
						<i class="icon-code"></i>
						<span>Add Location</span>
					</a>  									
				</li> -->
                
                
                <li>					
					<a href=#>
						<i class="icon-bar-chart"></i>
						<span>Pricing</span>
					</a>  									
				</li>
                
                
                
				
				<li class="dropdown">					
					<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
						<i class="icon-long-arrow-down"></i>
						<span>Help</span>
						<b class="caret"></b>
					</a>	
				
					<ul class="dropdown-menu">
                    	<li><a href="icons.html">Icons</a></li>
						<li><a href="faq.html">FAQ</a></li>
                        <li><a href="pricing.html">Pricing Plans</a></li>
                        <li><a href="login.html">Login</a></li>
						<li><a href="signup.html">Signup</a></li>
						<li><a href="error.html">404</a></li>
                    </ul>    				
				</li>
			
			</ul>

		</div> <!-- /container -->
	
	</div> <!-- /subnavbar-inner -->

</div> <!-- /subnavbar -->
    
  
<div class="main">
	
	<div class="main-inner">

	    <div class="container">
	    	
	     <div class="row"> 
	      	
   <table class="CSSTableGenerator" style="float:right"  margin-left="500px" border="3px" cellpadding="12px" bordercolor="#444"  >   
   <tr >
   
   <h1 align="center">Trips:</h1>
<td>Trip ID</td>
<td>driver ID </td>
<td>Customer Name</td>
<td>Customer Mobile No </td>
<td>Source</td>
<td>Destination</td>
<td>fare</td>
<td>distance</td>
<td>status</td>
<td>-------</td>
<td>-------</td>
</tr>
      
                  
                  
                  
                  
                  
 

                  
                  
                  
                  
                  
                  
                  
               
	 
	 
 
	 
	      
<%
int driver_id=(Integer)session.getAttribute("driver_id");
//String driver_ids=driver_idss.toString();
//System.out.print(driver_id);
//driver_id=21;


//int driver_id=Integer.parseInt(driver_ids);
//ConnectionUtil cn=new ConnectionUtil();
Connection conn=ConnectionUtil.createConnection();
Statement st=conn.createStatement();
Statement st1=conn.createStatement();
String start,end,status="";
float fare,distance=0;
int cust_id;
ResultSet rs2=null;
int trip_id=0;
String source,destination,duration,fullname="";
String mobile="";
String fname="";
String lname="";


ResultSet rs=st.executeQuery("select * from trip where driver_id='"+driver_id+"' AND status='Not Started'");
while(rs.next())
{
	trip_id=rs.getInt(1);
	session.setAttribute("tripid",trip_id);
	driver_id=rs.getInt(2);
	cust_id=rs.getInt(3);
	//System.out.print("cust_id is"+cust_id);
		 rs2=st1.executeQuery("select * from customer where cust_id='"+cust_id+"'");
		while(rs2.next())
		{
		fname=rs2.getString(2);
		lname=rs2.getString(3);
		mobile=rs2.getString(5);
		} 
		
	source=rs.getString(4);
	session.setAttribute("source",source );
	
	destination=rs.getString(5);
	session.setAttribute("destination",destination );
    fare=Math.round(rs.getFloat(6));
    session.setAttribute("fare",fare);
    
    distance =rs.getFloat(7);
    status=rs.getString(8);
    fullname=fname+""+lname;
    System.out.print(fullname);
  %>	

    <TR>
    <TD> <%= trip_id %></td>
    <TD> <%= driver_id %></TD>
    <TD> <%= fullname%></TD>
    <TD> <%= mobile %></TD>
    <TD > <%=source%></TD>
    <TD ><%= destination %></TD>
    <TD> <%= fare %></TD>
    <TD> <%=distance %></TD>
    <TD> <%= status %></TD>
     <%-- <TD> <%= status %></TD> --%>
    <Td><button class="button btn btn-primary btn-large" id="starter" onclick="calcRoute();">Start</button></Td>
    <Td><button class="button btn btn-primary btn-large" id="ender" disabled>End</button></Td>               
    </TR>
	
	
<% 	
	

}






%>	      
	      
	      
	      
	      
	 </table>     
	     <table class="CSSTableGenerator">
                
        
            <tr>
              <td><div id="map_canvas" style="width: 100%; height: 300px; border: solid 1px #336699"></div></td>
            </tr>
            
          </table> 
			
	      </div>
                  
                  
	      
<%
rs.close();
if(rs2!=null)
{	
rs2.close();
}
else
{
	out.println("<h2 align=\"center\">Sorry no trips scheduled yet...!!<p></2>");	
}	
st.close();
st1.close();
conn.close();
%>	      
	</div>
                 </div> 
                 </div>   
  
    

<!-- <script src="js/jquery-1.7.2.min.js"></script> -->
<script src="js/excanvas.min.js"></script>
<script src="js/chart.min.js" type="text/javascript"></script>
<script src="js/bootstrap.js"></script>
<script src="js/base.js"></script>
<script >
    

    
    
    
	
	    
 
    
    
    
    
    
    
    var markers = [
<c:forEach var="s" items="${list.rows}">
[<c:out value="${s.lat}"/>,<c:out value="${s.lng}"/>],
</c:forEach>         ];  
    
    
    
    function getLocation(){

        {
            if (navigator.geolocation)

            {

                var options = {
                    enableHighAccuracy: true,
                    timeout: 5000,
                    maximumAge: 0
                };

                navigator.geolocation.getCurrentPosition( success, error,options);
            }

            else

            { x.innerHTML= "Geolocation is not supported by this browser."; }
        }

    }

    function error(e) {

    console.log("error code:" + e.code + 'message: ' + e.message );

    }
   // document.getElementById("book").disabled = true;
    var directionDisplay;
    var directionsService = new google.maps.DirectionsService();
    var geocoder = new google.maps.Geocoder();
    var infowindow = new google.maps.InfoWindow;
    function success(position) {
    	
    	 
         directionsDisplay = new google.maps.DirectionsRenderer();

    	
    	
    	
       var  lat  = position.coords.latitude;
     //  document.getElementById('lat').value=lat;
       //alert(document.getElementById("lat").val);
       
       var  lng =  position.coords.longitude;
     //  document.getElementById('lng').value=lng;

       var  myLocation =   new google.maps.LatLng(lat, lng);
       
       
       

       var mapOptions = {
             center: new google.maps.LatLng(myLocation.lat(),myLocation.lng()),
            zoom: 17,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        var map = new google.maps.Map(document.getElementById("map_canvas"),
                mapOptions);

        geocodeLatLng(geocoder, map, infowindow,lat,lng);
        
        
          var image='image/marker.png';
        /* var marker = new google.maps.Marker({
            position: myLocation,
            map: map,
            title:"you are here",
            
        }); */
        
        // var infowindow = new google.maps.InfoWindow(), marker, i;

        for (i = 0; i <0; i++) { 
        	//alert(markers.length);
            marker = new google.maps.Marker({
                position: new google.maps.LatLng(markers[i][0], markers[i][1]),
                map: map,
                icon:image
                
            });

        }
         /*    google.maps.event.addListener(marker, 'click', (function(marker, i) {
                return function() {
                    infowindow.setContent(markers[i][0]);
                    infowindow.open(map, marker);
                }
            })(marker, i));

        } 
  */       
        
        
        
        
        
        
        

        //Find From location    
   /* var fromText = document.getElementById('start');
   var fromAuto = new google.maps.places.Autocomplete(fromText);
   fromAuto.bindTo('bounds', map);
   //Find To location
   var toText = document.getElementById('end');
   var toAuto = new google.maps.places.Autocomplete(toText);
   toAuto.bindTo('bounds', map); */
   //  
       directionsDisplay.setMap(map);
       directionsDisplay.setPanel(document.getElementById('directions-panel'));
        
        
        
        
        

    }
    function geocodeLatLng(geocoder, map, infowindow,lat,lng) {
    	  /* var input = document.getElementById('latlng').value; */
    	 /*  var latlngStr = input.split(',', 2); */
    	  var latlng = {lat:lat, lng:lng };
    	  geocoder.geocode({'location': latlng}, function(results, status) {
    	    if (status === google.maps.GeocoderStatus.OK) {
    	      if (results[1]) {
    	        map.setZoom(17);
    	        var marker = new google.maps.Marker({
    	          position: latlng,
    	          map: map
    	        });
    	        document.getElementById('start').value=results[0].address_components[0].long_name+","+results[0].address_components[1].long_name+","+results[1].address_components[1].long_name;
    	        infowindow.setContent(results[0].address_components[0].long_name+","+results[0].address_components[1].long_name+","+results[1].address_components[1].long_name);
    	        infowindow.open(map, marker);
    	      } else {
    	        window.alert('No results found');
    	      }
    	    } else {
    	      window.alert('Geocoder failed due to: ' + status);
    	    }
    	  });
    	}
    document.getElementById("ender").onclick = function () {
        location.href = "tripend.jsp";
    };

     function calcRoute() {
    	
    	//alert('hiiii');
    	document.getElementById("ender").disabled = false; 
    	//document.getElementById("book").disabled = false;
        var start = '<%=session.getAttribute("source")%>';
        //alert(start);
        
        var end = '<%=session.getAttribute("destination")%>';
        alert(end);
        var request = {
          origin: start,
          destination: end,
          travelMode: google.maps.DirectionsTravelMode.DRIVING
        };
        directionsService.route(request, function(response, status) {
          if (status == google.maps.DirectionsStatus.OK) {
        	//  document.getElementById("book").disabled = false; 
            directionsDisplay.setDirections(response);
            //computeTotalDistance(response);
            //geocodeAddress(geocoder, map);
          }
        });
      }
     
    
    google.maps.event.addDomListener(window, 'load', getLocation() );
     
    </script>

<!-- 
</div>
          </div>
               </div> -->

  </body>

</html>






