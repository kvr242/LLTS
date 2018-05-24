<%@page import="java.util.StringTokenizer"%>
<%@page import="DBCon.DbConnection"%>
<%@page import="java.sql.*"%>
<%
	String userid = request.getParameter("userid");
        String pwd = request.getParameter("pwd");
	String dbapassword = "";
	Connection con = DbConnection.getConnection();
	Statement stmt = con.createStatement();
	String sql = "SELECT userid,password,dbapassword from llts_db.dbareg where userid='"+userid+"' and password='"+pwd+"'";
        //System.out.println(sql);
	ResultSet rs = stmt.executeQuery(sql);
	if(rs.next())
	{	
		dbapassword = rs.getString(3);
	}
	
	out.println(dbapassword+",");
%>
