/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function toDbaHome(){
        document.forms.dbaupdateform.action = "index.html";
    }
    function toDbaBack(){
        document.forms.dbaupdateform.action = "ratetenant.jsp";
    }
    function toDbaNext(){
        document.forms.dbaupdateform.action = "updatedatabase.jsp";
    }
    function toDbaSubmit(){
        var mailPattern = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	
        var dba_firstname = document.getElementById('dba_firstname').value;
        
        var dba_lastname = document.getElementById('dba_lastname').value;
        var dba_userid = document.getElementById('dba_userid').value;
        var dba_password = document.getElementById('dba_password').value;
        //var dba_dba_password = document.getElementById('dba_dba_password').value;
        var dba_email = document.getElementById('dba_email').value;
        var dba_contactno = document.getElementById('dba_contactno').value;
        var dba_securityquestion = document.getElementById('dba_securityquestion').value;
        var dba_securityanswer = document.getElementById('dba_securityanswer').value;
        
        if(dba_firstname=="")
        {
            alert("Enter First Name");
            document.getElementById('dba_firstname').focus();
            return false;
        }
        if(!isNaN(dba_firstname))
        {
            alert("Enter Character Only");
            //document.getElementById('dba_firstname').value="";
            document.getElementById('dba_firstname').focus();
            return false;
        }
        if(dba_lastname=="")
        {
            alert("Enter Last Name");
            document.getElementById('dba_lastname').focus();
            return false;
        }
        if(!isNaN(dba_lastname))
        {
            alert("Enter Character Only");
            //document.getElementById('dba_lastname').value="";
            document.getElementById('dba_lastname').focus();
            return false;
        }
        if(dba_userid=="")
        {
            alert("Enter User Id");
            document.getElementById('dba_userid').focus();
            return false;
        }
        if(dba_password=="")
        {
            alert("Enter User Password");
            document.getElementById('dba_password').focus();
            return false;
        }
        /*if(dba_dba_password=="")
        {
            alert("Enter DBA Password");
            document.getElementById('dba_dba_password').focus();
            return false;
        }*/
        if(dba_contactno==""){
                alert("Please enter the Mobile number");
                document.getElementById('dba_contactno').focus();
                return false;
        }
        if(isNaN(dba_contactno)){
                alert("Please enter the Correct Mobile number");
                document.getElementById('dba_contactno').focus();
                return false;
        }
        if(dba_contactno.length<=9){
                alert("invalid mobile number");
                document.getElementById('dba_contactno').focus();
                return false;
        }
        if(dba_contactno.length>=11 ){
                alert("invalid mobile number");
                document.getElementById('dba_contactno').focus();
                return false;
        }  
        if(dba_email==0){
            alert("Enter your Mailid");
            document.getElementById('dba_email').focus();
            return false;
        }
        if(!mailPattern.test(dba_email)){
            alert("Enter valid Mailid");
            //document.getElementById('dba_email').value="";
            document.getElementById('dba_email').focus();
            return false;
        }
        if(dba_securityquestion=="Select"){
            alert("Please select security question");
            return false;
        }
        if(dba_securityanswer==""){
            alert("Enter security answer");
            document.getElementById('dba_securityanswer').focus();
            return false;
        }
          
        //return false;
        document.forms.dbaupdateform.action = "dbaRegservlet";   
    }
    function toDbaExit(){
        if (confirm("Close Window??")) {
          window.close();
          
        }
    }
    
    //Land Lord Profile Update Script Code
    function toLlHome(){
        document.forms.llupdateform.action = "index.html";
    }
    function toLlBack(){
        document.forms.llupdateform.action = "ratetenant.jsp";
    }
    function toLlNext(){
        document.forms.llupdateform.action = "updatedatabase.jsp";
    }
    function toLlSubmit(){
        var mailPattern = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	
        var llt_firstname = document.getElementById('llt_firstname').value;
        var llt_lastname = document.getElementById('llt_lastname').value;
        var llt_userid = document.getElementById('llt_userid').value;
        var llt_password = document.getElementById('llt_password').value;
        //var llt_llt_password = document.getElementById('llt_llt_password').value;
        var llt_email = document.getElementById('llt_email').value;
        var llt_contactno = document.getElementById('llt_contactno').value;
        var llt_securityquestion = document.getElementById('llt_securityquestion').value;
        var llt_securityanswer = document.getElementById('llt_securityanswer').value;
        if(llt_firstname=="")
        {
            alert("Enter First Name");
            document.getElementById('llt_firstname').focus();
            return false;
        }
        if(!isNaN(llt_firstname))
        {
            alert("Enter Character Only");
            //document.getElementById('llt_firstname').value="";
            document.getElementById('llt_firstname').focus();
            return false;
        }
        if(llt_lastname=="")
        {
            alert("Enter Last Name");
            document.getElementById('llt_lastname').focus();
            return false;
        }
        if(!isNaN(llt_lastname))
        {
            alert("Enter Character Only");
            //document.getElementById('llt_lastname').value="";
            document.getElementById('llt_lastname').focus();
            return false;
        }
        if(llt_userid=="")
        {
            alert("Enter User Id");
            document.getElementById('llt_userid').focus();
            return false;
        }
        if(llt_password=="")
        {
            alert("Enter User Password");
            document.getElementById('llt_password').focus();
            return false;
        }
        /*if(llt_llt_password=="")
        {
            alert("Enter DBA Password");
            document.getElementById('llt_llt_password').focus();
            return false;
        }*/
        if(llt_contactno==""){
                alert("Please enter the Mobile number");
                document.getElementById('llt_contactno').focus();
                return false;
        }
        if(isNaN(llt_contactno)){
                alert("Please enter the Correct Mobile number");
                //document.getElementById('llt_contactno').value="";
                document.getElementById('llt_contactno').focus();
                return false;
        }
        if(llt_contactno.length<=9){
                alert("invalid mobile number");
                //document.getElementById('llt_contactno').value="";
                document.getElementById('llt_contactno').focus();
                return false;
        }
        if(llt_contactno.length>=11 ){
                alert("invalid mobile number");
               //document.getElementById('llt_contactno').value="";
                document.getElementById('llt_contactno').focus();
                return false;
        }  
        if(llt_email==0){
            alert("Enter your Mailid");
            document.getElementById('llt_email').focus();
            return false;
        }
        if(!mailPattern.test(llt_email)){
            alert("Enter valid Mailid");
            //document.getElementById('llt_email').value="";
            document.getElementById('llt_email').focus();
            return false;
        }
        if(llt_securityquestion=="Select"){
            alert("Please select security question");
            return false;
        }
        if(llt_securityanswer==""){
            alert("Enter security answer");
            document.getElementById('llt_securityanswer').focus();
            return false;
        }
          
        
        
        //return false;
        document.forms.llupdateform.action = "llRegservlet";
    }
    function toLlExit(){
        if (confirm("Close Window?")) {
          window.close();
           
        }
    }

//Tenant Profile Update Script Code
    function toTHome(){
        document.forms.tupdateform.action = "index.html";
    }
    function toTBack(){
        document.forms.tupdateform.action = "ratetenant.jsp";
    }
    function toTNext(){
        document.forms.tupdateform.action = "updatedatabase.jsp";
    }
    function toTSubmit(){
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
            //document.getElementById('t_firstname').value="";
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
            //document.getElementById('t_lastname').value="";
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
            alert("Enter DBA Password");
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
                //document.getElementById('t_contactno').value="";
                document.getElementById('t_contactno').focus();
                return false;
        }
        if(t_contactno.length<=9){
                alert("invalid mobile number");
                //document.getElementById('t_contactno').value="";
                document.getElementById('t_contactno').focus();
                return false;
        }
        if(t_contactno.length>=11 ){
                alert("invalid mobile number");
                //document.getElementById('t_contactno').value="";
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
            //document.getElementById('t_email').value="";
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
        document.forms.tupdateform.action = "tRegservlet";
    }
    function toTExit(){
        if (confirm("Close Window?")) {
          window.close();
          
        }
    }
    
    //myaccount - non logged form script data
    function toNonLoginHome(){
        document.forms.nonloginmyaccountform.action = "index.html";
    }
    function toNonLoginBack(){
        document.forms.nonloginmyaccountform.action = "ratetenant.jsp";
    }
    function toNonLoginNext(){
        document.forms.nonloginmyaccountform.action = "updatedatabase.jsp";
    }
    
    function toNonLoginExit(){
        if (confirm("Close Window?")) {
          window.close();
           
        }
    }
   

/*
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
        if(ll_pp_rentamount=="")
        {
            alert("Enter rent amount");
            document.getElementById('ll_pp_rentamount').focus();
            return false;
        }
        if(isNaN(ll_pp_rentamount))
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
        if(ll_pp_advanceamountpermonth=="")
        {
            alert("Enter advance amount per month");
            document.getElementById('ll_pp_advanceamountpermonth').focus();
            return false;
        }
        if(isNaN(ll_pp_advanceamountpermonth))
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
*/ 


    //non login update db form
    function toNonLoginUpdateDbHome(){
        document.forms.nonloginupdatedbform.action = "index.html";
    }
    function toNonLoginUpdateDbNext(){
        document.forms.nonloginupdatedbform.action = "propertydetails.jsp";
    }
    
    function toNonLoginUpdateDbBack(){
        document.forms.nonloginupdatedbform.action = "myaccount.jsp";
    }
    
    function toNonLoginUpdateDbExit(){
        if (confirm("Close Window?")) {
          window.close();
          
        }
    }
    
    //non login update db form
    //nonloginupdatedbformll
    function toNonLoginUpdateDbHomell(){
        document.forms.nonloginupdatedbformll.action = "index.html";
    }
    function toNonLoginUpdateDbNextll(){
        document.forms.nonloginupdatedbformll.action = "propertydetails.jsp";
    }
    
    function toNonLoginUpdateDbBackll(){
        document.forms.nonloginupdatedbformll.action = "myaccount.jsp";
    }
    
    function toNonLoginUpdateDbExitll(){
        if (confirm("Close Window?")) {
          window.close();
          
        }
    }
    
    
    //non login update db form
    //nonloginupdatedbform22
    function toNonLoginUpdateDbHome22(){
        document.forms.nonloginupdatedbform22.action = "index.html";
    }
    function toNonLoginUpdateDbNext22(){
        document.forms.nonloginupdatedbform22.action = "propertydetails.jsp";
    }
    
    function toNonLoginUpdateDbBack22(){
        document.forms.nonloginupdatedbform22.action = "myaccount.jsp";
    }
    
    function toNonLoginUpdateDbExit22(){
        if (confirm("Close Window?")) {
          window.close();
          
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //non login property details form
    //nonloginpropertydetailsform
    function toNonLoginPropertyDetailsHome(){
        document.forms.nonloginpropertydetailsform.action = "index.html";
    }
    function toNonLoginPropertyDetailsNext(){
        document.forms.nonloginpropertydetailsform.action = "viewpostedproperty.jsp";
    }
    
    function toNonLoginPropertyDetailsBack(){
        document.forms.nonloginpropertydetailsform.action = "updatedatabase.jsp";
    }
    
    function toNonLoginPropertyDetailsExit(){
        if (confirm("Close Window?")) {
          window.close();
          
        }
    }
    
    //login update db form
    //loginupdatedbform
    function toLoginUpdateDbHome(){
        document.forms.loginupdatedbform.action = "index.html";
    }
    function toLoginUpdateDbNext(){
        document.forms.loginupdatedbform.action = "propertydetails.jsp";
    }
    function toLoginUpdateDbBack(){
        document.forms.loginupdatedbform.action = "myaccount.jsp";
    }
    
    function toLoginUpdateDbExit(){
        if (confirm("Close Window?")) {
          window.close();
        }
    }
//login Property Details form
    //loginpropertydetailsform
    function toLoginPropertyDetailsHome(){
        document.forms.loginpropertydetailsform.action = "index.html";
    }
    function toLoginPropertyDetailsNext(){
        document.forms.loginpropertydetailsform.action = "viewpostedproperty.jsp";
    }
    function toLoginPropertyDetailsBack(){
        document.forms.loginpropertydetailsform.action = "updatedatabase.jsp";
    }
    
    function toLoginPropertyDetailsExit(){
        if (confirm("Close Window?")) {
          window.close();
        }
    }   
    
//DBA view posted property validation
function toDbaVPPHome(){
        document.forms.dbaviewpostedpropertyform.action = "index.html";
}
function toDbaVPPNext(){
        document.forms.dbaviewpostedpropertyform.action = "viewallratings.jsp";
}
function toDbaVPPBack(){
        document.forms.dbaviewpostedpropertyform.action = "propertydetails.jsp";
}
function toDbaVPPExit(){
    if (confirm("Close Window?")) {
          window.close();
           
    }
}
//LandLord view posted property validation
function toLlVPPHome(){
        document.forms.llviewpostedpropertyform.action = "index.html";
}
function toLlVPPNext(){
        document.forms.llviewpostedpropertyform.action = "viewallratings.jsp";
}
function toLlVPPBack(){
        document.forms.llviewpostedpropertyform.action = "propertydetails.jsp";
}
function toLlVPPExit(){
   if (confirm("Close Window?")) {
          window.close();
          
        }
}
//Tenant view posted property validation
function toTVPPSearch(){
    var tt_pp_category = document.getElementById('tt_pp_category').value;
    var tt_pp_propfurnished = document.getElementById('tt_pp_propfurnished').value;
    var tt_pp_rentamount = document.getElementById('tt_pp_rentamount').value;
    var tt_pp_propertytype = document.getElementById('tt_pp_propertytype').value;
    if(tt_pp_category=="Select" && tt_pp_propfurnished=="Select" && tt_pp_propertytype=="Select" && tt_pp_rentamount==""){
        alert("Provide any one information to search");
        return false;
    }
    document.forms.tviewpostedpropertyform.action = "viewpostedproperty.jsp";
}

//tviewpostedpropertyform
function toTVPPHome(){
    document.forms.tviewpostedpropertyform.action = "index.html";
}
function toTVPPNext(){
    document.forms.tviewpostedpropertyform.action = "viewallratings.jsp";
}
function toTVPPBack(){
    document.forms.tviewpostedpropertyform.action = "propertydetails.jsp";
}
function toTVPPExit(){
    if (confirm("Close Window?")) {
          window.close();
          
        }
}


//DBA View All Ratings Validation
//dbaviewallratingsform
function toDbaViewAllRatingsHome(){
        document.forms.dbaviewallratingsform.action = "index.html";
}
function toDbaViewAllRatingsNext(){
        document.forms.dbaviewallratingsform.action = "aboutus.jsp";
}
function toDbaViewAllRatingsBack(){
        document.forms.dbaviewallratingsform.action = "viewpostedproperty.jsp";
}
function toDbaViewAllRatingsExit(){
    if (confirm("Close Window?")) {
          window.close();
          
        }
}
//LandLord View All Ratings Validation
//llviewallratingsform
function toLlViewAllRatingsHome(){
        document.forms.llviewallratingsform.action = "index.html";
}
function toLlViewAllRatingsNext(){
        document.forms.llviewallratingsform.action = "aboutus.jsp";
}
function toLlViewAllRatingsBack(){
        document.forms.llviewallratingsform.action = "viewpostedproperty.jsp";
}
function toLlViewAllRatingsExit(){
    if (confirm("Close Window?")) {
          window.close();
          
        }
}
//Tenant View All Ratings Validation
//tviewallratingsform
function toTViewAllRatingsHome(){
        document.forms.tviewallratingsform.action = "index.html";
}
function toTViewAllRatingsNext(){
        document.forms.tviewallratingsform.action = "aboutus.jsp";
}
function toTViewAllRatingsBack(){
        document.forms.tviewallratingsform.action = "viewpostedproperty.jsp";
}
function toTViewAllRatingsExit(){
    if (confirm("Close Window?")) {
          window.close();
          
        }
}
//viewallratingwithoutloginform
function toViewAllRatingsWOLHome(){
        document.forms.viewallratingwithoutloginform.action = "index.html";
}
function toLlViewAllRatingsWOLNext(){
        document.forms.viewallratingwithoutloginform.action = "aboutus.jsp";
}
function toLlViewAllRatingsWOLBack(){
        document.forms.viewallratingwithoutloginform.action = "viewpostedproperty.jsp";
}
function toLlViewAllRatingsWOLExit(){
    if (confirm("Close Window?")) {
          window.close();
          
        }
}



//rate property by tenant
//taddratingonpropertyform
function toTRatePPHome(){
    document.forms.taddratingonpropertyform.action = "index.html";
}
function toTRatePPNext(){
    document.forms.taddratingonpropertyform.action = "ratelandLord.jsp";
}
function toTRatePPBack(){
    document.forms.taddratingonpropertyform.action = "tenantregister.jsp";
}
function toTRatePPExit(){
    if (confirm("Close Window?")) {
          window.close();
        }
}

//rate property by tenant without login
//taddratingonpropertywithoutloginform
function toTRatePPHome(){
    document.forms.taddratingonpropertywithoutloginform.action = "index.html";
}
function toTRatePPNext(){
    document.forms.taddratingonpropertywithoutloginform.action = "ratelandLord.jsp";
}
function toTRatePPBack(){
    document.forms.taddratingonpropertywithoutloginform.action = "tenantregister.jsp";
}
function toTRatePPExit(){
    if (confirm("Close Window?")) {
          window.close();
        }
}



//rate landlard by tenant
//taddratingonlandlordform
function toTRateLLHome(){
    document.forms.taddratingonlandlordform.action = "index.html";
}
function toTRateLLNext(){
    document.forms.taddratingonlandlordform.action = "ratetenant.jsp";
}
function toTRateLLBack(){
    document.forms.taddratingonlandlordform.action = "rateproperty.jsp";
}
function toTRateLLExit(){
    if (confirm("Close Window?")) {
          window.close();
        }
}

//rate landlard by tenant without login
//taddratingonlandlordwithoutloginform
function toTRateLLHome(){
    document.forms.taddratingonlandlordwithoutloginform.action = "index.html";
}
function toTRateLLNext(){
    document.forms.taddratingonlandlordwithoutloginform.action = "ratetenant.jsp";
}
function toTRateLLBack(){
    document.forms.taddratingonlandlordwithoutloginform.action = "rateproperty.jsp";
}
function toTRateLLExit(){
    if (confirm("Close Window?")) {
          window.close();
        }
}


//rate tenant by landlard
//taddratingontenantform
function toLLRateTHome(){
    document.forms.taddratingontenantform.action = "index.html";
}
function toLLRateTNext(){
    document.forms.taddratingontenantform.action = "myaccount.jsp";
}
function toLLRateTBack(){
    document.forms.taddratingontenantform.action = "ratelandLord.jsp";
}
function toLLRateTExit(){
    if (confirm("Close Window?")) {
          window.close();
        }
}


//rate tenant by landlard without login
//taddratingontenantwithoutloginform
function toLLRateTHome(){
    document.forms.taddratingontenantwithoutloginform.action = "index.html";
}
function toLLRateTNext(){
    document.forms.taddratingontenantwithoutloginform.action = "myaccount.jsp";
}
function toLLRateTBack(){
    document.forms.taddratingontenantwithoutloginform.action = "ratelandLord.jsp";
}
function toLLRateTExit(){
    if (confirm("Close Window?")) {
          window.close();
        }
}

//view all rating without login form
//viewallratingwithoutloginform
function toViewAllRatingsWOLHome(){
    document.forms.viewallratingwithoutloginform.action = "index.html";
}
function toLlViewAllRatingsWOLNext(){
    document.forms.viewallratingwithoutloginform.action = "aboutus.jsp";
}
function toLlViewAllRatingsWOLBack(){
    document.forms.viewallratingwithoutloginform.action = "viewpostedproperty.jsp";
}
function toLlViewAllRatingsWOLExit(){
    if (confirm("Close Window?")) {
          window.close();
        }
}

//view all post properties without login
//viewallppwithoutloginform
function toViewAllPPWOLHome(){
    document.forms.viewallppwithoutloginform.action = "index.html";
}
function toLlViewAllPPWOLNext(){
    document.forms.viewallppwithoutloginform.action = "viewallratings.jsp";
}
function toLlViewAllPPWOLBack(){
    document.forms.viewallppwithoutloginform.action = "propertydetails.jsp";
}
function toLlViewAllPPWOLExit(){
    if (confirm("Close Window?")) {
          window.close();
        }
}



//view all ratings search
function toVARSearch(){
    var fullnamesearch = document.getElementById('fullnamesearch').value;
    var typeofusersearch = document.getElementById('typeofusersearch').value;
    if(fullnamesearch==""){
        alert("Enter firstname");
        return false;
    }
    if(typeofusersearch=="Select"){
        alert("Select type of user to search");
        return false;
    }
    document.forms.tviewallratingsearchform.action = "viewallratings.jsp";
}