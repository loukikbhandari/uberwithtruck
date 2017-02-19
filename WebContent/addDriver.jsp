<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    
    <title></title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes"> 
    
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />

<link href="css/font-awesome.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
    
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/pages/signin.css" rel="stylesheet" type="text/css">

<!-- <script type="text/javascript" src="jquery-1.7.2.min.js"></script>
<script type="text/javascript"> -->
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	/* alert("inside function"); */
	if(<%=request.getAttribute("inserted")%>==false)
	{
	 	alert("UserName already exists..!!Please enter another UserName"); 
/* 	 	alert("firstname:"+name);   */
	$("#firstname").val('<%=request.getAttribute("firstname")%>');
		$("#lastname").val('<%=request.getAttribute("lastname")%>');
	
	}
	
});

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
			
			<a class="brand" href="Thome.html">
				TruckLine				
			</a>		
			
			<div class="nav-collapse">
				<ul class="nav pull-right">
					
					<li class="">						
						<a href="Thome.html" class="">
							<i class="icon-chevron-left"></i>
							Back to Homepage
						</a>
						
					</li>
				</ul>
				
			</div><!--/.nav-collapse -->	
	
		</div> <!-- /container -->
		
	</div> <!-- /navbar-inner -->
	
</div> <!-- /navbar -->



<div class="account-container register">
	
	<div class="content clearfix">
		
		<form action="UserController" method="post">
		
			<h1>Signup as a Driver</h1>			
			
			<div class="login-fields">
				
				<p>Create Driver Account</p>
				
					
				
				<div class="field">
					
					<input type="text" id="firstname" name="firstname" value="" placeholder="First Name" class="login" required />
				</div> <!-- /field -->
				
				<div class="field">
					
					<input type="text" id="lastname" name="lastname" value="" placeholder="Last Name" class="login"  required="required"/>
				</div> <!-- /field -->
				
				
				<div class="field">
					
					<input type="text" id="address" name="address" value="" placeholder="Address" class="login" required="required"/>
				</div> 
				
				
				<div class="field">
										<input type="email" id="email" name="email" value="" placeholder="Username/Email" class="login"  required="required"/><span id="available" hidden="true">@@@@@@@@@@@@</span>
				</div> <!-- /field -->
				
				<div class="field">
										<input type="password" id="password" name="password" value="" placeholder="Password" class="login" required="required"/>
				</div> <!-- /field -->
				
				<div class="field">
					<input type="password" id="confirmpassword" name="confirmpassword" value="" placeholder="Confirm Password" class="login" required="required"/>
				</div> 
				
				 <div class="field">
					
					<input type="tel" id="mobile" name="mobile" value="" placeholder="Mobile Number" class="login" required="required"/>
				</div> 
				 				
				
				
				<div class="field">
					 Truck Type:  <span></span><select name="trucktype" >
					<option>TATA ACE</option>
					<option>TATA 407</option>
					<option>Other</option>
					</select>
				</div> 
				
				
				
				
				
			</div> <!-- /login-fields -->
			
			<div class="login-actions">
				
													
				<button class="button btn btn-primary btn-large">Register</button>
				
			</div> <!-- .actions -->
			
		</form>
		
	</div> <!-- /content -->
	
</div> <!-- /account-container -->

</body>
</html>