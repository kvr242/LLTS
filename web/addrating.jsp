<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBCon.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%
    String propertyid = request.getParameter("propertyid");
    String tenantid = request.getParameter("tenantid");
    
    String selectrating = request.getParameter("selectrating");
    
    String landlordid = request.getParameter("landlordid");
    Connection con = DbConnection.getConnection();
    Statement stmt = con.createStatement();
    ResultSet rs = null;
    
    boolean status = false;
    int propratecount = 0;
    int llratecount = 0;
    
    String propertyRateQuery = "SELECT max(rateid) FROM llts_db.propertyrating";
    
    
    System.out.println("============   propertyid   "+propertyid);
    
    if(propertyid!=null){
        //rating for the property code here
        rs = stmt.executeQuery(propertyRateQuery);
        if(rs.next()){
            propratecount = rs.getInt(1)+1;
        }else{
            propratecount = 1;
        }
        
        int result = stmt.executeUpdate("insert into propertyrating values('"+propratecount+"','"+propertyid+"','"+tenantid+"','"+selectrating+"','"+getDate()+"')");
            if (result >= 1) {
		status = true;
		System.out.println("insert property rating Entry ******************************** tenantid="+tenantid);
                //out.println("<script type=\"text/javascript\">");
                //out.println("alert('Tenant rating for property entry Success');");
                //out.println("location='rateproperty.jsp?landlordratestatus=success';");
                //out.println("</script>");
                out.println(""+status);
            } else {
                status = false;
                out.println(""+status);
            }
    }
   
%>
<%!
public static String getDate(){
        java.util.Date now = new java.util.Date();
        String DATE_FORMAT1 = "dd/MM/yyyy hh:mm:ss a";
	SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
	return sdf1.format(now);
    }
%>