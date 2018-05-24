<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DBCon.DbConnection"%>
<%@page import="utilpack.ReadPropUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Landlord Tenant System - Evaluate</title>
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

    var value;
    function getComboA(selectObject) {
    value = selectObject.value; 
    alert(value);
    }
    function editRecord(event){
        //alert('editRecord proid = '+event);
        //alert('editRecord selected rating'+value);
        $(document).ready(function() {
            var propertyid=event;
            var tenantid=$('#tenantid').val();
            var selectrating=value;
            alert('ready, propertyid ='+propertyid+', tenantid ='+tenantid+', selectrating ='+selectrating);
            $.ajax({
		url: "addrating.jsp",
		//type: "post",
		data: {propertyid:propertyid,tenantid:tenantid,selectrating:selectrating},
		cache: false,
		success: function(result) 
		{
                    var results=(result.trim()).split(',');
                    alert('Rating Property status '+results[0]);
                  
		}
            });
            
        });
        location.reload();
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
                <!--
                <li><a href="logout.jsp?dba=true" title="<%=ReadPropUtil.Logout %>">Logout</a></li>
                <li><a href="logout.jsp?ll=true" title="<%=ReadPropUtil.Logout %>">Logout</a></li>
                <li><a href="logout.jsp?t=true" title="<%=ReadPropUtil.Logout %>">Logout</a></li>
                -->
	
<%
    String session_dba_userid = (String)session.getAttribute("session_dba_userid"); 
    String session_ll_userid = (String)session.getAttribute("session_ll_userid"); 
    String session_t_userid = (String)session.getAttribute("session_t_userid"); 
        
    if(session_dba_userid!=null){
    %>
    <!--<p style="margin-left: 950px;">Data Administrator User : <b><%=(String)session.getAttribute("session_dba_firstname")%> <%=(String)session.getAttribute("session_dba_lastname")%></b> <a href="logout.jsp?dba=true">Logout</a>-->
    <li><a href="logout.jsp?dba=true" title="<%=ReadPropUtil.Logout %>">Logout</a></li>
    </ul>
    <p style="margin-left: 950px;">Data Administrator User : <b><%=(String)session.getAttribute("session_dba_firstname")%> <%=(String)session.getAttribute("session_dba_lastname")%></b>
    <%
    }else if(session_ll_userid!=null){
    %>
     <!--<p style="margin-left: 950px;">LandLord User : <b><%=(String)session.getAttribute("session_ll_firstname")%> <%=(String)session.getAttribute("session_ll_lastname")%></b> <a href="logout.jsp?ll=true">Logout</a>-->
    <li><a href="logout.jsp?ll=true" title="<%=ReadPropUtil.Logout %>">Logout</a></li>
    </ul> 
    <p style="margin-left: 950px;">LandLord User : <b><%=(String)session.getAttribute("session_ll_firstname")%> <%=(String)session.getAttribute("session_ll_lastname")%></b>
    <%
    }else if(session_t_userid!=null){
    %>
    <!--<p style="margin-left: 950px;">Tenant User : <b><%=(String)session.getAttribute("session_t_firstname")%> <%=(String)session.getAttribute("session_t_lastname")%></b> <a href="logout.jsp?t=true">Logout</a>-->
    <li><a href="logout.jsp?t=true" title="<%=ReadPropUtil.Logout %>">Logout</a></li>
    </ul>
    <p style="margin-left: 950px;">Tenant User : <b><%=(String)session.getAttribute("session_t_firstname")%> <%=(String)session.getAttribute("session_t_lastname")%></b>
     <%}
    if(session_dba_userid==null && session_ll_userid==null && session_t_userid==null){
    %>
    </ul>
    <%}%> 
    
    <%
            if(session_t_userid==null){
        %>
    
	<div style="margin-top: 120px; text-align: center;">
		<font size="6" color="black" face="cursive">Please login to rate on properties.</font>
		</br></br> </br> </br>
	</div>
        <form name="taddratingonpropertywithoutloginform" method="post" action="">
			<div style="margin-top: 85px; text-align: center; margin-bottom: 100px;">
                            <center>
                                    <input type="submit" name="home" value="HOME" onclick="return toTRatePPHome()"/> 
				    <input type="submit" name="next" value="NEXT" onclick="return toTRatePPNext()"/> 
				    <input type="submit" name="back" value="BACK" onclick="return toTRatePPBack()"/>
				    <!-- <input type="reset" name="reset" value="RESET"/> --> 
				    <input type="submit" name="exit" value="EXIT" onclick="return toTRatePPExit()"/>
				</center>
			</div>
            </form>
<%}%>
<%if(session_t_userid!=null){
%>

	<div style="margin-top: 30px; text-align: center;">
	<font size="6" color="black" face="cursive">Tenant to add rating on property</font>
	<form name="taddratingonpropertyform" method="post" action="">
        
        </br>
        <table border="1" class="" style="width: 100%;">
            <thead>
            <tr style="color: black;">
                <th>Prop Id</th>
                <th>Prop Category</th>
                <th>prop furnished</th>
                <th>Prop Name</th>
                <th>Prop Type</th>
                <th>Prop Rent Amt</th>
                <th>Prop Contact No</th>
                <th>Prop Address</th>
                <th>Prop Adv Mnts</th>
                <th>prop Adv Amt/Mnt</th>
                 
                <th>Choose Rate</th>
                <th>Rating</th>
            </tr>
            </thead>
            <tbody>       
    <%
    
            Connection con = DbConnection.getConnection();
            try {
                Statement stmt = con.createStatement();

                ResultSet rs = stmt.executeQuery("select * from llpostproperty");
                if (!rs.next()) {
                    System.out.println("Tenant has no properties available");
%>
<tr>
                <td>Prop Id</td>
                <td>Prop Category</td>
                <td>Prop Furnished</td>
                <td>Prop Name</td>
                <td>Prop Type</td>
                <td>Prop Rent Amt</td>
                <td>Prop Contact No</td>
                <td>Prop Address</td>
                <td>Prop Adv Mnts</td>
                <td>prop Adv Amt/Mnt</td>
                 
                <td>Choose Rate</td>
                <td>Rating</td>
            </tr>       
<%
                  } else {
                    //display results
%>
<input type="hidden" id="tenantid" name="tenantid" value="<%=session_t_userid%>"/>
<%
                    do {
                        
%>
               
            <tr>
                
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
                 
<%
Statement stmt2 = con.createStatement();
ResultSet rs2 = stmt2.executeQuery("select * from llts_db.propertyrating where tenantid='"+session_t_userid+"' and propid='"+rs.getInt("propid")+"'");
if(rs2.next()){
%>                
                
                <td><%=rs2.getString("rate")%></td>
                <td>Rated</td>
                </tr> 
                
<%}else{%>
<td>
    <select onchange="getComboA(this)" name="selectrating" id="selectrating">
        <option value="Select">Select Rating</option>
        <option value="5 Star">5 Star</option>
        <option value="4 Star">4 Star</option>
        <option value="3 Star">3 Star</option>
        <option value="2 Star">2 Star</option>
        <option value="1 Star">1 Star</option>
    </select>
</td>
<td><input type="button" name="Submit" value="Submit" onclick="editRecord(<%=rs.getInt("propid")%>);" ></td>
            
</tr>    
<%          
            } 
                    }while (rs.next());
            }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
%>
    
            </tbody>
            
            </table>
	</div>
			<div style="margin-top: 35px; text-align: center;">
				<center>
                                    <input type="submit" name="home" value="HOME" onclick="return toTRatePPHome()"/> 
				    <input type="submit" name="next" value="NEXT" onclick="return toTRatePPNext()"/> 
				    <input type="submit" name="back" value="BACK" onclick="return toTRatePPBack()"/>
				    <!-- <input type="reset" name="reset" value="RESET"/> --> 
				    <input type="submit" name="exit" value="EXIT" onclick="return toTRatePPExit()"/>
				</center>
			</div>
</form><!--taddratingonpropertyform  END -->
<%}%>
<!--<div id="footer">
    <a href="#"></a>
</div>-->
</body>
</html>