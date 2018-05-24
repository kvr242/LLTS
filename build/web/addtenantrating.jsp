<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBCon.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%
    
    String tenantid = request.getParameter("tenantid");
    
    String selectrating = request.getParameter("selectrating");
    
    String landlordid = request.getParameter("landlordid");
    Connection con = DbConnection.getConnection();
    Statement stmt = con.createStatement();
    ResultSet rs = null;
    
    boolean status = false;
    int propratecount = 0;
    int llratecount = 0;
    String tenantRateQuery = "SELECT max(rateid) FROM llts_db.tenantrating";
    //System.out.println("============   landlordid   "+landlordid);
    if(tenantid!=null){
        //rating for the landlord code here
        rs = stmt.executeQuery(tenantRateQuery);
        if(rs.next()){
            llratecount = rs.getInt(1)+1;
        }else{
            llratecount = 1;
        }
        int result = stmt.executeUpdate("insert into tenantrating values('"+llratecount+"','"+landlordid+"','"+tenantid+"','"+selectrating+"','"+getDate()+"')");
        if (result >= 1) {
		status = true;
		System.out.println("insert tenant rating Entry ******************************** landlordid="+landlordid);
                //out.println("<script type=\"text/javascript\">");
                //out.println("alert('Tenant rating for landlord entry Success');");
                //out.println("location='ratelandLord.jsp?landlordratestatus=success';");
                //out.println("</script>");
                
            } else {
                status = false;
               
            }
        out.println(status+",");
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
