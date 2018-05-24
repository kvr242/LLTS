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
    //Select Script Functions
    var selectedlandlordaction;
    var landlordid;
    function getLLAction(selectObject) {
        var splitdata = selectObject.value.split(',');
        //alert('getLLAction = '+splitdata[0]+' - '+splitdata[1]);
        if(selectObject.value=="Select"){
            return false;
        }
        else{
            selectedlandlordaction = splitdata[0]; 
            landlordid = splitdata[1];
        }
        alert('getLLAction = '+selectedlandlordaction+' - '+landlordid);
    }
    var selectedtenantaction;
    var tenantid;
    function getTAction(selectObject) {
        var splitdata = selectObject.value.split(',');
        if(selectObject.value=="Select"){
            return false;
        }
        else{
            
            selectedtenantaction = splitdata[0];
            tenantid = splitdata[1];
        }
        alert('getTAction = '+selectedtenantaction+' - '+tenantid);
    }
    
    
   
    //Action Script Functions
    function dosomethingLL(event){
        
        $(document).ready(function() {
            alert('dosomethingLL : LandLordID = '+landlordid+', ActionType = '+selectedlandlordaction);
            
            $.ajax({
		url: "dbaaction.jsp",
		//type: "post",
		data: {landlordid:landlordid,selectedlandlordaction:selectedlandlordaction},
		cache: false,
		success: function(result) 
		{
                    var results=(result.trim()).split(',');
                    alert('Action LandLord status '+results[0]);
                   
		}
            });
            location.reload();
            
        });
        
    }
    function dosomethingT(event){
        
       $(document).ready(function() {
            alert('dosomethingT : TenantID = '+tenantid+', ActionType = '+selectedtenantaction);
            
            $.ajax({
		url: "dbaaction.jsp",
		//type: "post",
		data: {tenantid:tenantid,selectedtenantaction:selectedtenantaction},
		cache: false,
		success: function(result) 
		{
                    var results=result.trim().split(',');
                    alert('Action LandLord status '+results[0]);
                   
		}
            });
            location.reload();
            
        }); 
    }
    
    //Editing Operation for LL
    function doeditingLL(event){
        alert('doeditingLL = '+event.value);
        var splitdata = event.value.split('-');
        document.forms[0].action = "dbaeditaction.jsp?llid="+splitdata[1];
        document.forms[0].method = "post"; // "get"
        document.forms[0].submit();
        
        
    }
    
    //Editing Operation for T
    function doeditingT(event){
        alert('doeditingT = '+event.value);
        var splitdata = event.value.split('-');
        document.forms[0].action = "dbaeditaction.jsp?tid="+splitdata[1];
        document.forms[0].method = "post"; // "get"
        document.forms[0].submit();
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
    <p style="margin-left: 950px;">DBA User : <b><%=(String)session.getAttribute("session_dba_firstname")%> <%=(String)session.getAttribute("session_dba_lastname")%></b>
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
		<font size="6" color="black" face="cursive">DBA - Update Database details.</font>
                    
                    
       
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
                <th>Choose Action</th>
                <th>Action</th>
                <th>Edit</th>
            </tr>
            </thead>
           <tbody>
            <%
                Connection con = DbConnection.getConnection();
                Statement stmt2 = con.createStatement();
                Statement stmt3 = con.createStatement();
                ResultSet rs2 = stmt2.executeQuery("SELECT * FROM landlordreg");
                ResultSet rs3 = stmt3.executeQuery("SELECT * FROM tenantreg");
                while(rs2.next()){
                    String actionSelectDataLL = "Select,"+rs2.getString("userid");
                    String actionChangeDataLL = "Change,"+rs2.getString("userid");
                    String actionDeleteDataLL = "Delete,"+rs2.getString("userid");
                    ResultSet rs2_1 = con.createStatement().executeQuery("SELECT * FROM updatedatabase where userid='"+rs2.getString("userid")+"' and usertype='LandLord'");
            %>
                
                    <tr>
                    <td><%=rs2.getString("regdate")%></td>
                    <td><%=rs2.getString("status")%></td>
                    <td><%=rs2.getString("userid")%></td>
                    <td><%=rs2.getString("password")%></td>
                    <td><%=rs2.getString("uniquepassword")%></td>
                    <td><%=rs2.getString("firstname")%></td>
                    <td><%=rs2.getString("lastname")%></td>
                    <td>LandLord</td>
                    <td>
                        <select onchange="getLLAction(this)" name="landlordaction" id="landlordaction">
                            <option value="<%=actionSelectDataLL%>">Select</option>
                            <option value="<%=actionChangeDataLL%>">Change</option>
                            <option value="<%=actionDeleteDataLL%>">Delete</option>
                        </select>
                    </td>
                    <td><input type="button" name="Submit" value="Submit"  onclick="dosomethingLL(this)"></td>
                    <%
                        if(rs2.getString("status").equals("Change")){
                    %>
                    
                        <td><input type="button" name="Edit" value="Edit-<%=rs2.getString("userid")%>"  onclick="doeditingLL(this);"></td>
                    
                    <%        
                        }else{
                    %>
                        <td>Edit</td>
                    <%        
                        }
                    %>
                    
                    </tr>
                    <!-- Data from updatedatabase table for LandLord-->
                    
            <%      while(rs2_1.next()){
                        
            %>        
                    
                    <tr>
                    <td><%=rs2_1.getString("regdate")%></td>
                    <td><%=rs2.getString("status")%></td>
                    <td><%=rs2.getString("userid")%></td>
                    <td><%=rs2.getString("password")%></td>
                    <td><%=rs2.getString("uniquepassword")%></td>
                    <td><%=rs2_1.getString("firstname")%></td>
                    <td><%=rs2_1.getString("lastname")%></td>
                    <td>LandLord</td>
                    <td>DBA LandLord Action</td>
                    <td>Submitted</td>
                    
                    <td>Edited</td>
                 
                    
                    </tr>
            
            <%        
                        }
                      
                        
                }while(rs3.next()){
                    String actionSelectDataT = "Select,"+rs3.getString("userid");
                    String actionChangeDataT = "Change,"+rs3.getString("userid");
                    String actionDeleteDataT = "Delete,"+rs3.getString("userid");
                    ResultSet rs3_1 = con.createStatement().executeQuery("SELECT * FROM updatedatabase where userid='"+rs3.getString("userid")+"' and usertype='Tenant'");
            %>
                
                    <tr>
                    <td><%=rs3.getString("regdate")%></td>
                    <td><%=rs3.getString("status")%></td>
                    <td><%=rs3.getString("userid")%></td>
                    <td><%=rs3.getString("password")%></td>
                    <td><%=rs3.getString("uniquepassword")%></td>
                    <td><%=rs3.getString("firstname")%></td>
                    <td><%=rs3.getString("lastname")%></td>
                    <td>Tenant</td>
                    <td>
                        <select onchange="getTAction(this)" name="tenantaction" id="tenantaction">
                            <option value="<%=actionSelectDataT%>">Select</option>
                            <option value="<%=actionChangeDataT%>">Change</option>
                            <option value="<%=actionDeleteDataT%>">Delete</option>
                        </select>
                    </td>
                    <td><input type="button" name="Submit" value="Submit" onclick="dosomethingT();"></td>
                    <%
                        if(rs3.getString("status").equals("Change")){
                    %>
                        <td><input type="button" name="Edit" value="Edit-<%=rs3.getString("userid")%>"  onclick="doeditingT(this)"></td>
                    <%        
                        }else{
                    %>
                        <td>Edit</td>
                    <%        
                        }
                    %>
                    </tr>
                <!-- Data from updatedatabase table for Tenant-->
            <%
                        
               while(rs3_1.next()){
                        
            %>        
                    
                    <tr>
                    <td><%=rs3_1.getString("regdate")%></td>
                    <td><%=rs3.getString("status")%></td>
                    <td><%=rs3.getString("userid")%></td>
                    <td><%=rs3.getString("password")%></td>
                    <td><%=rs3.getString("uniquepassword")%></td>
                    <td><%=rs3_1.getString("firstname")%></td>
                    <td><%=rs3_1.getString("lastname")%></td>
                    <td>Tenant</td>
                    <td>DBA Tenant Action</td>
                    <td>Submitted</td>
                    
                    <td>Edited</td>
                 
                    
                    </tr>
            
            <%           
               }       
                        
                }
            %>
            </tbody>
        </table>
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