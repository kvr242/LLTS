<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBCon.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%
    
    String landlordid = request.getParameter("landlordid");
    String tenantid = request.getParameter("tenantid");
    String selectedlandlordaction = request.getParameter("selectedlandlordaction");
    String selectedtenantaction = request.getParameter("selectedtenantaction");
    Connection con = DbConnection.getConnection();
    Statement stmt = con.createStatement();
    boolean status = false;
    
    String landLordActionQuery = "UPDATE landlordreg SET status = '"+selectedlandlordaction+"' where userid='"+landlordid+"'";
    String tenantActionQuery = "UPDATE tenantreg SET status = '"+selectedtenantaction+"' where userid='"+tenantid+"'";
    
    if(landlordid!=null){
        int result = stmt.executeUpdate(landLordActionQuery);
        //System.out.print(landLordActionQuery);
        if (result >= 1) {
		status = true;
		System.out.println("Update LandLord Action Entry ******************************** landlordid="+landlordid);
                //out.println("<script type=\"text/javascript\">");
                //out.println("alert('Update LandLord Action Entry Success');");
                //out.println("location='updatedatabase.jsp?landlordactionstatus=success';");
                //out.println("</script>");
                //response.sendRedirect("updatedatabase.jsp?landlordactionstatus=success");
            } else {
                status = false;
                //response.sendRedirect("updatedatabase.jsp?landlordactionstatus=fails");
            }
        //out.println(status+",");
        //response.getWriter().write(status+",");
        //System.out.println(landLordActionQuery);
    }
    if(tenantid!=null){
        int result = stmt.executeUpdate(tenantActionQuery);
        //System.out.print(tenantActionQuery);
        if (result >= 1) {
		status = true;
		System.out.println("Update Tenant Action Entry ******************************** tenantid="+tenantid);
                //out.println("<script type=\"text/javascript\">");
                //out.println("alert('Update Tenant Action Entry Success');");
                //out.println("location='updatedatabase.jsp?tenantactionstatus=success';");
                //out.println("</script>");
                //response.sendRedirect("updatedatabase.jsp?tenantactionstatus=success");
            } else {
                status = false;
                //response.sendRedirect("updatedatabase.jsp?tenantactionstatus=fails");
            }
        //response.getWriter().write(status+",");
         //System.out.println(tenantActionQuery);
    }
    //response.getWriter().write(status+",");
    out.println(status+",");
%>