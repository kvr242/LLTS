<%@page import="DBCon.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="utilpack.ReadPropUtil"%>
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
<script src="js/jquery-latest.js"></script>
<script>
    
</script>
</head>
<body>
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
            String session_dba_userid = (String)session.getAttribute("session_dba_userid");
            String session_ll_userid = (String)session.getAttribute("session_ll_userid");
            String session_t_userid = (String)session.getAttribute("session_t_userid");
            //System.out.println("session_dba_userid : "+session_dba_userid);
            //System.out.println("session_ll_userid : "+session_ll_userid);
            //System.out.println("session_t_userid : "+session_t_userid);
    if(session_dba_userid!=null){
    %>
    <p style="margin-left: 950px;">Data Administrator User : <b><%=(String)session.getAttribute("session_dba_firstname")%> <%=(String)session.getAttribute("session_dba_lastname")%></b> <a href="logout.jsp?dba=true">Logout</a>
    
    <%
    }else if(session_ll_userid!=null){
    %>
 <p style="margin-left: 950px;">LandLord User : <b><%=(String)session.getAttribute("session_ll_firstname")%> <%=(String)session.getAttribute("session_ll_lastname")%></b> <a href="logout.jsp?ll=true">Logout</a>
       
    <%
    }else if(session_t_userid!=null){
    %>
    <p style="margin-left: 950px;">Tenant User : <b><%=(String)session.getAttribute("session_t_firstname")%> <%=(String)session.getAttribute("session_t_lastname")%></b> <a href="logout.jsp?t=true">Logout</a>
    
    <%}%>
        
    
    <%
    if(session_dba_userid==null && session_ll_userid==null && session_t_userid==null){
    %>
	<div style="margin-top: 120px; text-align: center;">
		<font size="6" color="black" face="cursive">Update Database details.</font>
		</br></br> </br> </br>
	</div>
			<div style="margin-top: 85px; text-align: center; margin-bottom: 100px;">
                            <form name="nonloginupdatedbform" method="post" autocomplete="off" action="">
				<center>
                                    <input type="submit" name="home"  onclick="return toNonLoginUpdateDbHome()" value="HOME"/> 
                                    <input type="submit" name="next" onclick="return toNonLoginUpdateDbNext();" value="NEXT"/> 
                                    <input type="submit" name="back" onclick="return toNonLoginUpdateDbBack()" value="BACK"/>
                                    <!--<input type="reset" name="reset" onclick="return toNonLoginUpdateDbReset();" value="RESET"/> -->
                                    <input type="submit" name="exit" onclick="return toNonLoginUpdateDbExit();" value="EXIT"/>
                                </center>
                            </form>
			</div>

    <%}else if(session_dba_userid!=null){
        %>
    <div style="margin-top: 30px; text-align: center;">
		<font size="6" color="black" face="cursive">Data Administrator - Update Database details.</font>
        <form action="dbaupdateactionservlet" method="post" name="">
        <table border="1"  style="width: 100%;">
            <thead>
            <tr style="color: black;">
                <th>Date&Time</th>
                <th>Status</th>
                <th>UserId</th>
                <th>Regular Pwd</th>
                <th>Unique Pwd</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Role</th>
                <th>Action</th>
                <th>Update</th>
            </tr>
            </thead>
           <tbody>
            <%
                Connection con = DbConnection.getConnection();
                Statement stmt2 = con.createStatement();
                Statement stmt3 = con.createStatement();
                ResultSet rs2 = null;
                if(request.getParameter("llid")!=null){
                    rs2 = stmt2.executeQuery("SELECT * FROM landlordreg where userid='"+request.getParameter("llid")+"'");
                }
                if(request.getParameter("tid")!=null){
                    rs2 = stmt2.executeQuery("SELECT * FROM tenantreg where userid='"+request.getParameter("tid")+"'");
                }
                
                
                while(rs2.next()){
                    
            %>
                
                    <tr>
                    <td><%=rs2.getString("regdate")%></td>
                    <td><%=rs2.getString("status")%></td>
                    <td><%=rs2.getString("userid")%><input type="hidden" value="<%=rs2.getString("userid")%>" name="userid"/></td>
                    <td><%=rs2.getString("password")%></td>
                    <td><%=rs2.getString("uniquepassword")%></td>
                    <td><input type="text" value="<%=rs2.getString("firstname")%>" name="firstname"/></td>
                   <td><input type="text" value="<%=rs2.getString("lastname")%>" name="lastname"/></td>
                    
            <%
                if(request.getParameter("llid")!=null){
            %>
            <td>LandLord</td>
            <input type="hidden" value="LandLord" name="usertype"/>
            <td><%=rs2.getString("status")%></td>
            <td><input type="submit" name="Submit" value="Update"></td>
              
            <%
                }
                if(request.getParameter("tid")!=null){
            %>
            <td>Tenant</td>
            <input type="hidden" value="Tenant" name="usertype"/>
            <td><%=rs2.getString("status")%></td>
            <td><input type="submit" name="Submit" value="Update"></td><%
                }
            %>        
                  
                    </tr>
                
            <%
                }
            %>
            </tbody>
        </table>
        </form>
	</br>
	</div>
	<div style="margin-top: 10px; text-align: center; margin-bottom: 30px;">
        <form name="loginupdatedbform" method="post" autocomplete="off" action="">
            <center>
                <input type="submit" name="home"  onclick="return toLoginUpdateDbHome()" value="HOME"/> 
                <input type="submit" name="next" onclick="return toLoginUpdateDbNext();" value="NEXT"/> 
                <input type="submit" name="back" onclick="return toLoginUpdateDbBack()" value="BACK"/>
                <input type="submit" name="exit" onclick="return toLoginUpdateDbExit();" value="EXIT"/>
            </center>
        </form>
	</div>
        <%
   
}else if(session_ll_userid!=null){
%>
<div style="margin-top: 120px; text-align: center;">
		<font size="6" color="black" face="cursive">LandLord - Update Database details.</font>
		</br></br> </br> </br>
	</div>
			<div style="margin-top: 85px; text-align: center; margin-bottom: 100px;">
                            <form name="nonloginupdatedbformll" method="post" autocomplete="off" action="">
				<center>
                                    <input type="submit" name="home"  onclick="return toNonLoginUpdateDbHomell()" value="HOME"/> 
                                    <input type="submit" name="next" onclick="return toNonLoginUpdateDbNextll();" value="NEXT"/> 
                                    <input type="submit" name="back" onclick="return toNonLoginUpdateDbBackll()" value="BACK"/>
                                    <input type="submit" name="exit" onclick="return toNonLoginUpdateDbExitll();" value="EXIT"/>
                                </center>
                            </form>
			</div>
<%    
}else if(session_t_userid!=null){
%>
<div style="margin-top: 120px; text-align: center;">
		<font size="6" color="black" face="cursive">Tenant - Update Database details.</font>
		</br></br> </br> </br>
	</div>
			<div style="margin-top: 85px; text-align: center; margin-bottom: 100px;">
                            <form name="nonloginupdatedbform22" method="post" autocomplete="off" action="">
				<center>
                                    <input type="submit" name="home"  onclick="return toNonLoginUpdateDbHome22()" value="HOME"/> 
                                    <input type="submit" name="next" onclick="return toNonLoginUpdateDbNext22();" value="NEXT"/> 
                                    <input type="submit" name="back" onclick="return toNonLoginUpdateDbBack22()" value="BACK"/>
                                    <input type="submit" name="exit" onclick="return toNonLoginUpdateDbExit22();" value="EXIT"/>
                                </center>
                            </form>
			</div>
<%     
}
        
        %>
<!--<div id="footer">
    <a href="#"></a>
</div>-->
</body>
</html>