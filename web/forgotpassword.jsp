<%@page import="utilpack.ReadPropUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<title>Landlord Tenant System - Data Administrator</title>
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
        var fpwdtype = document.getElementById('fpwdtype').value;
        if(fpwdtype=="landlord"){
            document.getElementById('lluserid').focus();
        }
        if(fpwdtype=="dba"){
            document.getElementById('dbauserid').focus();
        }
        if(fpwdtype=="tenant"){
            document.getElementById('tuserid').focus();
        }
        
    }
    window.onload = codeAddress;
    function toHome(){
        document.forms.forgotpwdform.action = "index.html";
    }
    function toBack(){
        var fpwdtype = document.getElementById('fpwdtype').value;
        if(fpwdtype=="dba"){
            document.forms.forgotpwdform.action = "dbalogin.jsp";
        }
        if(fpwdtype=="landlord"){
            document.forms.forgotpwdform.action = "landlordlogin.jsp";
        }
        if(fpwdtype=="tenant"){
            document.forms.forgotpwdform.action = "tenantlogin.jsp";
        }
    }
    function toSubmit(){
	var fpwdtype = document.getElementById('fpwdtype').value;
        if(fpwdtype=="landlord"){
            if(document.getElementById('lluserid').value == ""){
                alert('Enter Land Lord Login Id');
                document.getElementById('lluserid').focus();
                return false;
            }
           if(document.getElementById('lluserid').value!= null){
            alert('lluserid Form Submit');
            document.forms.forgotpwdform.action = "forgotPasswordServlet";
            return true;
            } 
        }
        if(fpwdtype=="dba"){
            if(document.getElementById('dbauserid').value == ""){
                alert('Enter Data Administrator Login Id');
                document.getElementById('dbauserid').focus();
                return false;
            }
            if(document.getElementById('dbauserid').value!= null){
            alert('dbauserid Form Submit');
            document.forms.forgotpwdform.action = "forgotPasswordServlet";
            return true;
            }
        }
        if(fpwdtype=="tenant"){
            if(document.getElementById('tuserid').value == ""){
                alert('Enter Tenant Login Id');
                document.getElementById('tuserid').focus();
                return false;
            }
            if(document.getElementById('tuserid').value!= null){
            alert('tuserid Form Submit');
            document.forms.forgotpwdform.action = "forgotPasswordServlet";
            return true;
            }
        }
        
        return false;
    }
    function toNext(){
        var fpwdtype = document.getElementById('fpwdtype').value;
        if(fpwdtype=="landlord"){
            document.forms.forgotpwdform.action = "landlordregister.jsp";
        }
        if(fpwdtype=="dba"){
            document.forms.forgotpwdform.action = "dbaregister.jsp";
        }
        if(fpwdtype=="tenant"){
            document.forms.forgotpwdform.action = "tenantregister.jsp";
        }
        
        return true;
    }
    function toReset(){
        var fpwdtype = document.getElementById('fpwdtype').value;
        if(fpwdtype=="landlord"){
            document.getElementById('lluserid').value = "";
        }
        if(fpwdtype=="dba"){
            document.getElementById('dbauserid').value = "";
        }
        if(fpwdtype=="tenant"){
            document.getElementById('tuserid').value = "";
        }
          
    }
    function toExit(){
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
                               
			</ul>
	</li>
	<li><a href="aboutus.jsp" title="<%=ReadPropUtil.Aboutus %>">About us</a></li>
	<li><a href="contactus.jsp" title="<%=ReadPropUtil.Contactus %>">Contact us</a></li>
</ul>
<%
String forgotPwdUserType = request.getParameter("usertype");
%>
<div style="margin-top: 20px;text-align: center;" align="right">
<table align="center" style="margin-bottom: 2px;">
      	<tr> 
      		<td style="width: 600px;">
      			<p>
      				
      				<section class="container11">
				    <div class="login11" style="width: 470px;">
				      
                <%if(forgotPwdUserType.equals("dba")){%>
                    <h1>Data Administrator Forgot Password Form</h1>                       
                <%}%>
		<%if(forgotPwdUserType.equals("landlord")){%>
                    <h1>Land Lord Forgot Password Form</h1>                        
                <%}%>		        
		<%if(forgotPwdUserType.equals("tenant")){%>
                    <h1>Tenant Forgot Password Form</h1>                       
                <%}%>
				      <form name="forgotpwdform" method="post" autocomplete="off" action="">
                                          <input type="hidden" name="fpwdtype" id="fpwdtype" value="<%=forgotPwdUserType%>"/>
				      <%
				      		String status = (String)session.getAttribute("dbaloginstatus");
				      		session.removeAttribute("dbaloginstatus");		
				      		if(status!=null){
				      		if(status.equals("fails")){
				      %>
				      <p><center><font color="black">Sending password got failed</font></center></p>
				      <% }else if(status.equals("success")){%>
				      <p><center><font color="black">Password send to your registered mail</font></center></p>
				      <%} }%>
                <%if(forgotPwdUserType.equals("dba")){%>
                    <p></br><input type="text" id="dbauserid" name="dbauserid" placeholder="Enter dba login id"/></p>                        
                <%}%>
		<%if(forgotPwdUserType.equals("landlord")){%>
                    <p></br><input type="text" id="lluserid" name="lluserid" placeholder="Enter land lord login id"/></p>                        
                <%}%>		        
		<%if(forgotPwdUserType.equals("tenant")){%>
                    <p></br><input type="text" id="tuserid" name="tuserid" placeholder="Enter tenant login id"/></p>                        
                <%}%>		        
				        <p class="submit">
                                        We will send you the password on your personal email address which you have
provided at the time of registration.   
				        <input type="submit" name="sendpwd" onclick="return toSubmit();" value="Send my password"/>
				        </p></br>
                                        
				        <center>
                                            <input type="submit" name="home" onclick="return toHome()" value="HOME" />
                                            <input type="submit" name="submit" onclick="return toSubmit();" value="SUBMIT"/>
				            <input type="submit" name="next" onclick="return toNext();" value="NEXT"/> 
				            <input type="submit" name="back" onclick="return toBack()" value="BACK" />
				            <input type="reset" name="reset" onclick="return toReset();" value="RESET"/> 
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