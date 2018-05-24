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
            //System.out.println("session_dba_userid : "+session_dba_userid);
            //System.out.println("session_ll_userid : "+session_ll_userid);
            //System.out.println("session_t_userid : "+session_t_userid);
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
    <%}%>
        
    
    <%
    if(session_dba_userid==null && session_ll_userid==null && session_t_userid==null){
    %></ul>
	<div style="margin-top: 120px; text-align: center;">
		<font size="6" color="black" face="cursive">Property details.</font>
		</br></br> </br> </br>
	</div>
			<div style="margin-top: 85px; text-align: center; margin-bottom: 100px;">
                            <form name="nonloginpropertydetailsform" method="post" autocomplete="off" action="">
				<center>
                                    <input type="submit" name="home"  onclick="return toNonLoginPropertyDetailsHome()" value="HOME"/> 
                                    <input type="submit" name="next" onclick="return toNonLoginPropertyDetailsNext();" value="NEXT"/> 
                                    <input type="submit" name="back" onclick="return toNonLoginPropertyDetailsBack()" value="BACK"/>
                                    <input type="submit" name="exit" onclick="return toNonLoginPropertyDetailsExit();" value="EXIT"/>
                                </center>
                            </form>
			</div>

    <%}else {
        %>
    <div style="margin-top: 120px; text-align: center;">
		<font size="6" color="black" face="cursive">
                    <%if(session_dba_userid!=null){%>
                    Data Administrator - Property details.</font>
                    <%}%>
                    <%if(session_ll_userid!=null){%>
                    LandLord - Property details.</font>
                    <%}%>
                    <%if(session_t_userid!=null){%>
                    Tenant - Property details.</font>
                    <%}%>
        <table border="1" class="" style="width: 100%;">
            <thead>
            <tr style="color: black;">
                <th>LL Login Id</th>
                <th>Prop Id</th>
                <th>Prop Category</th>
                <th>Prop Furnished</th>
                <th>Prop Name</th>
                <th>Prop Type</th>
                <th>Prop Rent Amt</th>
                <th>Prop Contact</th>
                <th>Prop Address</th>
                <th>Prop Adv Mnt</th>
                <th>Prop Adv Amt/Mnt</th>
                <!--<th>Prop Agree</th>-->
            </tr>
            </thead>
            <tbody>
            <%
            Connection con = DbConnection.getConnection();
            try {
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("select * from llpostproperty");
                if (!rs.next()) {
                    System.out.println("view properties but no record is available");
                  } else {
                    //display results
                    do {
                        
%>
            <tr>
                <td><%=rs.getString("llloginid")%></td>
                <td><%=rs.getInt("propid")%></td>
                <td><%=rs.getString("propcategory")%></td>
                <td><%=rs.getString("propfurnished")%></td>
                <td><%=rs.getString("propname")%></td>
                <td><%=rs.getString("proptype")%></td>
                <td><%=rs.getString("proprentamount")%></td>
                <td><%=rs.getString("propcontactno")%></td>
                <td><%=rs.getString("propertyaddress")%></td>
                <td><%=rs.getString("propadvancemonths")%></td>
                <td><%=rs.getString("propadvanceamountpermonth")%></td>
                <!--<td><%=rs.getString("propagree")%></td>-->
            </tr>    
<%          
            } while (rs.next());
            }        
            } catch (Exception ex) {
                ex.printStackTrace();
            }
%>
    
            </tbody>
            
            </table></br>
	</div>
	<div style="margin-top: 85px; text-align: center; margin-bottom: 100px;">
        <form name="loginpropertydetailsform" method="post" autocomplete="off" action="">
            <center>
                <input type="submit" name="home"  onclick="return toLoginPropertyDetailsHome()" value="HOME"/> 
                <input type="submit" name="next" onclick="return toLoginPropertyDetailsNext();" value="NEXT"/> 
                <input type="submit" name="back" onclick="return toLoginPropertyDetailsBack()" value="BACK"/>
                <input type="submit" name="exit" onclick="return toLoginPropertyDetailsExit();" value="EXIT"/>
            </center>
        </form>
	</div>
        <%
    }%>
<!--<div id="footer">
    <a href="#"></a>
</div>-->
</body>
</html>