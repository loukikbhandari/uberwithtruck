<%@ page import="com.psl.entity.* "%>
<%@ page import="com.psl.dao.* "%>
<%@ page import="java.util.* "%>
<%@ page import="java.text.* "%>
<%@ page import="java.util.*"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%@ page session="true" %>

    <%int rate=2; 
     int extra = 50;
     int fix = 10;
     int above = 110;
     int next=55;
     int min=3;
     int cons = 4;
    
    
    %>


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
  <!-- 	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script> -->
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  	
  	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3&sensor=false&libraries=places"> </script>
  	
    <!-- <script type="text/javascript" src="jquery-1.11.1.js"></script> -->
    <link href="css/pages/reports.css" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    
    
    
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
       <!-- <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC8pmyqCjzUOasrmUl1Gsp5v8pYQY8oAJU&&libraries=places"></script> -->  
       <!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3&sensor=false&libraries=places"> </script> -->
    
    
    
    
    
          
          
  </head>

<body onLoad="getLocation()">

<sql:setDataSource var="enterdata" 
            driver="com.mysql.jdbc.Driver" 
            user="truckuser" password="truckuser" 
            url="jdbc:mysql://localhost:3306/myqltruckline" />
            <sql:query var = "list"  dataSource="${enterdata}">
            select lat,lng from truck_driver where driver_status='ll';
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
	
</div> <!-- /navbar -->
    



    
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
	      	
	      	<div class="span12">
	      	<div class="widget-header">
	      	
	      				<!-- <i class="icon-user"></i> -->
	      				
	      				<form action="dd.jsp" method="post" id="myform">
	      				
	      				<input type="hidden" id="fare" name="fare" />
	  					<input type="hidden" id="distance" name="distance" />
	  					<input type="hidden" id="duration" name="duration"/>
	  					<input type="hidden" id="lat" name="lat" />
	  					<input type="hidden" id="lng" name="lng" />
	      				
	      				
	      				
	      				<h3> From</h3> 
	      				<input class ="field" type="text" id="start"  name="start" placeholder="Enter Source Location">
	  					
	  					<h3> To</h3>
	  					<input class ="field"  type="text" id="end" name="end" placeholder="Enter Destination " >
	  					<h3></h3>
                    <input class="button btn btn-primary btn-large" type="button" value="Calculate Distance & Fare" onClick="calcRoute();">
	  					<h3 class="colourh3"></h3>
						  								  					
	  					<input type="button" class="button btn btn-primary btn-large" value="Request Ride" id="book" onClick="calcAll();"></input>
	  					
	  					</form>
	  					
	  				</div>
	  			
                   
                  <!-- <a href="viewbooking.jsp" target="_parent"><button class="button btn btn-primary btn-large" id="view">View My Bookings</button></a> -->
                  
                
	  				
	  				
	  				
	  				
	  				
	  				
	  				      
	      	
					 
                  <div class="info-box">
                  <!-- <table class="CSSTableGenerator">
      <tr>
        <td bgcolor="#FFFF99" style="padding:5px;"> -->
        <div id="form" style="width:100%; text-align:center; border: solid 1px #336699; background:#e3e3e3;">
                                     
                 <div></div>
                 <h2 id="total"></h2>
                 </div>
        <table class= "CSSTableGenerator" >
          <!-- <tr>
              <td><div id="form" style="width:100%; text-align:center; border: solid 1px #336699; background:#d1e1e4;">
                                     
                 <div></div>
                 <h3 id="total"></h3>
                 </div></td>
            </tr> -->
        
        
            <tr>
              <td><div id="map_canvas" style="width: 100%; height: 400px; border: solid 1px #336699"></div></td>
            </tr>
            
          </table>
          <!-- </td> -->
      <!-- </tr>
    </table> -->
              <!--  <div class="row-fluid stats-box">
             
                 <div id="tablediv" style="width:100%;height:250px;overflow:auto;margin:0 auto;"></div>
                 
              
                 
           </div>       
                  </div> -->
                  
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
   document.getElementById("book").disabled = true;
    var directionDisplay;
    var mapOptions = {
            //center: new google.maps.LatLng(myLocation.lat(),myLocation.lng()),
           zoom: 17,
           mapTypeId: google.maps.MapTypeId.ROADMAP
       };

       var map = new google.maps.Map(document.getElementById("map_canvas"),
               mapOptions);
    var directionsService = new google.maps.DirectionsService();
    var geocoder = new google.maps.Geocoder();
    var infowindow = new google.maps.InfoWindow;
    var lt="0";
    var lng="0";
    
    
    
    function success(position) {
    	
    	 
         directionsDisplay = new google.maps.DirectionsRenderer();

    	
    	
    	
       var  lat  = position.coords.latitude;
       document.getElementById('lat').value=lat;
       //alert(document.getElementById("lat").val);
       
       var  lng =  position.coords.longitude;
       document.getElementById('lng').value=lng;

       var  myLocation =   new google.maps.LatLng(lat, lng);
       
       
       
/* 
       var mapOptions = {
             center: new google.maps.LatLng(myLocation.lat(),myLocation.lng()),
            zoom: 17,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        var map = new google.maps.Map(document.getElementById("map_canvas"),
                mapOptions); */

                
                map.setCenter(myLocation);  
        geocodeLatLng(geocoder, map, infowindow,lat,lng);
        
        
          var image='image/truck.png';
        /* var marker = new google.maps.Marker({
            position: myLocation,
            map: map,
            title:"you are here",
            
        }); */
        
        // var infowindow = new google.maps.InfoWindow(), marker, i;

        for (i = 0; i < markers.length; i++) { 
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
   var fromText = document.getElementById('start');
   var fromAuto = new google.maps.places.Autocomplete(fromText);
   fromAuto.bindTo('bounds', map);
   //Find To location
   var toText = document.getElementById('end');
   var toAuto = new google.maps.places.Autocomplete(toText);
   toAuto.bindTo('bounds', map);
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
    
    
    
    
    
    
    
    function calcRoute() {
    	
    	//alert('hiiii');
    	//document.getElementById("book").disabled = false;
        var start = document.getElementById('start').value;
        var end = document.getElementById('end').value;
        var request = {
          origin: start,
          destination: end,
          travelMode: google.maps.DirectionsTravelMode.DRIVING
        };
        directionsService.route(request, function(response, status) {
          if (status == google.maps.DirectionsStatus.OK) {
        	  document.getElementById("book").disabled = false; 
            directionsDisplay.setDirections(response);
            computeTotalDistance(response);
            geocodeAddress(geocoder, map);
          }
        });
      }
      function computeTotalDistance(result) {
      var total = 0;
      var myroute = result.routes[0];
      for (var i = 0; i < myroute.legs.length; i++) {
        total += myroute.legs[i].distance.value;
      }
      total = total / 1000;
      /*Start Calculating Distance Fair*/
          if (10>total){
          var cost = <%=fix%>;
          }
          else if (10<total && 20>total)
            {
            var cost = ((total * <%=rate%>) + (<%=extra%>));
            }
            else if (20<total && 30>total)
            {
                var cost = ((total * <%=rate%>) + (<%=next%>));
            }
            else if (30<total && 50>total)
            {
                var cost = (((total - 30) * <%=cons%>) + (<%=above%>));
            }
            else
            {
                var cost = (((total - 50) * <%=rate%>) + 130);
            }

          var fare = cost * 0.11 + cost;
          var fare = Math.round(fare*100)/100;
      /*Distance Fair Calculation Ends*/
      document.getElementById('fare').value=fare;
      //alert(document.getElementById('fare').value);
      document.getElementById('distance').value=total;
      document.getElementById('duration').value=total*6;

      document.getElementById("total").innerHTML ="Total Distance = " + total + " km & Fare = $" + fare;
      
      
      }

    function auto() {
    var input = document.getElementById[('start'), ('end')];
    var types
    var options = {
       types: [],
       componentRestrictions: {country: ["US"]}
        };
        var autocomplete = new google.maps.places.Autocomplete(input, options);
     }
    
    
    
    
    
    
   
    
    
function calcAll() {
	 /* if(document.getElementById('end').value!="")
		{
		    calcRoute();
	        document.getElementById("myform").submit();
		}
	else
		{
		alert("Enter Destination");
		
		} */
        //geocodeAddress(geocoder, map);
    	
	 document.getElementById("myform").submit();
    	
      }
    
    

function geocodeAddress(geocoder, resultsMap) {
	  var address = document.getElementById('start').value;
	  //alert(address);
	  geocoder.geocode({'address': address}, function(results, status) {
	    if (status === google.maps.GeocoderStatus.OK) {
	    	//alert("ffff");
	    	//alert(results[0]);
	         document.getElementById('lat').value=results[0].geometry.location.lat();
	         document.getElementById('lng').value=results[0].geometry.location.lng();
	     	//alert(document.getElementById('lat').value);
	    	 // alert(document.getElementById('lng').value);
	    	 /*  alert("latitude is="+lt);
	    	  alert("longitude is="+lng); */
	    	 
		    	
	    	  
	    	  
	    	  
	      
	    } else {
	      alert('Geocode was not successful for the following reason: ' + status);
	    };
	  });
	}
      
    
    
    google.maps.event.addDomListener(window, 'load', getLocation() );
     
    </script>


  </body>

</html>






