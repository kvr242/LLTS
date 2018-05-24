<%@page import="utilpack.ReadPropUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBCon.DbConnection"%>
<%@page import="java.sql.Connection"%>
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
<script type="text/javascript" src="./js/updatescript.js"></script>
</head>
<body >
<% 
        new ReadPropUtil().getPropValues();
    %>
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
                <li class="current"><a href="#" title="<%=ReadPropUtil.Reports %>">Reports &#9660;</a>
                                <ul>
                                        <li><a href="myaccount.jsp" title="<%=ReadPropUtil.MyAccount %>">My Account</a></li>
                                        <li><a href="updatedatabase.jsp" title="<%=ReadPropUtil.UpdateDatabase %>">Update Database</a></li>
                                        <li><a href="propertydetails.jsp" title="<%=ReadPropUtil.PropertyDetails %>">Property Details</a></li>
                                </ul>
                </li>
                <li style="margin-right: 150px;"><a href="#" title="<%=ReadPropUtil.QueryRequest %>">Query Request &#9660;</a>
                                <ul>
                                        <li><a href="viewpostedproperty.jsp" title="<%=ReadPropUtil.PropertyInformation %>">Property Information</a></li>
                                        <li><a href="viewallratings.jsp" title="<%=ReadPropUtil.RatingInformation %>">Rating Information</a></li>

                                </ul>
                </li>
                <li><a href="aboutus.jsp" title="<%=ReadPropUtil.Aboutus %>">About us</a></li>
                <li><a href="contactus.jsp" title="<%=ReadPropUtil.Contactus %>">Contact us</a></li>
	
        <%
            String session_dba_userid = (String)session.getAttribute("session_dba_userid");
            String session_ll_userid = (String)session.getAttribute("session_ll_userid");
            String session_t_userid = (String)session.getAttribute("session_t_userid");
            
            
            if(session_dba_userid!=null){
    %>
    <li><a href="logout.jsp?dba=true" title="<%=ReadPropUtil.Logout %>">Logout</a></li>
    </ul>
    <%
                Connection con = DbConnection.getConnection();
                
                String dba_firstname = "";
                String dba_lastname = "";
                String dba_userid = "";
                String dba_password = "";
                String dba_dba_password = "";
                String dba_contactno = "";
                String dba_email = "";
                String dba_securityquestion = "";
                String dba_securityanswer = "";
                try {
                    Statement stmt = con.createStatement();
                    
                    ResultSet rs = stmt.executeQuery("select * from dbareg where userid='"+ (String) session.getAttribute("session_dba_userid")+"'");
                    while(rs.next()) {
                        dba_firstname = rs.getString("firstname");
                        dba_lastname = rs.getString("lastname");
                        dba_userid = rs.getString("userid");
                        dba_password = rs.getString("password");
                        dba_dba_password = rs.getString("dbapassword");
                        dba_contactno = rs.getString("contactno");
                        dba_email = rs.getString("email");
                        dba_securityquestion = rs.getString("securityquestion");
                        dba_securityanswer = rs.getString("securityanswer");
                    }
                   
		} catch (Exception ex) {
                    ex.printStackTrace();
		}
        %>
<div style="margin-top: 0px;text-align: center;" align="right">
<!-- <p style="margin-left: 750px;">Data Administrator User : <b><%=(String)session.getAttribute("session_dba_firstname")%> <%=(String)session.getAttribute("session_dba_lastname")%></b> <a href="logout.jsp?dba=true">Logout</a>-->
<table align="center" style="margin-bottom: 0px;">
      	<tr> 
      		<td style="width: 600px;">
                    <p>
                    <section class="container11">
                    <!--<div class="login11" style="width: 855px;margin-left: -160px;">-->
                    <h1>Data Administrator Profile Page</h1>
                    <div class="" style="width: 855px;margin-left: 50px;">
                    <form name="dbaupdateform" method="post" autocomplete="off" action="">
                    <input type="hidden" id="updatedao" name="updatedao" value="true"/>
                    <table>
                        <tr>
                            <td></td>
                            <td><font color="black" size="3" style="font-family: cursive;flex-align: right;">All fields are mandatory</font></td>
                        </tr>
                        <tr>
                            <td>
                                <p>
                                    <input type="text"  style="width: 270px;" id="dba_firstname" name="dba_firstname" value="<%= dba_firstname%>"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                            </td>
                            <td>
                                <p>
                                    <input type="text"  style="width: 270px;" id="dba_lastname" name="dba_lastname" value="<%= dba_lastname%>"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>
                                    <input type="text"  style="width: 270px;" id="dba_userid" name="dba_userid" disabled value="<%= dba_userid%>"/>
                                    <input type="hidden" id="dba_userid" name="dba_userid1"  value="<%= dba_userid%>"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                            </td>
                            <td>
                                <p>
                                    <input type="password"  style="width: 270px;" id="dba_password" name="dba_password" value="<%= dba_password%>"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                
                                <p>
                                    <input type="text"  style="width: 270px;" id="dba_contactno" name="dba_contactno" value="<%= dba_contactno%>"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                            </td>
                            <td>
                                <p>
                                    <input type="text"  style="width: 270px;" id="dba_email" name="dba_email" value="<%= dba_email%>"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                               
                                <%
                                    if(dba_securityquestion.equals("What was your childhood nickname?")){
                                %>
                                <p>
                                    <select id="dba_securityquestion" name="dba_securityquestion">
                                        <option value="Select">Select the security questions?</option>
                                        <option selected value="What was your childhood nickname?">What was your childhood nickname?</option>
                                        <option value="What is the name of your favorite childhood friend?">What is the name of your favorite childhood friend?</option>
                                        <option value="What school did you attend for sixth grade?">What school did you attend for sixth grade?</option>
                                        <option value="What was the name of your first stuffed animal?">What was the name of your first stuffed animal?</option>
                                    </select>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                                <%
                                    }
                                %>
                                <%
                                    if(dba_securityquestion.equals("What is the name of your favorite childhood friend?")){
                                %>
                                <p>
                                    <select id="dba_securityquestion" name="dba_securityquestion">
                                        <option value="Select">Select the security questions?</option>
                                        <option value="What was your childhood nickname?">What was your childhood nickname?</option>
                                        <option selected value="What is the name of your favorite childhood friend?">What is the name of your favorite childhood friend?</option>
                                        <option value="What school did you attend for sixth grade?">What school did you attend for sixth grade?</option>
                                        <option value="What was the name of your first stuffed animal?">What was the name of your first stuffed animal?</option>
                                    </select>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                                <%
                                    }
                                %>
                                <%
                                    if(dba_securityquestion.equals("What school did you attend for sixth grade?")){
                                %>
                                <p>
                                    <select id="dba_securityquestion" name="dba_securityquestion">
                                        <option value="Select">Select the security questions?</option>
                                        <option value="What was your childhood nickname?">What was your childhood nickname?</option>
                                        <option value="What is the name of your favorite childhood friend?">What is the name of your favorite childhood friend?</option>
                                        <option selected value="What school did you attend for sixth grade?">What school did you attend for sixth grade?</option>
                                        <option value="What was the name of your first stuffed animal?">What was the name of your first stuffed animal?</option>
                                    </select>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                                <%
                                    }
                                %>
                                <%
                                    if(dba_securityquestion.equals("What was the name of your first stuffed animal?")){
                                %>
                                <p>
                                    <select id="dba_securityquestion" name="dba_securityquestion">
                                        <option value="Select">Select the security questions?</option>
                                        <option value="What was your childhood nickname?">What was your childhood nickname?</option>
                                        <option value="What is the name of your favorite childhood friend?">What is the name of your favorite childhood friend?</option>
                                        <option value="What school did you attend for sixth grade?">What school did you attend for sixth grade?</option>
                                        <option selected value="What was the name of your first stuffed animal?">What was the name of your first stuffed animal?</option>
                                    </select>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                                <%
                                    }
                                %>
                                <%
                                    if(dba_securityquestion.equals("") || dba_securityquestion.equals("null")){
                                %>
                                <p>
                                    <select id="dba_securityquestion" name="dba_securityquestion">
                                        <option value="Select">Select the security questions?</option>
                                        <option value="What was your childhood nickname?">What was your childhood nickname?</option>
                                        <option value="What is the name of your favorite childhood friend?">What is the name of your favorite childhood friend?</option>
                                        <option value="What school did you attend for sixth grade?">What school did you attend for sixth grade?</option>
                                        <option value="What was the name of your first stuffed animal?">What was the name of your first stuffed animal?</option>
                                    </select>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                                <%
                                    }
                                %>
                            </td>
                            <td>
                                <p>
                                    <input type="text"  style="width: 270px;" id="dba_securityanswer" name="dba_securityanswer" value="<%= dba_securityanswer%>"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                                
                            </td>
                        </tr>
                        
                    </table>
                    <center>
                        <table style="margin-left: -240px;">
                        <tr>
                        <td>
                        <input type="submit" name="home" onclick="return toDbaHome()" value="HOME"/> 
                        <input type="submit" name="commit" onclick="return toDbaSubmit();" value="UPDATE"/>
                        <!--<input type="reset" name="commit" value="RESET"/>-->
                        <input type="submit" name="next" onclick="return toDbaNext();" value="NEXT"/> 
                        <input type="submit" name="back" onclick="return toDbaBack()" value="BACK"/>
                        <input type="submit" name="exit" onclick="return toDbaExit();" value="EXIT"/>
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
        <%
            }else if(session_ll_userid!=null){
        %>
        <li><a href="logout.jsp?ll=true" title="<%=ReadPropUtil.Logout %>">Logout</a></li>
        </ul>
        <%
                Connection con = DbConnection.getConnection();
                String ll_firstname = "";
                String ll_lastname = "";
                String llt_agentname = "";
                String ll_userid = "";
                String ll_password = "";
                String ll_contactno = "";
                String ll_email = "";
                String ll_securityquestion = "";
                String ll_securityanswer = "";
                String ll_status = "";
                try {
                    Statement stmt1 = con.createStatement();
                    //System.out.println("select * from landlordreg where userid='"+ (String) session.getAttribute("session_ll_userid")+"'");
                    ResultSet rs1 = stmt1.executeQuery("select * from landlordreg where userid='"+ (String) session.getAttribute("session_ll_userid")+"'");
                    while(rs1.next()) {
                        ll_firstname = rs1.getString("firstname");
                        ll_lastname = rs1.getString("lastname");
                        llt_agentname = rs1.getString("agentname");
                        ll_userid = rs1.getString("userid");
                        ll_password = rs1.getString("password");
                        ll_contactno = rs1.getString("contactno");
                        ll_email = rs1.getString("email");
                        ll_securityquestion = rs1.getString("securityquestion");
                        ll_securityanswer = rs1.getString("securityanswer");
                        ll_status = rs1.getString("status");
                    }
                   
		} catch (Exception ex) {
                    ex.printStackTrace();
		}
                
                %>
<div style="margin-top: 0px;text-align: center;" align="right">
<p style="margin-left: 750px;">LandLord User : <b><%=(String)session.getAttribute("session_ll_firstname")%> <%=(String)session.getAttribute("session_ll_lastname")%></b>
<table align="center" style="margin-bottom: 0px;">
      	<tr> 
      		<td style="width: 600px;">
                    <p>
      				
                    <section class="container11">
                    <!--<div class="login11" style="width: 855px;margin-left: -160px;">-->
                    <h1>LandLord Profile Page</h1>
                    <div class="" style="width: 855px;margin-left: 50px;">
                    <form name="llupdateform" method="post" autocomplete="off" action="llRegservlet">
                    <input type="hidden" id="updatell" name="updatell" value="true"/>
                    <table>
                        <tr>
                            <td><font color="black" size="3" style="font-family: cursive;flex-align: right;margin-left: 200px;">All fields are mandatory</font></td>
                        </tr>
                    </table>
                    
                    <%
                        //System.out.println("=======================LL - "+ll_status+"=======================");
                        if(ll_status.equals("Change")){System.out.println("=======================LL - IF=======================");
                    %>
                    
                    
                    
                    <table>
                        <tr>
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" id="llt_firstname" name="llt_firstname" value="<%= ll_firstname%>"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                            </td>
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" id="llt_lastname" name="llt_lastname" value="<%= ll_lastname%>"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>
                                    <input type="text"  style="width: 270px;" id="llt_agentname" name="llt_agentname" value="<%= llt_agentname%>"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                            </td>
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" id="llt_userid" name="llt_userid" value="<%= ll_userid%>"/>
                                    <input type="hidden" id="llt_userid1" name="llt_userid1" value="<%= ll_userid%>"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                            </td>
                        </tr>
                        <tr>
                            
                            <td>
                                <p>
                                    <input type="password" style="width: 270px;" id="llt_password" name="llt_password" value="<%= ll_password%>"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                            </td>
                            <td>
                                
                                <p>
                                    <input type="text" style="width: 270px;" id="llt_contactno" name="llt_contactno" value="<%= ll_contactno%>"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                            </td>
                        </tr>                   
                        <tr>
                            
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" id="llt_email" name="llt_email" value="<%= ll_email%>"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                            </td>
                            <td>
                                
                                <%
                                    if(ll_securityquestion.equals("What was your childhood nickname?")){
                                %>
                                <p>
                                    <select id="llt_securityquestion" name="llt_securityquestion">
                                        <option value="Select">Select the security questions?</option>
                                        <option selected value="What was your childhood nickname?">What was your childhood nickname?</option>
                                        <option value="What is the name of your favorite childhood friend?">What is the name of your favorite childhood friend?</option>
                                        <option value="What school did you attend for sixth grade?">What school did you attend for sixth grade?</option>
                                        <option value="What was the name of your first stuffed animal?">What was the name of your first stuffed animal?</option>
                                    </select>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                                <%
                                    }
                                %>
                                <%
                                    if(ll_securityquestion.equals("What is the name of your favorite childhood friend?")){
                                %>
                                <p>
                                    <select id="llt_securityquestion" name="llt_securityquestion">
                                        <option value="Select">Select the security questions?</option>
                                        <option value="What was your childhood nickname?">What was your childhood nickname?</option>
                                        <option selected value="What is the name of your favorite childhood friend?">What is the name of your favorite childhood friend?</option>
                                        <option value="What school did you attend for sixth grade?">What school did you attend for sixth grade?</option>
                                        <option value="What was the name of your first stuffed animal?">What was the name of your first stuffed animal?</option>
                                    </select>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                                <%
                                    }
                                %>
                                <%
                                    if(ll_securityquestion.equals("What school did you attend for sixth grade?")){
                                %>
                                <p>
                                    <select id="llt_securityquestion" name="llt_securityquestion">
                                        <option value="Select">Select the security questions?</option>
                                        <option value="What was your childhood nickname?">What was your childhood nickname?</option>
                                        <option value="What is the name of your favorite childhood friend?">What is the name of your favorite childhood friend?</option>
                                        <option selected value="What school did you attend for sixth grade?">What school did you attend for sixth grade?</option>
                                        <option value="What was the name of your first stuffed animal?">What was the name of your first stuffed animal?</option>
                                    </select>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                                <%
                                    }
                                %>
                                <%
                                    if(ll_securityquestion.equals("What was the name of your first stuffed animal?")){
                                %>
                                <p>
                                    <select id="llt_securityquestion" name="llt_securityquestion">
                                        <option value="Select">Select the security questions?</option>
                                        <option value="What was your childhood nickname?">What was your childhood nickname?</option>
                                        <option value="What is the name of your favorite childhood friend?">What is the name of your favorite childhood friend?</option>
                                        <option value="What school did you attend for sixth grade?">What school did you attend for sixth grade?</option>
                                        <option selected value="What was the name of your first stuffed animal?">What was the name of your first stuffed animal?</option>
                                    </select>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                                <%
                                    }
                                %>
                                <%
                                    if(ll_securityquestion.equals("") || ll_securityquestion.equals("null")){
                                %>
                                <p>
                                    <select id="llt_securityquestion" name="llt_securityquestion">
                                        <option value="Select">Select the security questions?</option>
                                        <option value="What was your childhood nickname?">What was your childhood nickname?</option>
                                        <option value="What is the name of your favorite childhood friend?">What is the name of your favorite childhood friend?</option>
                                        <option value="What school did you attend for sixth grade?">What school did you attend for sixth grade?</option>
                                        <option value="What was the name of your first stuffed animal?">What was the name of your first stuffed animal?</option>
                                    </select>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                                <%
                                    }
                                %>
                            </td>
                        </tr>
                        <tr>
                            
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" id="llt_securityanswer" name="llt_securityanswer" value="<%= ll_securityanswer%>"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                                
                            </td>
                            
                        </tr>
                    </table>
                    
                    
                    
                    
                    
                    <%       
                        }
                        else{System.out.println("=======================LL - ELSE=======================");
                     %>
                    
                     
                     <table>
                        <tr>
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" disabled id="llt_firstname" name="llt_firstname" value="<%= ll_firstname%>"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                            </td>
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" disabled id="llt_lastname" name="llt_lastname" value="<%= ll_lastname%>"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>
                                    <input type="text"  style="width: 270px;" disabled id="llt_agentname" name="llt_agentname" value="<%= llt_agentname%>"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                            </td>
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" disabled id="llt_userid" name="llt_userid" value="<%= ll_userid%>"/>
                                    <input type="hidden" id="llt_userid1" name="llt_userid1" value="<%= ll_userid%>"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                            </td>
                        </tr>
                        <tr>
                            
                            <td>
                                <p>
                                    <input type="password" style="width: 270px;" disabled id="llt_password" name="llt_password" value="<%= ll_password%>"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                            </td>
                            <td>
                                
                                <p>
                                    <input type="text" style="width: 270px;" disabled id="llt_contactno" name="llt_contactno" value="<%= ll_contactno%>"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                            </td>
                        </tr>                   
                        <tr>
                            
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" disabled id="llt_email" name="llt_email" value="<%= ll_email%>"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                            </td>
                            <td>
                                
                                <input type="text" style="width: 270px;" disabled id="llt_securityquestion" name="llt_securityquestion" value="<%= ll_securityquestion%>"/>
                                
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                                
                            </td>
                        </tr>
                        <tr>
                            
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" disabled id="llt_securityanswer" name="llt_securityanswer" value="<%= ll_securityanswer%>"/>
                                    <!--<font color="red" size="5">*</font>-->
                                </p>
                                
                            </td>
                                    
                        </tr>
                    </table>
                     
                     
                     
                     
                    <%       
                        }
                    %>
                    
                    
                    
                    <center>
                        <table style="margin-left: -240px;">
                        <tr>
                            <td>
                            <input type="submit" name="home" onclick="return toLlHome()" value="HOME"/> 
                            <input type="submit" name="commit" onclick="return toLlSubmit();" value="UPDATE"/>
                            <!--<input type="reset" name="commit" value="RESET"/>-->
                            <input type="submit" name="next" onclick="return toLlNext();" value="NEXT"/> 
                            <input type="submit" name="back" onclick="return toLlBack()" value="BACK"/>
                            <input type="submit" name="exit" onclick="return toLlExit();" value="EXIT"/>
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
                <%
            }
            
            else if(session_t_userid!=null){
        %>
        <li><a href="logout.jsp?t=true" title="<%=ReadPropUtil.Logout %>">Logout</a></li>
        </ul>
        <%
              Connection con = DbConnection.getConnection();
                String t_firstname = "";
                String t_lastname = "";
                String t_userid = "";
                String t_password = "";
                String t_contactno = "";
                String t_email = "";
                String t_securityquestion = "";
                String t_securityanswer = "";
                String t_status = "";
                try {
                    Statement stmt2 = con.createStatement();
                    System.out.println("select * from tenantreg where userid='"+ (String) session.getAttribute("session_t_userid")+"'");
                    ResultSet rs2 = stmt2.executeQuery("select * from tenantreg where userid='"+ (String) session.getAttribute("session_t_userid")+"'");
                    while(rs2.next()) {
                        t_firstname = rs2.getString("firstname");
                        t_lastname = rs2.getString("lastname");
                        t_userid = rs2.getString("userid");
                        t_password = rs2.getString("password");
                        t_contactno = rs2.getString("contactno");
                        t_email = rs2.getString("email");
                        t_securityquestion = rs2.getString("securityquestion");
                        t_securityanswer = rs2.getString("securityanswer");
                        t_status = rs2.getString("status");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
		}
                %>
<div style="margin-top: 0px;text-align: center;" align="right">
<p style="margin-left: 750px;">Tenant User : <b><%=(String)session.getAttribute("session_t_firstname")%> <%=(String)session.getAttribute("session_t_lastname")%></b>
<table align="center" style="margin-bottom: 0px;">
      	<tr> 
            <td style="width: 600px;">
      		<p>
      		<section class="container11">
		<!--<div class="login11" style="width: 855px;margin-left: -160px;">-->
		<h1>Tenant Profile Page</h1>
                <div class="" style="width: 855px;margin-left: 50px;">
		<form name="tupdateform" method="post" autocomplete="off" action="tRegservlet">
                  <input type="hidden" id="updatet" name="updatet" value="true"/>  
                <table>
                    <tr>
                            <td></td>
                            <td><font color="black" size="3" style="font-family: cursive;flex-align: right;">All fields are mandatory</font></td>
                    </tr>
                    
                    <%
                    //System.out.println("=======================T - "+t_status+"=======================");
                        if(t_status.equals("Change")){System.out.println("=======================T - IF=======================");
                    %>
                        <tr>
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" id="t_firstname" name="t_firstname" class="username" value="<%= t_firstname%>"/>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                            </td>
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" id="t_lastname" name="t_lastname" value="<%= t_lastname%>"/>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                            </td>
                    </tr>
                    <tr>
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" id="t_userid" name="t_userid" value="<%= t_userid%>"/>
                                    <input type="hidden" id="t_userid1" name="t_userid1" value="<%= t_userid%>"/>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                            </td>
                            <td>
                                <p>
                                    <input type="password" style="width: 270px;" id="t_password" name="t_password" value="<%= t_password%>"/>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                            </td>
                    </tr>
                    <tr>
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" id="t_contactno" name="t_contactno" value="<%= t_contactno%>"/>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                            </td>
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" id="t_email" name="t_email" value="<%= t_email%>"/>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                            </td>
                    </tr>
                    <tr>
                        <td>
                            <%
                                if(t_securityquestion.equals("What was your childhood nickname?")){
                            %>
                                <p>
                                    <select id="t_securityquestion" name="t_securityquestion">
                                        <option value="Select">Select the security questions?</option>
                                        <option selected value="What was your childhood nickname?">What was your childhood nickname?</option>
                                        <option value="What is the name of your favorite childhood friend?">What is the name of your favorite childhood friend?</option>
                                        <option value="What school did you attend for sixth grade?">What school did you attend for sixth grade?</option>
                                        <option value="What was the name of your first stuffed animal?">What was the name of your first stuffed animal?</option>
                                    </select>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                            <%
                                }
                            %>
                            <%
                                if(t_securityquestion.equals("What is the name of your favorite childhood friend?")){
                            %>
                                <p>
                                    <select id="t_securityquestion" name="t_securityquestion">
                                        <option value="Select">Select the security questions?</option>
                                        <option value="What was your childhood nickname?">What was your childhood nickname?</option>
                                        <option selected value="What is the name of your favorite childhood friend?">What is the name of your favorite childhood friend?</option>
                                        <option value="What school did you attend for sixth grade?">What school did you attend for sixth grade?</option>
                                        <option value="What was the name of your first stuffed animal?">What was the name of your first stuffed animal?</option>
                                    </select>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                            <%
                                }
                            %>
                            <%
                                if(t_securityquestion.equals("What school did you attend for sixth grade?")){
                            %>
                                <p>
                                    <select id="t_securityquestion" name="t_securityquestion">
                                        <option value="Select">Select the security questions?</option>
                                        <option value="What was your childhood nickname?">What was your childhood nickname?</option>
                                        <option value="What is the name of your favorite childhood friend?">What is the name of your favorite childhood friend?</option>
                                        <option selected value="What school did you attend for sixth grade?">What school did you attend for sixth grade?</option>
                                        <option value="What was the name of your first stuffed animal?">What was the name of your first stuffed animal?</option>
                                    </select>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                            <%
                                }
                            %>
                            <%
                                if(t_securityquestion.equals("What was the name of your first stuffed animal?")){
                            %>
                                <p>
                                    <select id="t_securityquestion" name="t_securityquestion">
                                        <option value="Select">Select the security questions?</option>
                                        <option value="What was your childhood nickname?">What was your childhood nickname?</option>
                                        <option value="What is the name of your favorite childhood friend?">What is the name of your favorite childhood friend?</option>
                                        <option value="What school did you attend for sixth grade?">What school did you attend for sixth grade?</option>
                                        <option selected value="What was the name of your first stuffed animal?">What was the name of your first stuffed animal?</option>
                                    </select>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                            <%
                                }
                            %>
                            <%
                                if(t_securityquestion.equals("") || t_securityquestion.equals("null")){
                            %>
                            <p>
                                <select id="t_securityquestion" name="t_securityquestion">
                                    <option value="Select">Select the security questions?</option>
                                    <option value="What was your childhood nickname?">What was your childhood nickname?</option>
                                    <option value="What is the name of your favorite childhood friend?">What is the name of your favorite childhood friend?</option>
                                    <option value="What school did you attend for sixth grade?">What school did you attend for sixth grade?</option>
                                    <option value="What was the name of your first stuffed animal?">What was the name of your first stuffed animal?</option>
                                </select>
                                <!--<font color="black" size="5">*</font>-->
                            </p>
                            <%
                                }
                            %>
                        </td>
                        <td>
                            <p>
                                <input type="text" style="width: 270px;" id="t_securityanswer" name="t_securityanswer" value="<%= t_securityanswer%>"/>
                                <!--<font color="black" size="5">*</font>-->
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td></td>         
                           
                    </tr> 
                    <%       
                        }
                        else{ System.out.println("=======================T - ELSE=======================");
                     %>
                            
                     
                     
                     
                     <tr>
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" disabled id="t_firstname" name="t_firstname" class="username" value="<%= t_firstname%>"/>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                            </td>
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" disabled id="t_lastname" name="t_lastname" value="<%= t_lastname%>"/>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                            </td>
                    </tr>
                    <tr>
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" disabled id="t_userid" name="t_userid" value="<%= t_userid%>"/>
                                    <input type="hidden" id="t_userid1" name="t_userid1" value="<%= t_userid%>"/>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                            </td>
                            <td>
                                <p>
                                    <input type="password" style="width: 270px;" disabled id="t_password" name="t_password" value="<%= t_password%>"/>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                            </td>
                    </tr>
                    <tr>
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" disabled id="t_contactno" name="t_contactno" value="<%= t_contactno%>"/>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                            </td>
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" disabled id="t_email" name="t_email" value="<%= t_email%>"/>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                            </td>
                    </tr>
                    <tr>
                        <td>
                            
                            <p><input type="text" style="width: 270px;" disabled id="t_securityquestion" name="t_securityquestion" value="<%= t_securityquestion%>"/>
                                
                                <!--<font color="black" size="5">*</font>-->
                            </p>
                            
                        </td>
                        <td>
                            <p>
                                <input type="text" style="width: 270px;" disabled id="t_securityanswer" name="t_securityanswer" value="<%= t_securityanswer%>"/>
                                <!--<font color="black" size="5">*</font>-->
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td></td>         
                           
                    </tr> 
                     
                     
                     
                     
                     
                     
                     
                     
                    <%       
                        }
                    %>
                    
                        
                    
                </table>
                <center>
                <table style="margin-left: -240px;">
                    <tr>
                        <td>
                    <input type="submit" name="home" onclick="return toTHome()" value="HOME"/> 
                    <input type="submit" name="commit" onclick="return toTSubmit();" value="UPDATE"/>
                    <!--<input type="reset" name="commit" value="RESET"/>-->
                    <input type="submit" name="next" onclick="return toTNext();" value="NEXT"/> 
                    <input type="submit" name="back" onclick="return toTBack()" value="BACK"/>
                    <input type="submit" name="exit" onclick="return toTExit();" value="EXIT"/>
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
                <%
            }
            
            if(session_dba_userid==null && session_ll_userid==null && session_t_userid==null){
        %></ul>

	<div style="margin-top: 120px; text-align: center;">
		<font size="6" color="black" face="cursive">Please login to see all your details.</font>
		</br></br> </br> </br>
	</div>
	<div style="margin-top: 85px; text-align: center; margin-bottom: 100px;">
	<form name="nonloginmyaccountform" method="post" autocomplete="off" action="">
            <center>
                <input type="submit" name="home"  onclick="return toNonLoginHome()" value="HOME"/> 
                <input type="submit" name="next" onclick="return toNonLoginNext();" value="NEXT"/> 
                <input type="submit" name="back" onclick="return toNonLoginBack()" value="BACK"/>
                <!--<input type="reset" name="reset" onclick="return toNonLoginReset();" value="RESET"/> -->
                <input type="submit" name="exit" onclick="return toNonLoginExit();" value="EXIT"/>
            </center>
        </form>
	</div>
        <%}%>
<!--<div id="footer">
    <a href="#"></a>
</div>-->
</body>
</html>