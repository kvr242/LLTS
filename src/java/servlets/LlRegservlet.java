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
public class LlRegservlet extends HttpServlet {

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
            out.println("<title>Servlet LlRegservlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LlRegservlet at " + request.getContextPath() + "</h1>");
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
            String llt_firstname = "";
            String llt_lastname = "";
            String llt_agentname = "";
            String llt_userid = "";
            String llt_password = "";
            String llt_llt_password = ""; //unique key value
            String llt_contactno = "";
            String llt_email = "";
            String llt_securityquestion = "";
            String llt_securityanswer = "";
        PrintWriter out = response.getWriter();
        
        String updatell = request.getParameter("updatell");
        if(updatell.equals("false")){ //only insert logic
            System.out.println("LlRegservlet - Post - insert");
            llt_firstname = request.getParameter("llt_firstname");
            llt_lastname = request.getParameter("llt_lastname");
            llt_agentname = request.getParameter("llt_agentname");
            llt_userid = request.getParameter("llt_userid");
            llt_password = request.getParameter("llt_password");
            llt_llt_password = request.getParameter("llt_llt_password"); //unique key value
            llt_contactno = request.getParameter("llt_contactno");
            llt_email = request.getParameter("llt_email");
            llt_securityquestion = request.getParameter("llt_securityquestion");
            llt_securityanswer = request.getParameter("llt_securityanswer");
        
        
        
        Connection con = DbConnection.getConnection();
        boolean status = new GetQueryInfo().newLlReg(llt_firstname, llt_lastname, llt_agentname, llt_userid, llt_password,"LL_", llt_contactno, llt_email, llt_securityquestion, llt_securityanswer);
        HttpSession session = request.getSession();
            if(status){
                session.setAttribute("landlordentrystatus", "success");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Land Lord Registration Success');");
                out.println("location='landlordregister.jsp?status=success';");
                out.println("</script>");
                //response.sendRedirect("landlordregister.jsp?status=success");
            }
            else{
                session.setAttribute("landlordentrystatus", "fails");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Land Lord Registration Fails');");
                out.println("location='landlordregister.jsp?status=fails';");
                out.println("</script>");
                //response.sendRedirect("landlordregister.jsp?status=fails");
            }
        }
         if(updatell.equals("true")){//only Update logic
            System.out.println("LlRegservlet - Post - Update");
            llt_firstname = request.getParameter("llt_firstname");
            llt_lastname = request.getParameter("llt_lastname");
            llt_agentname = request.getParameter("llt_agentname");
            llt_userid = request.getParameter("llt_userid1");
            llt_password = request.getParameter("llt_password");
            llt_llt_password = request.getParameter("llt_llt_password"); //unique key value
            llt_contactno = request.getParameter("llt_contactno");
            llt_email = request.getParameter("llt_email");
            llt_securityquestion = request.getParameter("llt_securityquestion");
            llt_securityanswer = request.getParameter("llt_securityanswer");
            Connection con = DbConnection.getConnection();
            
            boolean status = new GetQueryInfo().updatellReg(llt_firstname, llt_lastname, llt_agentname, llt_userid, llt_password, llt_contactno, llt_email, llt_securityquestion, llt_securityanswer);
            HttpSession session = request.getSession();
            if(status){
                session.setAttribute("landlordentrystatus", "success");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Land Lord Profile Updated Success');");
                out.println("location='myaccount.jsp?LandLordupdatestatus=success';");
                out.println("</script>");
                
            }
            else{
                session.setAttribute("landlordentrystatus", "fails");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Land Lord Profile Updated Fails');");
                out.println("location='myaccount.jsp?LandLordupdatestatus=fails';");
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
