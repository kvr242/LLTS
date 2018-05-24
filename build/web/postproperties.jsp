<%@page import="utilpack.ReadPropUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Landlord Tenant System - PP</title>
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
    //post property validation
    function toLlPPHome(){
        document.forms.llpostpropform.action = "index.html";
    }
    function toLlPPSubmit(){
        //alert("validation needs to be done");
        var ll_pp_llloginid1 = document.getElementById('ll_pp_llloginid1').value;
        var ll_pp_propid = document.getElementById('ll_pp_propid').value;
        var ll_pp_category = document.getElementById('ll_pp_category').value;
        var ll_pp_propfurnished = document.getElementById('ll_pp_propfurnished').value;
        var ll_pp_propertyname = document.getElementById('ll_pp_propertyname').value;
        var ll_pp_propertytype = document.getElementById('ll_pp_propertytype').value;
        var ll_pp_rentamount = document.getElementById('ll_pp_rentamount').value;
        var ll_pp_contactno = document.getElementById('ll_pp_contactno').value;
        var ll_pp_propertyaddress = document.getElementById('ll_pp_propertyaddress').value;
        var llt_advancemonths = document.getElementById('llt_advancemonths').value;
        var ll_pp_advanceamountpermonth = document.getElementById('ll_pp_advanceamountpermonth').value;
        
        if(ll_pp_llloginid1=="")
        {
            alert("Enter Landlord LoginId");
            document.getElementById('ll_pp_llloginid').focus();
            return false;
        }
        if(ll_pp_propid==""){
                alert("Please enter the Mobile number");
                document.getElementById('ll_pp_propid').focus();
                return false;
        }
        if(isNaN(ll_pp_propid)){
            alert("Please enter the Correct Mobile number");
            document.getElementById('ll_pp_propid').focus();
            return false;
        }
        if(ll_pp_category=="Select"){
            alert("Select valid category");
            document.getElementById('ll_pp_category').focus();
            return false;
        }
        if(ll_pp_propfurnished=="Select"){
            alert("Select furnished are not");
            document.getElementById('ll_pp_category').focus();
            return false;
        }
        if(ll_pp_propertyname=="")
        {
            alert("Enter Property Name");
            document.getElementById('ll_pp_propertyname').focus();
            return false;
        }
        if(!isNaN(ll_pp_propertyname))
        {
            alert("Enter Character Only");
            document.getElementById('ll_pp_propertyname').focus();
            return false;
        }
        if(ll_pp_propertytype=="Select"){
            alert("Select property type");
            document.getElementById('ll_pp_propertytype').focus();
            return false;
        }
        var regex  = /^$/;
        
        if(ll_pp_rentamount.substring(1, ll_pp_rentamount.lenght)=="")
        {
            alert("Enter rent amount");
            document.getElementById('ll_pp_rentamount').focus();
            return false;
        }
        
        if(isNaN(ll_pp_rentamount.substring(1, ll_pp_rentamount.lenght)))
        {
            alert("Please enter the Correct rent amount");
            document.getElementById('ll_pp_rentamount').focus();
            return false;
        }
        if(ll_pp_contactno==""){
                alert("Please enter the Mobile number");
                document.getElementById('ll_pp_contactno').focus();
                return false;
        }
        if(isNaN(ll_pp_contactno)){
                alert("Please enter the Correct Mobile number");
                document.getElementById('ll_pp_contactno').focus();
                return false;
        }
        if(ll_pp_contactno.length<=9){
                alert("invalid mobile number");
                document.getElementById('ll_pp_contactno').focus();
                return false;
        }
        if(ll_pp_contactno.length>=11 ){
                alert("invalid mobile number");
                document.getElementById('ll_pp_contactno').focus();
                return false;
        }
        if(ll_pp_propertyaddress=="")
        {
            alert("Enter property address");
            document.getElementById('ll_pp_propertyaddress').focus();
            return false;
        }
        if(llt_advancemonths=="")
        {
            alert("Enter advance months");
            document.getElementById('llt_advancemonths').focus();
            return false;
        }
        
        if(isNaN(llt_advancemonths))
        {
            alert("Please enter the Correct advance months");
            document.getElementById('llt_advancemonths').focus();
            return false;
        }
        if(ll_pp_advanceamountpermonth.substring(1, ll_pp_advanceamountpermonth.lenght)=="")
        {
            alert("Enter advance amount per month");
            document.getElementById('ll_pp_advanceamountpermonth').focus();
            return false;
        }
        if(isNaN(ll_pp_advanceamountpermonth.substring(1, ll_pp_advanceamountpermonth.lenght)))
        {
            alert("Please enter the Correct amount per month");
            document.getElementById('ll_pp_advanceamountpermonth').focus();
            return false;
        }
        document.forms.llpostpropform.action = "llpostpropservlet";
    }
    function toLlPPNext(){
        document.forms.llpostpropform.action = "myaccount.jsp";
    }
    function toLlPPBack(){
        document.forms.llpostpropform.action = "postproperties.jsp";
    }
    
    function toLlPPExit(){
        if (confirm("Close Window?")) {
          window.close();
           
        }
    }
</script>
</head>
<% 
        new ReadPropUtil().getPropValues();
    %>
<body >
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
                <li  class="current"><a href="postproperties.jsp" title="<%=ReadPropUtil.PostProperty %>">Add Property</a></li>
<%}%>
                <li><a href="#" title="<%=ReadPropUtil.Reports %>">Reports &#9660;</a>
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
        String session_ll_userid = (String)session.getAttribute("session_ll_userid"); 
        if(session_ll_userid!=null){
        %>
<!--    <p style="margin-left: 950px;">LandLord User : <b><%=(String)session.getAttribute("session_ll_firstname")%> <%=(String)session.getAttribute("session_ll_lastname")%></b> <a href="logout.jsp?ll=true">Logout</a>-->
        <li><a href="logout.jsp?ll=true" title="<%=ReadPropUtil.Logout %>">Logout</a></li>
        </ul>
        <p style="margin-left: 950px;">LandLord User : <b><%=(String)session.getAttribute("session_ll_firstname")%> <%=(String)session.getAttribute("session_ll_lastname")%></b>
        <%
    
    }%>
<% 
            
            //System.out.println("session_ll_userid : "+session_ll_userid);
            if(session_ll_userid==null){
%>
	<div style="margin-top: 120px; text-align: center;">
		<font size="6" color="black" face="cursive">Please login to post property.</font>
		</br></br> </br> </br>
	</div>
            <div style="margin-top: 85px; text-align: center; margin-bottom: 100px;">
                <form name="nonloginpostpropertyform" method="post" autocomplete="off" action="">
                    <center>
                    <input type="submit" name="home"  onclick="return toNonLoginHome()" value="HOME"/> 
                    <input type="submit" name="next" onclick="return toNonLoginNext();" value="NEXT"/> 
                    <input type="submit" name="back" onclick="return toNonLoginBack()" value="BACK"/>
                    <!--<input type="reset" name="reset" onclick="return toNonLoginReset();" value="RESET"/> -->
                    <input type="submit" name="exit" onclick="return toNonLoginExit();" value="EXIT"/>
                    </center>
                </form>
            </div>

        <%}
        if(session_ll_userid!=null){
            %>
        <div style="margin-top: 2px;text-align: center;" align="right">
        <table align="center" style="margin-bottom: 0px;">
      	<tr> 
      		<td style="width: 600px;">
                    <p>
      				
                    <section class="container11">
                    <!--<div class="login11" style="width: 855px;margin-left: -160px;">-->
                    <h1>LandLord Post Property Form</h1>
                    <div class="" style="width: 855px;margin-left: 50px;">
                    <form name="llpostpropform" method="post" autocomplete="off" action="">
                    <table>
                        <tr>
                            <td><font color="black" size="3" style="font-family: cursive;flex-align: right;margin-left: 200px;">All fields are mandatory</font></td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" id="ll_pp_llloginid" name="ll_pp_llloginid" value="<%=session_ll_userid%>"/>
                                    <input type="hidden" id="ll_pp_llloginid1" name="ll_pp_llloginid1" value="<%=session_ll_userid%>"/>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                            </td>
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" id="ll_pp_propid" name="ll_pp_propid" value="<%=(int) (Math.random() * 99999999)%>"/>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>
                                    <select name="ll_pp_category" id="ll_pp_category">
                                        <option value="Select">Select the category type</option>
                                        <option value="Apartments">Apartments</option>
                                        <option value="Houses">Houses</option>
                                        <option value="Builder Floors">Builder Floors</option>
                                        <option value="PG & Roommates">PG & Roommates</option>
                                        <option value="Shops - Offices - Commercial Space">Shops - Offices - Commercial Space</option>
                                        <option value="Land & Plots">Land & Plots</option>
                                        <option value="Vacation Rentals - Guest Houses">Vacation Rentals - Guest Houses</option>
                                    </select>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                            </td>
                            <td>
                                <p>
                                    <select  id="ll_pp_propfurnished" name="ll_pp_propfurnished">
                                        <option value="Select">Select the furnished type</option>
                                        <option value="Yes">Yes</option>
                                        <option value="No">No</option>
                                    </select>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" id="ll_pp_propertyname" name="ll_pp_propertyname" placeholder="Enter Property Name"/>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                            </td>
                            <td>
                                <p>
                                    <select id="ll_pp_propertytype" name="ll_pp_propertytype">
                                        <option value="Select">Select the property type</option>
                                        <option value="1BHK">1BHK = 1Bedroom, 1Hall, 1Kitchen</option>
                                        <option value="2BHK">2BHK = 2Bedroom, 2Hall, 2Kitchen</option>
                                        <option value="3BHK">3BHK = 3Bedroom, 3Hall, 3Kitchen</option>
                                        <option value="2B2H2K">2B2H2K = 2Bedroom, 2Hall, 2Kitchen</option>
                                    </select>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                            </td>
                        </tr>                   
                        <tr>
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" id="ll_pp_rentamount" name="ll_pp_rentamount" value="$" placeholder="Enter Rent Amount in $"/> 
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                            </td>
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" id="ll_pp_contactno" name="ll_pp_contactno" placeholder="Enter Contact Number"/>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                               
                                <p>
                                    <input type="text" style="width: 270px;" id="ll_pp_propertyaddress" name="ll_pp_propertyaddress" placeholder="Enter Property Address"/>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                                
                            </td>
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" id="llt_advancemonths" name="llt_advancemonths" placeholder="Enter Advance For Months"/>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>
                                    <input type="text" style="width: 270px;" id="ll_pp_advanceamountpermonth" name="ll_pp_advanceamountpermonth" value="$" placeholder="Enter Property Advance Amount Per Month"/>
                                    <!--<font color="black" size="5">*</font>-->
                                </p>
                                
                            </td>
                            <td>
                                
                                
                            </td>
                        </tr>
                    </table>
                    <center>
                <table style="margin-left: -240px;">
                    <tr>
                        <td>
                            <input type="submit" name="home" onclick="return toLlPPHome()" value="HOME"/> 
                            <input type="submit" name="commit" onclick="return toLlPPSubmit();" value="SUBMIT"/>
                            <input type="submit" name="next" onclick="return toLlPPNext();" value="NEXT"/> 
                            <input type="submit" name="back" onclick="return toLlPPBack()" value="BACK"/>
                            <input type="submit" name="exit" onclick="return toLlPPExit();" value="EXIT"/>
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
        %>
<!--<div id="footer">
    <a href="#"></a>
</div>-->
</body>
</html>