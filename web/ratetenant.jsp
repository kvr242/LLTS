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

    var selectrating;
    var tenantid;
    function getComboA(selectObject) {
    var splitdata = selectObject.value.split(',');
    selectrating = splitdata[0];
    tenantid = splitdata[1];
    alert('getComboA = '+selectrating+' - '+tenantid);
    }
    function dosomething(event){
       $(document).ready(function() {
            var landlordid=$('#landlordid').val();
            alert('ready, landlordid ='+landlordid+', tenantid ='+tenantid+', selectrating ='+selectrating);
            $.ajax({
		url: "addtenantrating.jsp",
		//type: "post",
		data: {landlordid:landlordid,tenantid:tenantid,selectrating:selectrating},
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
            if(session_ll_userid==null){
        %>
    
	<div style="margin-top: 120px; text-align: center;">
		<font size="6" color="black" face="cursive">Please login to rate on tenant.</font>
		</br></br> </br> </br>
	</div>
        <form name="taddratingontenantwithoutloginform" method="post" action="">
			<div style="margin-top: 85px; text-align: center; margin-bottom: 100px;">
                           <center>
                                    <input type="submit" name="home" value="HOME" onclick="return toLLRateTHome()"/> 
				    <input type="submit" name="next" value="NEXT" onclick="return toLLRateTNext()"/> 
				    <input type="submit" name="back" value="BACK" onclick="return toLLRateTBack()"/>
				    <!-- <input type="reset" name="reset" value="RESET"/> --> 
				    <input type="submit" name="exit" value="EXIT" onclick="return toLLRateTExit()"/>
				</center>
			</div>
<%}%>
<%if(session_ll_userid!=null){
%>
        <div style="margin-top: 30px; text-align: center;">
	<font size="6" color="black" face="cursive">LandLord to add rating on Tenants</font>
	<form name="taddratingontenantform" method="post" action="">
        
        </br>
        <table border="1" class="" style="width: 100%;">
            <thead>
            <tr style="color: black;">
                <th>First Name</th>
                <th>Last Name</th>
                <th>User Id</th>
                <th>Contact No</th>
                <th>Email</th>
                <th>Reg Date</th>
                <th>Choose Rate</th>
                <th>Rating</th>
            </tr>
            </thead>
            <tbody>       
    <%
    
            Connection con = DbConnection.getConnection();
            try {
                Statement stmt = con.createStatement();

                ResultSet rs = stmt.executeQuery("SELECT * FROM tenantreg");
                if (!rs.next()) {
                    System.out.println("LandLord has no Tenants available");
%>
<tr>
                <td>First Name</td>
                <td>Last Name</td>
                <td>User Id</td>
                <td>Contact No</td>
                <td>Email</td>
                <td>Reg Date</td>
                <td>Choose Rate</td>
                <td>Rating</td>
            </tr>        
<%
                  } else {
                    //display results
%>
<input type="hidden" id="landlordid" name="landlordid" value="<%=session_ll_userid%>"/>
<%
                    do {
                    String actionSelectDataT = "Select,"+rs.getString("userid");
                    String action5StarDataT = "5 Star,"+rs.getString("userid");
                    String action4StarDataT = "4 Star,"+rs.getString("userid");
                    String action3StarDataT = "3 Star,"+rs.getString("userid");
                    String action2StarDataT = "2 Star,"+rs.getString("userid");
                    String action1StarDataT = "1 Star,"+rs.getString("userid");   
%>
               
            <tr>
                
                <td><%=rs.getString("firstname")%></td>
                <td><%=rs.getString("lastname")%></td>
                <td><%=rs.getString("userid")%></td>
                <td><%=rs.getString("contactno")%></td>
                <td><%=rs.getString("email")%></td>
                <td><%=rs.getString("regdate")%></td>
<%
Statement stmt2 = con.createStatement();
ResultSet rs2 = stmt2.executeQuery("select * from llts_db.tenantrating where landlordid='"+session_ll_userid+"' and tenantid='"+rs.getString("userid")+"'");
if(rs2.next()){
%>                
                
                <td><%=rs2.getString("rate")%></td>
                <td>Rated</td>
                </tr> 
                
<%}else{%>
<td>
    <select onchange="getComboA(this)" name="selectrating" id="selectrating">
        <option value="<%=actionSelectDataT%>">Select Rating</option>
        <option value="<%=action5StarDataT%>">5 Star</option>
        <option value="<%=action4StarDataT%>">4 Star</option>
        <option value="<%=action3StarDataT%>">3 Star</option>
        <option value="<%=action2StarDataT%>">2 Star</option>
        <option value="<%=action1StarDataT%>">1 Star</option>
    </select>
</td>
<!--<td><input type="button" name="Submit" value="Submit" id="btnsave" onclick="editRecord(<%=rs.getString("userid")%>);" ></td>-->
<td><input type="button" name="Submit" value="Submit" onclick="dosomething(this.value)"></td>
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
                                    <input type="submit" name="home" value="HOME" onclick="return toLLRateTHome()"/> 
				    <input type="submit" name="next" value="NEXT" onclick="return toLLRateTNext()"/> 
				    <input type="submit" name="back" value="BACK" onclick="return toLLRateTBack()"/>
				    <!-- <input type="reset" name="reset" value="RESET"/> --> 
				    <input type="submit" name="exit" value="EXIT" onclick="return toLLRateTExit()"/>
				</center>
			</div>
</form><!--taddratingontenantform  END -->
<%}%>
<!--<div id="footer">
    <a href="#"></a>
</div>-->
</body>
</html>