<%-- 
    Document   : logout.jsp
    Created on : 14 May, 2017, 2:18:56 PM
    Author     : WIN8
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            String dbaQueryString = "";
            String llQueryString = "";
            String tQueryString = "";
            String allQueryString = "";
            
            String dbaSession = (String)session.getAttribute("session_dba_userid");
            String llSession = (String)session.getAttribute("session_ll_userid");
            String ttSession = (String)session.getAttribute("session_t_userid");
            
            dbaQueryString = request.getParameter("dba");
            llQueryString = request.getParameter("ll");
            tQueryString = request.getParameter("t");
            allQueryString = request.getParameter("all");
            //System.out.println("dbaQueryString : "+dbaQueryString);
            //System.out.println("llQueryString : "+llQueryString);
            //System.out.println("tQueryString : "+tQueryString);
            
            if(dbaQueryString!=null){
                System.out.println("dbaQueryString loop ");
                session.removeAttribute("session_dba_userid");
                response.sendRedirect("dbalogin.jsp?logout=success");
            }
            if(llQueryString!=null){
                System.out.println("llQueryString loop ");
                session.removeAttribute("session_ll_userid");
                response.sendRedirect("landlordlogin.jsp?logout=success");
            }
            if(tQueryString!=null){
                System.out.println("tQueryString loop ");
                session.removeAttribute("session_t_userid");
                response.sendRedirect("tenantlogin.jsp?logout=success");
            }
            if(allQueryString!=null){
                System.out.println("tQueryString loop ");
                session.removeAttribute("session_dba_userid");
                session.removeAttribute("session_ll_userid");
                session.removeAttribute("session_t_userid");
            }
        %>
    </body>
</html>
