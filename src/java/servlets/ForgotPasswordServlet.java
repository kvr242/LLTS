/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dao.GetQueryInfo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mail.SendMail;

/**
 *
 * @author WIN8
 */
public class ForgotPasswordServlet extends HttpServlet {

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
            out.println("<title>Servlet ForgotPasswordServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPasswordServlet at " + request.getContextPath() + "</h1>");
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
        System.out.println("ForgotPasswordServlet - Post");
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession();
        
        if(request.getParameter("fpwdtype").equals("dba")){
            //System.out.println("dba : "+request.getParameter("dbauserid"));
            
            boolean status = new GetQueryInfo().checkdbaFpLogin(request.getParameter("dbauserid"));
            if(status){
                System.out.println("Dear DBA User : "+GetQueryInfo.dba_firstname+" "+GetQueryInfo.dba_lastname+" your password is : "+GetQueryInfo.dba_password+" & email is : "+GetQueryInfo.dba_email);
                SendMail.sentMail(GetQueryInfo.dba_email, GetQueryInfo.dba_firstname+" "+GetQueryInfo.dba_lastname, GetQueryInfo.dba_password);
                session.setAttribute("dbaloginstatus", "dbafpwdsucess");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Administrator(DBA) your password retrived and sent to your mail successfully');");
                out.println("location='dbalogin.jsp?fpwdstatus=success';");
                out.println("</script>");
            }
            else{
                session.setAttribute("dbaloginstatus", "dbafpwdfails");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Administrator(DBA) your password retrived and displayed in console fails');");
                out.println("location='dbalogin.jsp?fpwdstatus=fails';");
                out.println("</script>");
            }
            response.sendRedirect("dbalogin.jsp");
        }
        if(request.getParameter("fpwdtype").equals("landlord")){
            //System.out.println("landlord : "+request.getParameter("lluserid"));
            boolean status = new GetQueryInfo().checkllFpLogin(request.getParameter("lluserid"));
            if(status){
                System.out.println("Dear Land Lord User : "+GetQueryInfo.ll_firstname+" "+GetQueryInfo.ll_lastname+" your password is : "+GetQueryInfo.ll_password+" & email is : "+GetQueryInfo.ll_email);
                SendMail.sentMail(GetQueryInfo.ll_email, GetQueryInfo.ll_firstname+" "+GetQueryInfo.ll_lastname, GetQueryInfo.ll_password);
                session.setAttribute("llloginstatus", "llfpwdsuccess");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Land Lord your password retrived and sent to your mail successfully');");
                out.println("location='landlordlogin.jsp?fpwdstatus=success';");
                out.println("</script>");
                //response.sendRedirect("myaccount.jsp");
            }
            else{
                session.setAttribute("llloginstatus", "llfpwdfails");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Land Lord your password retrived and displayed in console fails');");
                out.println("location='landlordlogin.jsp?fpwdstatus=fails';");
                out.println("</script>");
            }
        }
        if(request.getParameter("fpwdtype").equals("tenant")){
            //System.out.println("tenant : "+request.getParameter("tuserid"));
            boolean status = new GetQueryInfo().checktFpLogin(request.getParameter("tuserid"));
            //checktFpLogin
            if(status){
                System.out.println("Dear Tenant User : "+GetQueryInfo.t_firstname+" "+GetQueryInfo.t_lastname+" your password is : "+GetQueryInfo.t_password+" & email is : "+GetQueryInfo.t_email);
                SendMail.sentMail(GetQueryInfo.t_email, GetQueryInfo.t_firstname+" "+GetQueryInfo.t_lastname, GetQueryInfo.t_password);
                session.setAttribute("tloginstatus", "tfpwdsucess");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Tenant your password retrived and sent to your mail successfully');");
                out.println("location='tenantlogin.jsp?fpwd=success';");
                out.println("</script>");
                 
            }
            else{
                session.setAttribute("tloginstatus", "tfpwdfails");
                
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Tenant your password retrived and displayed in console fails');");
                out.println("location='tenantlogin.jsp?fpwd=fails';");
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
