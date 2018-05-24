/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dao.GetQueryInfo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author WIN8
 */
public class LltLoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LltLoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LltLoginServlet at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        System.out.print("LltLoginServlet - post");
        HttpSession session=request.getSession();
        
        if(session.getAttribute("session_dba_userid")!=null || session.getAttribute("session_ll_userid")!=null || session.getAttribute("session_t_userid")!=null){
                //System.out.println("LL session check if loop");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Some user already loged in please logout');");
                out.println("location='landlordlogin.jsp?userlogout=available';");
                out.println("</script>");
        }else{
            //System.out.println("LL session check else loop");
        
            boolean status = new GetQueryInfo().checkllLogin(request.getParameter("lltUserId"),request.getParameter("lltUserpassword"));
            if(status){
                session.setAttribute("session_ll_firstname", GetQueryInfo.ll_firstname);
                session.setAttribute("session_ll_lastname", GetQueryInfo.ll_lastname);
                session.setAttribute("session_ll_userid", GetQueryInfo.ll_userid);
                session.setAttribute("llloginstatus", "success");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Land Lord Login Success');");
                out.println("location='myaccount.jsp?status=success';");
                out.println("</script>");
                //response.sendRedirect("myaccount.jsp");
            }
            else{
                session.setAttribute("llloginstatus", "fails");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Land Lord Login Fails. Please try again');");
                out.println("location='landlordlogin.jsp?status=fails';");
                out.println("</script>");
                //response.sendRedirect("dbalogin.jsp?status=fails");
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
