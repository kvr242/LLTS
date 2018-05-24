<%@page import="utilpack.ReadPropUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<title>Landlord Tenant System - Tenant</title>
<link rel="shortcut icon" href="img/project logo.png" type="image/x-icon"/>
<link href="./css/style.css" rel="stylesheet" type="text/css"/>
<link href="./css/custom.css" rel="stylesheet" type="text/css"/>
<style>

/* main level link hover */
#nav .current a, #nav li:hover > a {
	//background: #666 url(img/gradient.png) repeat-x 0 -40px; //change
        background: white url(img/gradient.png) repeat-x 0 -40px;
	color: #444;
	border-top: solid 1px #f8f8f8;

	-webkit-box-shadow: 0 1px 1px rgba(0,0,0, .2);
	-moz-box-shadow: 0 1px 1px rgba(0,0,0, .2);
	box-shadow: 0 1px 1px rgba(0,0,0, .2);

	text-shadow: 0 1px 0 rgba(255,255,255, 1);
}
</style>
<script>
    function codeAddress() {
        
        document.getElementById('tUserId').focus();
    }
    window.onload = codeAddress;
    function toHome(){
        document.forms.loginform.action = "index.html";
    }
    function toBack(){
        document.forms.loginform.action = "landlordlogin.jsp";
    }
    function toSubmit(){
	var tUserId = document.getElementById('tUserId').value;
	var tUserpassword = document.getElementById('tUserpassword').value;
	
        if(tUserId == null || tUserId ==""){
           alert('Enter user id ');
            document.getElementById('tUserId').focus();
           return false;
        }
        if(tUserpassword == null || tUserpassword == ""){
            alert('Enter password');
            document.getElementById('tUserpassword').focus();
            return false;
        }
        
        if(tUserId!= null && tUserpassword!= null){
            //alert('Form Submit');
            document.forms.loginform.action = "tloginservlet";
            return true;
        }
        return false;
    }
    function toNext(){
        document.forms.loginform.action = "dbaregister.jsp";
    }
    function toReset(){
        document.getElementById('lltUserId').value = "";
        document.getElementById('lltUserpassword').value = "";
        
        document.getElementById('lltUserId').focus();
    }
    function toExit(){
        //document.forms.loginform.action = "logout.jsp?t=true";
       if (confirm("Close Window?")) {
          window.close();
          
        }
    }
</script>
</head>
<body>
<% 
        new ReadPropUtil().getPropValues();
%>
<table>
	<tr>
		<td><img src="img/project logo.png" width="110" height="100"></img></td>
		<td><font size="6" color="black"  face="cursive">LandLord Tenant System</font></td>
	</tr>
</table>
<ul id="nav">
	<li><a href="index.html" title="<%= ReadPropUtil.Home%>">Home</a></li>
	<li class="current"><a href="#" title="<%= ReadPropUtil.Login%>">Login &#9660;</a>
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
	<li ><a href="postproperties.jsp" title="<%=ReadPropUtil.PostProperty %>">Add Property</a></li>
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
                                <!--<li><a href="myprofile.jsp">My Profile</a></li>-->
			</ul>
	</li>
	<li><a href="aboutus.jsp" title="<%=ReadPropUtil.Aboutus %>">About us</a></li>
	<li><a href="contactus.jsp" title="<%=ReadPropUtil.Contactus %>">Contact us</a></li>
</ul>

<div style="margin-top: 45px;text-align: center;" align="right">
<table align="center" style="margin-bottom: 40px;">
      	<tr> 
      		<td>
      			<p>
      				
      				<section class="container11">
				    <!--<div class="login11" style="width: 470px;">-->
                                    <div class="" style="width: 470px;">
				      <h1>Tenant Login Form</h1>
				      <form name="loginform" method="post" autocomplete="off" action="">
				      <%
				      		String status = (String)session.getAttribute("tloginstatus");
				      		session.removeAttribute("tloginstatus");		
				      		if(status!=null){
				      		if(status.equals("fails")){
				      %>
				      <p><center><font color="black">Login details are failed</font></center></p>
				      <% }else if(status.equals("session")){%>
				      <p><center><font color="black">Session Got Expaired!</font></center></p>
				      <%}
                                         else if(status.equals("tfpwdsucess")){%>
                                      <p><center><font color="black">Tenant your password retrieved and displayed in console successfully</font></center></p>
				      <%}
                                       else if(status.equals("tfpwdfails")){%>
                                      <p><center><font color="black">Tenant Lord your password retrieved and displayed in console fails</font></center></p>
				      <%}}%>
				        <p></br><input type="text" id="tUserId" name="tUserId" class="username" placeholder="Tenant Login Id"/></p>
				        <p><input type="password" id="tUserpassword" name="tUserpassword" value="" placeholder="Password"/></p>
				        
				        <p class="submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="forgotpassword.jsp?usertype=tenant">Forgot Password ?</a>
				        				  <!-- <input type="reset" name="commit" value="Clear"/>	 -->
				        </p></br>
				        <center>
                                            <input type="submit" name="home" onclick="return toHome()" value="HOME"/> 
                                            <input type="submit" name="submit"  onclick="return toSubmit();" value="SUBMIT"/>
                                            <input type="submit" name="next" onclick="return toNext();" value="NEXT"/> 
                                            <input type="submit" name="back" onclick="return toBack()" value="BACK"/>
                                            <!--<input type="reset" name="reset" onclick="return toReset();" value="RESET"/> -->
                                            <input type="submit" name="exit" onclick="return toExit();" value="EXIT"/>
				        </center>
				      </form>
				      
				    </div>
				
				  </section>
		      	</p>
      		</td>
      		 
      	<tr>
      </table>

</div>
<!--<div id="footer">
    <a href="#"></a>
</div>-->
</body>
</html>