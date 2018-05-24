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
    function toHome(){
        document.forms.regform.action = "index.html";
    }
    function toBack(){
        document.forms.regform.action = "landlordregister.jsp";
    }
    function toNext(){
        document.forms.regform.action = "rateproperty.jsp";
    }
    function toSubmit(){
        var mailPattern = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	
        var t_firstname = document.getElementById('t_firstname').value;
        var t_lastname = document.getElementById('t_lastname').value;
        var t_userid = document.getElementById('t_userid').value;
        var t_password = document.getElementById('t_password').value;
        //var t_t_password = document.getElementById('t_t_password').value;
        var t_email = document.getElementById('t_email').value;
        var t_contactno = document.getElementById('t_contactno').value;
        var t_securityquestion = document.getElementById('t_securityquestion').value;
        var t_securityanswer = document.getElementById('t_securityanswer').value;
        if(t_firstname=="")
        {
            alert("Enter First Name");
            document.getElementById('t_firstname').focus();
            return false;
        }
        if(!isNaN(t_firstname))
        {
            alert("Enter Character Only");
            document.getElementById('t_firstname').value="";
            document.getElementById('t_firstname').focus();
            return false;
        }
        if(t_lastname=="")
        {
            alert("Enter Last Name");
            document.getElementById('t_lastname').focus();
            return false;
        }
        if(!isNaN(t_lastname))
        {
            alert("Enter Character Only");
            document.getElementById('t_lastname').value="";
            document.getElementById('t_lastname').focus();
            return false;
        }
        if(t_userid=="")
        {
            alert("Enter User Id");
            document.getElementById('t_userid').focus();
            return false;
        }
        if(t_password=="")
        {
            alert("Enter User Password");
            document.getElementById('t_password').focus();
            return false;
        }
        /*if(t_t_password=="")
        {
            alert("Enter Data Administrator Password");
            document.getElementById('t_t_password').focus();
            return false;
        }*/
        if(t_contactno==""){
                alert("Please enter the Mobile number");
                document.getElementById('t_contactno').focus();
                return false;
        }
        if(isNaN(t_contactno)){
                alert("Please enter the Correct Mobile number");
                document.getElementById('t_contactno').value="";
                document.getElementById('t_contactno').focus();
                return false;
        }
        if(t_contactno.length<=9){
                alert("invalid mobile number");
                document.getElementById('t_contactno').value="";
                document.getElementById('t_contactno').focus();
                return false;
        }
        if(t_contactno.length>=11 ){
                alert("invalid mobile number");
                document.getElementById('t_contactno').value="";
                document.getElementById('t_contactno').focus();
                return false;
        } 
        if(t_email==0){
            alert("Enter your Mailid");
            document.getElementById('t_email').focus();
            return false;
        }
        if(!mailPattern.test(t_email)){
            alert("Enter valid Mailid");
            document.getElementById('t_email').value="";
            document.getElementById('t_email').focus();
            return false;
        }
        if(t_securityquestion=="Select"){
            alert("Please select security question");
            return false;
        }
        if(t_securityanswer==""){
            alert("Enter security answer");
            document.getElementById('t_securityanswer').focus();
            return false;
        }
           
        
        //return false;
        document.forms.regform.action = "tRegservlet";
    }
    function toExit(){
        if (confirm("Close Window?")) {
          window.close();
         
        }
    }
</script>
</head>
<body cz-shortcut-listen="true">
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
        <li><a href="#" title="<%= ReadPropUtil.Login%>">Login &#9660;</a>
		<ul>
			<li><a href="dbalogin.jsp" title="<%=ReadPropUtil.DataAdministratorLogin %>">Data Administrator</a></li>
			<li><a href="landlordlogin.jsp" title="<%=ReadPropUtil.LandLordLogin %>">LandLord</a></li>
                        <li><a href="tenantlogin.jsp" title="<%=ReadPropUtil.TenantLogin %>">Tenant</a></li>
		</ul>
	</li>
        <li class="current"><a href="#" title="<%=ReadPropUtil.Register %>">Register &#9660;</a>
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
<div style="margin-top: 0px;text-align: center;" align="right">
<table align="center" style="margin-bottom: 0px;">
      	<tr> 
            <td style="width: 600px;">
      		<p>
      		<section class="container11">
		<!--<div class="login11" style="width: 855px;margin-left: -160px;">-->
		<h1>Tenant Registration Form</h1>
                <div class="" style="width: 855px;margin-left: 50px;">
		<form name="regform" method="post" autocomplete="off" action="tRegservlet">
                    <input type="hidden" id="updatet" name="updatet" value="false"/> 
                <table>
                    <tr>
                            <td></td>
                            <td><font color="black" size="3" style="font-family: cursive;flex-align: right;">All fields are mandatory</font></td>
                    </tr>
                    <tr>
                            <td>
                                <p>
                                    <input type="text"  style="width: 270px;" id="t_firstname" name="t_firstname" class="username" placeholder="First Name"/>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                            </td>
                            <td>
                                <p>
                                    <input type="text"  style="width: 270px;" id="t_lastname" name="t_lastname" placeholder="Last Name"/>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                            </td>
                    </tr>
                    <tr>
                            <td>
                                <p>
                                    <input type="text"  style="width: 270px;" id="t_userid" name="t_userid" placeholder="UserId to use for login"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                            </td>
                            <td>
                                <p>
                                    <input type="password"  style="width: 270px;" id="t_password" name="t_password" placeholder="Create password"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                            </td>
                    </tr>
                    <tr>
                            <td>
                                
                                <p>
                                    <input type="text"  style="width: 270px;" id="t_contactno" name="t_contactno" placeholder="Best number to contact"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                            </td>
                            <td>
                                <p>
                                    <input type="text"  style="width: 270px;" id="t_email" name="t_email" placeholder="Enter Email Id"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                            </td>
                    </tr>
                    <tr>
                        <td>
                            <p>
                                <select id="t_securityquestion" name="t_securityquestion">
                                    <option value="Select">Select the security questions?</option>
                                    <option value="What was your childhood nickname?">What was your childhood nickname?</option>
                                    <option value="What is the name of your favorite childhood friend?">What is the name of your favorite childhood friend?</option>
                                    <option value="What school did you attend for sixth grade?">What school did you attend for sixth grade?</option>
                                    <option value="What was the name of your first stuffed animal?">What was the name of your first stuffed animal?</option>
                                </select>
                                <!--<font color="red" size="5">*</font>-->
                            </p>
                        </td>
                        <td>
                            <p>
                                <input type="text"  style="width: 270px;" id="t_securityanswer" name="t_securityanswer" placeholder="Answer here"/>
                                <!--<font color="red" size="5">*</font>-->
                            </p>
                        </td>
                    </tr>
                    
                </table>
                <center>
                <table style="margin-left: -240px;">
                    <tr>
                        <td>
                        <input type="submit" name="home" onclick="return toHome()" value="HOME"/> 
                        <input type="submit" name="commit" onclick="return toSubmit();" value="SUBMIT"/>
                        <!--<input type="reset" name="commit" value="RESET"/>-->
                        <input type="submit" name="next" onclick="return toNext();" value="NEXT"/> 
                        <input type="submit" name="back" onclick="return toBack()" value="BACK"/>
                        <input type="submit" name="exit" onclick="return toExit();" value="EXIT"/>
                        </td>
                    </tr>
                </table>
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