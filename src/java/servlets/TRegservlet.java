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
public class TRegservlet extends HttpServlet {

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
            out.println("<title>Servlet TRegservlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TRegservlet at " + request.getContextPath() + "</h1>");
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
        System.out.println("TRegservlet - Post");
        PrintWriter out = response.getWriter();
        String t_firstname = "";
        String t_lastname = "";
        String t_userid = "";
        String t_password = "";
        String t_t_password = ""; //unique key value
        String t_contactno = "";
        String t_email = "";
        String t_securityquestion = "";
        String t_securityanswer = "";
        
        String updatet = request.getParameter("updatet");
        
        if(updatet.equals("false")){ //only insert logic
            t_firstname = request.getParameter("t_firstname");
            t_lastname = request.getParameter("t_lastname");
            t_userid = request.getParameter("t_userid");
            t_password = request.getParameter("t_password");
            t_t_password = request.getParameter("t_t_password"); //unique key value
            t_contactno = request.getParameter("t_contactno");
            t_email = request.getParameter("t_email");
            t_securityquestion = request.getParameter("t_securityquestion");
            t_securityanswer = request.getParameter("t_securityanswer");
            
            Connection con = DbConnection.getConnection();
            boolean status = new GetQueryInfo().newTReg(t_firstname, t_lastname, t_userid, t_password,"T_", t_contactno, t_email, t_securityquestion, t_securityanswer);
            HttpSession session = request.getSession();
            if(status){
                session.setAttribute("tenantentrystatus", "success");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Tenant Registration Success');");
                out.println("location='tenantregister.jsp?status=success';");
                out.println("</script>");
                //response.sendRedirect("tenantregister.jsp?status=success");
            }
            else{
                session.setAttribute("tenantentrystatus", "fails");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Tenant Registration Fails');");
                out.println("location='tenantregister.jsp?status=fails';");
                out.println("</script>");
                //response.sendRedirect("tenantregister.jsp?status=fails");
            }
        }
        
        if(updatet.equals("true")){//only Update logic
            System.out.println("TRegservlet - Post - Update");
            t_firstname = request.getParameter("t_firstname");
            t_lastname = request.getParameter("t_lastname");
            t_userid = request.getParameter("t_userid1");
            t_password = request.getParameter("t_password");
            t_t_password = request.getParameter("t_t_password"); //unique key value
            t_contactno = request.getParameter("t_contactno");
            t_email = request.getParameter("t_email");
            t_securityquestion = request.getParameter("t_securityquestion");
            t_securityanswer = request.getParameter("t_securityanswer");
            
            Connection con = DbConnection.getConnection();
            boolean status = new GetQueryInfo().updatetReg(t_firstname, t_lastname, t_userid, t_password, t_contactno, t_email, t_securityquestion, t_securityanswer);
            HttpSession session = request.getSession();
            if(status){
                session.setAttribute("tenantentrystatus", "success");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Tenant Profile Updated Success');");
                out.println("location='myaccount.jsp?Tenantupdatestatus=success';");
                out.println("</script>");
                
            }
            else{
                session.setAttribute("tenantentrystatus", "fails");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Tenant Profile Updated Fails');");
                out.println("location='myaccount.jsp?Tenantupdatestatus=fails';");
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
