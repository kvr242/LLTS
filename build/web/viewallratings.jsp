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
<script>
    function codeAddress() {
        document.getElementById('fullnamesearch').focus();
    }
    window.onload = codeAddress;
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
                <li><a href="#" title="<%=ReadPropUtil.Reports %>">Reports &#9660;</a>
                                <ul>
                                        <li><a href="myaccount.jsp" title="<%=ReadPropUtil.MyAccount %>">My Account</a></li>
                                        <li><a href="updatedatabase.jsp" title="<%=ReadPropUtil.UpdateDatabase %>">Update Database</a></li>
                                        <li><a href="propertydetails.jsp" title="<%=ReadPropUtil.PropertyDetails %>">Property Details</a></li>
                                </ul>
                </li>
                <li class="current" style="margin-right: 150px;"><a href="#" title="<%=ReadPropUtil.QueryRequest %>">Query Request &#9660;</a>
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
    <p style="margin-left: 950px;">Data Administrator User : <b><%=(String)session.getAttribute("session_dba_firstname")%> <%=(String)session.getAttribute("session_dba_lastname")%></b>
    <%
    }else if(session_ll_userid!=null){
    %>
    <li><a href="logout.jsp?ll=true" title="<%=ReadPropUtil.Logout %>">Logout</a></li>
    </ul> 
    <p style="margin-left: 950px;">LandLord User : <b><%=(String)session.getAttribute("session_ll_firstname")%> <%=(String)session.getAttribute("session_ll_lastname")%></b>
    <%
    }else if(session_t_userid!=null){
    %>
    <li><a href="logout.jsp?t=true" title="<%=ReadPropUtil.Logout %>">Logout</a></li>
    </ul>
    <p style="margin-left: 950px;">Tenant User : <b><%=(String)session.getAttribute("session_t_firstname")%> <%=(String)session.getAttribute("session_t_lastname")%></b>
    <%}
    if(session_dba_userid==null && session_ll_userid==null && session_t_userid==null){
    %>
    </ul>
    <%}%>        
        
        
<form name="tviewallratingsearchform" method="post">    
<div class="" style="width: 855px;margin-left: 50px;">
           
    <table style="margin-left: 300px;">
                <tr>
                    <td>
                    <p>
                    <input type="text" name="fullnamesearch" id="fullnamesearch" placeholder="Enter FirstName"/>
                    <!--<font color="black" size="5">*</font>-->
                    </p>
                    </td>
                
                <td>
                    <p>
                    <select id="typeofusersearch" name="typeofusersearch">
                        <option value="Select">Select Type Of User</option>
                        <option value="LandLord">LandLord</option>
                        <option value="Property">Property</option>
                        <option value="Tenant">Tenant</option>
                    </select>
                    <!--<font color="black" size="5">*</font>-->
                    </p>
                </td>
                
                <td><input type="submit" name="next" value="SEARCH" onclick="return toVARSearch()"/></td>
                </tr>
               
           </table>
        </div>
            </form>    
        </br> 
        
<%

if(session_t_userid!=null){%>   

        <div style="margin-top:10px; text-align: center;">
            <form name="tviewallratingsform" method="post" action="">  
	<font size="6" color="black" face="cursive">Tenant to view Ratings.</font>

        
<%}else if(session_dba_userid!=null){%>   

            <div style="margin-top:10px; text-align: center;">
            <form name="tviewallratingsform" method="post" action="">  
            <font size="6" color="black" face="cursive">Data Administrator to view Ratings.</font>
            
<%}else if(session_ll_userid!=null){%>   

            <div style="margin-top:10px; text-align: center;">
            <form name="tviewallratingsform" method="post" action="">  
            <font size="6" color="black" face="cursive">LandLord to view Ratings.</font>
            
<%}%> 
</br>
</div>        
        
      <%
       if(session_dba_userid==null && session_ll_userid==null && session_t_userid==null){
       %>
    
    
	<div style="margin-top: 10px; text-align: center;">
		<font size="6" color="black" face="cursive">Please login to view Ratings.</font>
		</br></br> </br> </br>
	</div>
			<div style="margin-top: 85px; text-align: center; margin-bottom: 100px;">
                            <form name="viewallratingwithoutloginform" method="post" action="">
				<center>
                                    <input type="submit" name="home" value="HOME" onclick="return toViewAllRatingsWOLHome()"/> 
				    <input type="submit" name="next" value="NEXT" onclick="return toLlViewAllRatingsWOLNext()"/> 
				    <input type="submit" name="back" value="BACK" onclick="return toLlViewAllRatingsWOLBack()"/>
				    <input type="submit" name="exit" value="EXIT" onclick="return toLlViewAllRatingsWOLExit()"/>
				</center>
                            </form>
			</div>
    <%}else{
    Connection con = DbConnection.getConnection();
            try {
                Statement stmt = con.createStatement();
if(request.getParameter("fullnamesearch")!=null || request.getParameter("typeofusersearch")!=null){                
    String ttsearchquery = "";
    
    if(request.getParameter("typeofusersearch").equals("LandLord")){
        ttsearchquery = "SELECT * FROM landlordrating where landlordid IN (SELECT userid FROM landlordreg where firstname LIKE '%"+request.getParameter("fullnamesearch")+"%')";
        %>
        </br>
        <table border="1" class="" style="width: 100%;">
            <thead>
            <tr style="color: black;">
                <th>rateid</th>
                <th>landlordid</th>
                <th>tenantid</th>
                <th>rate</th>
                <th>date</th>
            </tr>
            </thead>
             <tbody>
        <%
        
        Statement stmt2 = con.createStatement();
        ResultSet rs2 = stmt2.executeQuery(ttsearchquery);
        if (!rs2.next()) {
             %>
            
            <tr style="color: black;">
                <td>No Data</td>
                <td>No Data</td>
                <td>No Data</td>
                <td>No Data</td>
                <td>No Data</td>
            </tr>
            </tbody></table>
             <%
        } else { 
            do{
             %>
            
            <tr style="color: black;">
                <td><%=rs2.getInt("rateid")%></td>
                <td><%=rs2.getString("landlordid")%></td>
                <td><%=rs2.getString("tenantid")%></td>
                <td><%=rs2.getString("rate")%></td>
                <td><%=rs2.getString("date")%></td>
            </tr>
            
             <%
        }while(rs2.next());
        
         %></tbody></table><%
    }
    }
    if(request.getParameter("typeofusersearch").equals("Property")){
        ttsearchquery = "SELECT * FROM propertyrating where propid IN (SELECT propid FROM llpostproperty where propname LIKE '%"+request.getParameter("fullnamesearch")+"%')";
        %>
        </br>
        <table border="1" class="" style="width: 100%;">
            <thead>
            <tr style="color: black;">
                <th>rateid</th>
                <th>propid</th>
                <th>tenantid</th>
                <th>rate</th>
                <th>date</th>
            </tr>
            </thead>
            <tbody>
        <%
        
        Statement stmt3 = con.createStatement();
        ResultSet rs3 = stmt3.executeQuery(ttsearchquery);
        if (!rs3.next()) {
            %>
            
            <tr style="color: black;">
                <td>No Data</td>
                <td>No Data</td>
                <td>No Data</td>
                <td>No Data</td>
                <td>No Data</td>
            </tr>
            </tbody></table>
             <%
        } else { 
            do{
             %>
            
            <tr style="color: black;">
                <td><%=rs3.getInt("rateid")%></td>
                <td><%=rs3.getString("propid")%></td>
                <td><%=rs3.getString("tenantid")%></td>
                <td><%=rs3.getString("rate")%></td>
                <td><%=rs3.getString("date")%></td>
            </tr>
            
             <%
         }while(rs3.next());
            
         %></tbody></table><%
    }
    }
    if(request.getParameter("typeofusersearch").equals("Tenant")){
        ttsearchquery = "SELECT * FROM llts_db.tenantrating where tenantid IN (SELECT userid FROM tenantreg where firstname like '%"+request.getParameter("fullnamesearch")+"%')";
        %>
        </br>
        <table border="1" class="" style="width: 100%;">
            <thead>
            <tr style="color: black;">
                <th>rateid</th>
                <th>landlordid</th>
                <th>tenantid</th>
                <th>rate</th>
                <th>date</th>
            </tr>
            </thead>
            <tbody>
        <%
        Statement stmt4 = con.createStatement();
        ResultSet rs4 = stmt4.executeQuery(ttsearchquery);
       if (!rs4.next()) {
            %>
            
            <tr style="color: black;">
                <td>No Data</td>
                <td>No Data</td>
                <td>No Data</td>
                <td>No Data</td>
                <td>No Data</td>
            </tr>
            </tbody></table>
             <%
        } else { 
            do{
             %>
             
            <tr style="color: black;">
                <td><%=rs4.getInt("rateid")%></td>
                <td><%=rs4.getString("landlordid")%></td>
                <td><%=rs4.getString("tenantid")%></td>
                <td><%=rs4.getString("rate")%></td>
                <td><%=rs4.getString("date")%></td>
            </tr>
             
             <%  
        }while(rs4.next());
        %></tbody></table><%
        
    }
    }
    
    
                
            }                
            } catch (Exception ex) {
                ex.printStackTrace();
            }
%>

			<div style="margin-top: 85px; text-align: center; margin-bottom: 100px;">
				<center>
					<input type="submit" name="home" value="HOME" onclick="return toTViewAllRatingsHome()"/> 
				    <input type="submit" name="next" value="NEXT" onclick="return toTViewAllRatingsNext()"/> 
				    <input type="submit" name="back" value="BACK" onclick="return toTViewAllRatingsBack()"/>
				    <!-- <input type="reset" name="reset" value="RESET"/> --> 
				    <input type="submit" name="exit" value="EXIT" onclick="return toTViewAllRatingsExit()"/>
				</center>
			</div>
</form><!-- tviewallratingsform  END-->
<%}%>
<!--<div id="footer">
    <a href="#"></a>
</div>-->
</body>
</html>