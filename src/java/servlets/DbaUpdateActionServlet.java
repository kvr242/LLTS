/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;


import dao.GetQueryInfo;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author laxmikanth
 */
public class DbaUpdateActionServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DbaUpdateActionServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DbaUpdateActionServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public static String getDate(){
        java.util.Date now = new java.util.Date();
        String DATE_FORMAT1 = "dd/MM/yyyy hh:mm:ss a";
	SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
	return sdf1.format(now);
    } 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String userid = request.getParameter("userid");
        String usertype = request.getParameter("usertype");
        
        boolean dbaUpdateStatus = new GetQueryInfo().dbaUpdateDataCheck(userid,usertype);
        
        
        
        System.out.println("DbaUpdateActionServlet - Post");
        String returnData1 = "";
        String returnData2 = "";
        String query = "";
        String dbaupdatequery = "";
        if(usertype.equals("LandLord")){
            query = "update landlordreg set firstname='"+firstname+"',lastname='"+lastname+"' where userid='"+userid+"'";
            if(dbaUpdateStatus==true){
                //update details
                dbaupdatequery = "update updatedatabase set firstname='"+firstname+"',lastname='"+lastname+"',regdate='"+getDate()+"' where userid='"+userid+"' and usertype='LandLord'";
            }else{
                //insert details
                dbaupdatequery = "insert into updatedatabase (userid,firstname,lastname,usertype,regdate) values ('"+userid+"','"+firstname+"','"+lastname+"','LandLord','"+getDate()+"');";
            }
            
            
            returnData1 = "alert('Land Lord Profile Updated Success');";
            returnData2 = "location='updatedatabase.jsp?LandLordupdatestatus=success';";
        }
        if(usertype.equals("Tenant")){
            query = "update tenantreg set firstname='"+firstname+"',lastname='"+lastname+"' where userid='"+userid+"'";
            if(dbaUpdateStatus==true){
                //update details
                dbaupdatequery = "update updatedatabase set firstname='"+firstname+"',lastname='"+lastname+"',regdate='"+getDate()+"' where userid='"+userid+"' and usertype='Tenant'";
            }else{
                //insert details
                dbaupdatequery = "insert into updatedatabase (userid,firstname,lastname,usertype,regdate) values ('"+userid+"','"+firstname+"','"+lastname+"','Tenant','"+getDate()+"');";
            }
            
            returnData1 = "alert('Tenant Profile Updated Success');";
            returnData2 = "location='updatedatabase.jsp?Tenantupdatestatus=success';";
        }
        
        //boolean status = new GetQueryInfo().updateDbaAction(query,userid);
        boolean dbaupdatestatus = new GetQueryInfo().updateDbaData(dbaupdatequery,userid);
        PrintWriter out = response.getWriter();
        //System.out.println(query);
        if(dbaupdatestatus){
                out.println("<script type=\"text/javascript\">");
                out.println(returnData1);
                out.println(returnData2);
                out.println("</script>");
            }
            else{
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Dba Updated Fails');");
                out.println("location='updatedatabase.jsp?Dbaupdatestatus=fails';");
                out.println("</script>");
            }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
