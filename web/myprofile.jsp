<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Landlord Tenant System - Reports</title>
<link rel="shortcut icon" href="img/project logo.png"
	type="image/x-icon" />
<link href="./css/style.css" rel="stylesheet" type="text/css"/>
<link href="./css/custom.css" rel="stylesheet" type="text/css"/>
<style>

/* main level link hover */
#nav .current a,#nav li:hover>a {
	//background: #666 url(img/gradient.png) repeat-x 0 -40px; //change
        background: white url(img/gradient.png) repeat-x 0 -40px;
	color: #444;
	border-top: solid 1px #f8f8f8;
	-webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
	-moz-box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
	box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
	text-shadow: 0 1px 0 rgba(255, 255, 255, 1);
}
</style>
</head>
<body>
	<table>
		<tr>
			<td><img src="img/project logo.png" width="110" height="100"></img></td>
			<td><font size="6" color="black" face="cursive">LandLord
				Tenant System</font></td>
		</tr>
	</table>
	<ul id="nav">
		<li><a href="index.html">Home</a></li>
		<li><a href="#">Login &#9660;</a>
			<ul>
				<li><a href="dbalogin.jsp">Data Administrator</a></li>
				<li><a href="landlord_tenantlogin.jsp">LandLord/Tenant</a></li>
			</ul></li>
		<li><a href="#">Register &#9660;</a>
			<ul>
				<li><a href="dbaregister.jsp">DBA</a></li>
				<li><a href="landlord_tenantregister.jsp">LandLord/Tenant</a></li>
			</ul></li>
		<li><a href="submitratings.jsp">Give Ratings</a></li>
<%
    if((String)session.getAttribute("session_ll_userid")!=null){
%>
		<li style="margin-right: 450px;"><a href="postproperties.jsp">Post Property</a></li>
<%}%>
		<li  class="current"><a href="#">Reports &#9660;</a>
			<ul>
				<li><a href="myaccount.jsp">My Account</a></li>
				<li><a href="viewpostedproperty.jsp">View Posted Property</a></li>
				<li><a href="updatedatabase.jsp">Update Database</a></li>
				<li><a href="myprofile.jsp">My Profile</a></li>
				<li><a href="viewallratings.jsp">View All Ratings</a></li>
			</ul>
		</li>
		<li><a href="aboutus.jsp">About us</a></li>
		<li><a href="contactus.jsp">Contact us</a></li>
	</ul>


	<div style="margin-top: 120px; text-align: center;">
		<font size="6" color="black" face="cursive">Please login to see your profile details.</font>
		</br></br> </br> </br>
	</div>
			<div style="margin-top: 85px; text-align: center; margin-bottom: 100px;">
				<center>
					<input type="submit" name="home" value="HOME"/> 
				    <input type="submit" name="next" value="NEXT"/> 
				    <input type="submit" name="back" value="BACK"/>
				    <!-- <input type="reset" name="reset" value="RESET"/> --> 
				    <input type="submit" name="exit" value="EXIT"/>
				</center>
			</div>


<!--<div id="footer">
    <a href="#"></a>
</div>-->
</body>
</html>