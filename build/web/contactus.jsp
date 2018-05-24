<%@page import="utilpack.ReadPropUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Landlord Tenant System - ContactUs</title>
<link rel="shortcut icon" href="img/project logo.png"
	type="image/x-icon" />
<link href="./css/style.css" rel="stylesheet" type="text/css"/>
<link href="./css/custom.css" rel="stylesheet" type="text/css"/>
<style>
.teamclass {
	font-family:Arial, Helvetica, sans-serif;
	color:#666;
	font-size:12px;
	text-shadow: 1px 1px 0px #fff;
	background:#eaebec;
	margin:20px;
	border:#ccc 1px solid;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;
	-moz-box-shadow: 0 1px 2px #d1d1d1;
	-webkit-box-shadow: 0 1px 2px #d1d1d1;
	box-shadow: 0 1px 2px #d1d1d1;
}
.teamclass th {
	padding:15px 25px 16px 25px;
	border-top:1px solid #fafafa;
	border-bottom:1px solid #e0e0e0;
	background: #ededed;
	background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#ebebeb));
	background: -moz-linear-gradient(top,  #ededed,  #ebebeb);
}
.teamclass th:first-child {
	text-align: left;
	padding-left:20px;
}
.teamclass tr:first-child th:first-child {
	-moz-border-radius-topleft:3px;
	-webkit-border-top-left-radius:3px;
	border-top-left-radius:3px;
}
.teamclass tr:first-child th:last-child {
	-moz-border-radius-topright:3px;
	-webkit-border-top-right-radius:3px;
	border-top-right-radius:3px;
}
.teamclass tr {
	text-align: center;
	padding-left:20px;
}
.teamclass td:first-child {
	text-align: left;
	padding-left:20px;
	border-left: 0;
}
.teamclass td {
	padding:18px;
	border-top: 1px solid #ffffff;
	border-bottom:1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;

	background: #fafafa;
	background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb), to(#fafafa));
	background: -moz-linear-gradient(top,  #fbfbfb,  #fafafa);
}
.teamclass tr.even td {
	background: #f6f6f6;
	background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8), to(#f6f6f6));
	background: -moz-linear-gradient(top,  #f8f8f8,  #f6f6f6);
}
.teamclass tr:last-child td {
	border-bottom:0;
}
.teamclass tr:last-child td:first-child {
	-moz-border-radius-bottomleft:3px;
	-webkit-border-bottom-left-radius:3px;
	border-bottom-left-radius:3px;
}
.teamclass tr:last-child td:last-child {
	-moz-border-radius-bottomright:3px;
	-webkit-border-bottom-right-radius:3px;
	border-bottom-right-radius:3px;
}
.teamclass tr:hover td {
	background: #f2f2f2;
	background: -webkit-gradient(linear, left top, left bottom, from(#f2f2f2), to(#f0f0f0));
	background: -moz-linear-gradient(top,  #f2f2f2,  #f0f0f0);	
}
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
<script>
    function toHome(){
        document.forms.loginform.action = "index.html";
    }
    function toNext(){
        document.forms.loginform.action = "contactus.jsp";
        return true;
    }
    function toBack(){
        document.forms.loginform.action = "aboutus.jsp";
        return true;
    }
    function toReset(){
        document.getElementById('firstname').value = "";
        document.getElementById('lastname').value = "";
        document.getElementById('email').value = "";
        document.getElementById('contactno').value = "";
        document.getElementById('enquiry').value = "";
        document.getElementById('firstname').focus();
        return true;
    }
    function toExit(){
        if (confirm("Close Window?")) {
          window.close();
          
        }
    }
    function toSubmit(){
        var mailPattern = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	var firstname = document.getElementById('firstname').value;
	var lastname = document.getElementById('lastname').value;
	var email = document.getElementById('email').value;
        var contactno = document.getElementById('contactno').value;
        var enquiry = document.getElementById('enquiry').value;
        if(firstname=="")
        {
            alert("Enter FirstName");
            document.getElementById('firstname').focus();
            return false;
        }
        if(!isNaN(firstname))
        {
            alert("Enter Character Only");
            document.getElementById('firstname').focus();
            return false;
        }
        if(lastname=="")
        {
            alert("Enter LastName");
            document.getElementById('lastname').focus();
            return false;
        }
        if(!isNaN(lastname))
        {
            alert("Enter Character Only");
            document.getElementById('lastname').focus();
            return false;
        }
        
            if(email==0){
                alert("Enter your Mailid");
                document.getElementById('email').focus();
                return false;
            }
            if(!mailPattern.test(email)){
                alert("Enter valid Mailid");
                document.getElementById('email').focus();
                return false;
            } 
            if(contactno==""){
                alert("Please enter the Mobile number");
                document.getElementById('contactno').focus();
                return false;
            }
            if(isNaN(contactno)){
                alert("Please enter the Correct Mobile number");
                document.getElementById('contactno').focus();
                return false;
            }
            if(contactno.length<9  ){
                alert("invalid mobile number");
                document.getElementById('contactno').focus();
                return false;
            }
            if(contactno.length>12 ){
                alert("invalid mobile number");
                document.getElementById('contactno').focus();
                return false;
            }
            if(enquiry=="")
            {
                alert("Enter enquiry details");
                document.getElementById('enquiry').focus();
                return false;
            }
        return false;
    }
</script>
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
		<li><a href="index.html" title="<%= ReadPropUtil.Home%>">Home</a></li>
                <li><a href="#" title="<%= ReadPropUtil.Login%>">Login &#9660;</a>
                        <ul>
                                <li><a href="dbalogin.jsp" title="<%=ReadPropUtil.DataAdministratorLogin %>">Data Administrator</a></li>
                                <li><a href="landlordlogin.jsp" title="<%=ReadPropUtil.LandLordLogin %>">LandLord</a></li>
                                <li><a href="tenantlogin.jsp" title="<%=ReadPropUtil.TenantLogin %>">Tenant</a></li>
                        </ul>
                </li>
                <li><a href="#" title="<%=ReadPropUtil.Register %>">Register &#9660;</a>
                        <ul>
                                <li><a href="dbaregister.jsp" title="<%=ReadPropUtil.DataAdministratorReg %>">Data Administrator</a></li>
                                <li><a href="landlordregister.jsp" title="<%=ReadPropUtil.LandLordReg %>">LandLord</a></li>
                                <li><a href="tenantregister.jsp" title="<%=ReadPropUtil.TenantReg %>">Tenant</a></li>
                        </ul>
                </li>
                <li><a href="#" title="<%=ReadPropUtil.Evaluate %>">Evaluate Us &#9660;</a>
                        <ul>
                            <li><a href="rateproperty.jsp" title="<%=ReadPropUtil.RateProperty %>">Rate Property</a></li>
                            <li><a href="ratelandLord.jsp" title="<%=ReadPropUtil.RateLandLord %>">Rate LandLord</a></li>
                            <li><a href="ratetenant.jsp" title="<%=ReadPropUtil.RateTenant %>">Rate Tenant</a></li>
                        </ul>
                </li>
<%
    if((String)session.getAttribute("session_ll_userid")!=null){
%>
                <li><a href="postproperties.jsp" title="<%=ReadPropUtil.PostProperty %>">Add Property</a></li>
<%}%>
                <li><a href="#" title="<%=ReadPropUtil.Reports %>">Reports &#9660;</a>
                                <ul>
                                        <li><a href="myaccount.jsp" title="<%=ReadPropUtil.MyAccount %>">My Account</a></li>
                                        <li><a href="updatedatabase.jsp" title="<%=ReadPropUtil.UpdateDatabase %>">Update Database</a></li>
                                        <li><a href="propertydetails.jsp" title="<%=ReadPropUtil.PropertyDetails %>">Property Details</a></li>
                                </ul>
                </li>
                <li style="margin-right: 200px;"><a href="#" title="<%=ReadPropUtil.QueryRequest %>">Query Request &#9660;</a>
                                <ul>
                                        <li><a href="viewpostedproperty.jsp" title="<%=ReadPropUtil.PropertyInformation %>">Property Information</a></li>
                                        <li><a href="viewallratings.jsp" title="<%=ReadPropUtil.RatingInformation %>">Rating Information</a></li>

                                </ul>
                </li>
                <li><a href="aboutus.jsp" title="<%=ReadPropUtil.Aboutus %>">About us</a></li>
                <li class="current"><a href="contactus.jsp" title="<%=ReadPropUtil.Contactus %>">Contact us</a></li>
	</ul>
        <!--
	<div style="margin: 50px 120px 0px 130px;text-align: left;">
	
		<font size="5" color="black" face="cursive">Contact Us</font>
		</br>
                <form name="loginform" method="post" autocomplete="off" action="">
			<table>
				<tr>
					<td >
                                            <p>First Name </br><input type="text" style="margin-right: 80px;" id="firstname" name="firstname" class="username" placeholder="First Name"/></p>
				            <p>Last Name </br><input type="text" id="lastname" name="lastname" value="" placeholder="Last Name"/></p>
				            <p>How can you contact to you? </br>
                                                <input type="checkbox" name="emailcheck" value="Email"/> 
				        	<input type="text" id="email" name="email" placeholder="Email"/>
                                                
				        </p>
				        <p></br>
                                               <input type="checkbox" name="contactnocheck"  value="ContactNo"/>
                                               <input type="text" id="contactno" name="contactno" placeholder="Contact number"/>
                                                 
				        </p>
				        
					</td>
					<td>
						<p>Inquiry For </br>
							<textarea rows="14" cols="90" id="enquiry" name="enquiry" placeholder="Details of your enquiry..."></textarea>
							<p class="submit"><input  type="submit" onclick="return toSubmit();" name="submit" value="SUBMIT"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</p>
					</td>
				</tr>
				
			</table>			
                
	

	</div>-->
<%
            String session_dba_userid = (String)session.getAttribute("session_dba_userid"); 
            String session_ll_userid = (String)session.getAttribute("session_ll_userid"); 
            String session_t_userid = (String)session.getAttribute("session_t_userid");       
if(session_dba_userid!=null){
%>
<p style="margin-left: 950px;">Data Administrator User : <b><%=(String)session.getAttribute("session_dba_firstname")%> <%=(String)session.getAttribute("session_dba_lastname")%></b> <a href="logout.jsp?dba=true">Logout</a>   
<%   
}
else if(session_ll_userid!=null){
%>
<p style="margin-left: 950px;">LandLord User : <b><%=(String)session.getAttribute("session_ll_firstname")%> <%=(String)session.getAttribute("session_ll_lastname")%></b> <a href="logout.jsp?ll=true">Logout</a> 
<%    
}
else if(session_t_userid!=null){
%>
<p style="margin-left: 950px;">Tenant User : <b><%=(String)session.getAttribute("session_t_firstname")%> <%=(String)session.getAttribute("session_t_lastname")%></b> <a href="logout.jsp?t=true">Logout</a>                
<%     
}
%>
        <div style="margin: 10px 120px 0px 80px;text-align: left;">
	<!-- <div style="margin-top: 70px;text-align: left;"> -->
		
		</br> 
		<font size="4" color="black" face="cursive">Our Team</font>
		</br> 
                
		<table border="1" class="" style="width: 100%;">
			<thead>
			<tr>
                                <th>First Name</th>
				<th style="text-align: left;">Last Name</th>
				<th style="text-align: left;">Email Id</th>
				<th style="text-align: right;">Phone</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>Varun Reddy</td>
				<td style="text-align: left;">Kathi</td>
                                <td style="text-align: left;"><a href="https://outlook.live.com" class="fa fa-mail">kathiv@mail.sacredheart.edu</a></td>
                                <td style="text-align: right;"><a href="tel:+14754498040"><img src="img/phone-icon.png" alt="" style="width:15px;height:15px;"/>&nbsp;&nbsp;</a>475-449- 8040</td>
                                
			</tr>
			<tr>
				<td>Appalaraju</td>
				<td style="text-align: left;">Mudunuri</td>
                                <td style="text-align: left;"><a href="https://outlook.live.com" class="fa fa-mail">mudunuria@mail.sacredheart.edu</a></td>
                                <td style="text-align: right;"><a href="tel:+12035228881"><img src="img/phone-icon.png" alt="" style="width:15px;height:15px;"/>&nbsp;&nbsp;</a>203-522- 8881</td>
			</tr>
			<tr>
				<td>Manikanta</td>
				<td style="text-align: left;">Gutta</td>
                                <td style="text-align: left;"><a href="https://outlook.live.com" class="fa fa-mail">guttam@mail.sacredheart.edu</a></td>
                                <td style="text-align: right;"><a href="tel:+12034556457"><img src="img/phone-icon.png" alt="" style="width:15px;height:15px;"/>&nbsp;&nbsp;</a>203-455- 6457</td>
			</tr>
			<tr>
				<td>Srikanth</td>
				<td style="text-align: left;">Yellampalli</td>
                                <td style="text-align: left;"><a href="https://outlook.live.com" class="fa fa-mail">yellampalis@mail.sacredheart.edu</a></td>
                                <td style="text-align: right;"><a href="+12035141342"><img src="img/phone-icon.png" alt="" style="width:15px;height:15px;"/>&nbsp;&nbsp;</a>203-514- 1342</td>
			</tr>
			<tr>
				<td>Sairam</td>
				<td style="text-align: left;">Viswanadhuni</td>
                                <td style="text-align: left;"><a href="https://outlook.live.com" class="fa fa-mail">viswanadhunis@mail.sacredheart.edu</a></td>
                                <td style="text-align: right;"><a href="tel:+14759883853"><img src="img/phone-icon.png" alt="" style="width:15px;height:15px;"/>&nbsp;&nbsp;</a>475-988- 3853</td>
			</tr>
			</tbody>
		</table>
		</br>

		
	</div>
			<div style=" text-align: center; margin-bottom: 5px;">
                            <form name="loginform" method="post" autocomplete="off" action="">
				<center>
				    <input type="submit" name="home" onclick="return toHome()" value="HOME"/>
				    <input type="submit" name="next" onclick="return toNext();" value="NEXT"/> 
				    <input type="submit" name="back" onclick="return toBack()" value="BACK"/>
				    <!--<input type="reset" name="reset" onclick="return toReset();" value="RESET"/>-->
				    <input type="submit" name="exit" onclick="return toExit();" value="EXIT"/>
				</center>
                            </form>
			</div>
                    

<!--<div id="footer">
    <a href="#"></a>
</div>-->
</body>
</html>