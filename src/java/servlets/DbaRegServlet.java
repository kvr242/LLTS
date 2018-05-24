/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import DBCon.DbConnection;
import dao.GetQueryInfo;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author WIN8
 */
public class DbaRegServlet extends HttpServlet {

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
            out.println("<title>Servlet DbaRegServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DbaRegServlet at " + request.getContextPath() + "</h1>");
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dba_firstname = "";
        String dba_lastname = "";
        String dba_userid = "";
        String dba_password = "";
        String dba_dba_password = "";
        String dba_contactno = "";
        String dba_email = "";
        String dba_securityquestion = "";
        String dba_securityanswer = "";
        PrintWriter out = response.getWriter();
        String updateDba = request.getParameter("updatedao");
        if(updateDba.equals("false")){ //only insert logic
        System.out.println("DbaRegServlet - Post - Insert");
        dba_firstname = request.getParameter("dba_firstname");
        dba_lastname = request.getParameter("dba_lastname");
        dba_userid = request.getParameter("dba_userid");
        dba_password = request.getParameter("dba_password");
        dba_dba_password = request.getParameter("dba_dba_password"); //unique key value
        dba_contactno = request.getParameter("dba_contactno");
        dba_email = request.getParameter("dba_email");
        dba_securityquestion = request.getParameter("dba_securityquestion");
        dba_securityanswer = request.getParameter("dba_securityanswer");
        Connection con = DbConnection.getConnection();
        boolean status = new GetQueryInfo().newDbaReg(dba_firstname, dba_lastname, dba_userid, dba_password,"DBA_", dba_contactno, dba_email, dba_securityquestion, dba_securityanswer);
        HttpSession session = request.getSession();
	if(status){
            session.setAttribute("dbaentrystatus", "success");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Administrator(DBA) Registration Success');");
            out.println("location='dbaregister.jsp?status=success';");
            out.println("</script>");
            //response.sendRedirect("dbaregister.jsp?status=success");
	}
	else{
            session.setAttribute("dbaentrystatus", "fails");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Administrator(DBA) Registration Fails');");
            out.println("location='dbaregister.jsp?status=fails';");
            out.println("</script>");
            //response.sendRedirect("dbaregister.jsp?status=fails");
	}
        }
        if(updateDba.equals("true")){//only Update logic
            System.out.println("DbaRegServlet - Post - Update");
            dba_firstname = request.getParameter("dba_firstname");
            dba_lastname = request.getParameter("dba_lastname");
            dba_userid = request.getParameter("dba_userid1");
            dba_password = request.getParameter("dba_password");
            dba_contactno = request.getParameter("dba_contactno");
            dba_email = request.getParameter("dba_email");
            dba_securityquestion = request.getParameter("dba_securityquestion");
            dba_securityanswer = request.getParameter("dba_securityanswer");
            Connection con = DbConnection.getConnection();
            boolean status = new GetQueryInfo().updateDbaReg(dba_firstname, dba_lastname, dba_userid, dba_password, dba_contactno, dba_email, dba_securityquestion, dba_securityanswer);
            HttpSession session = request.getSession();
            if(status){
                session.setAttribute("dbaentryupdatestatus", "success");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Administrator(DBA) Profile Updated Success');");
                out.println("location='myaccount.jsp?DBAupdatestatus=success';");
                out.println("</script>");
                
            }
            else{
                session.setAttribute("dbaentryupdatestatus", "fails");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Administrator(DBA) Profile Updated Fails');");
                out.println("location='myaccount.jsp?DBAupdatestatus=fails';");
                out.println("</script>");
                
            }
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
