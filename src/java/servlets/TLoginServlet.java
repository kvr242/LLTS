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

/**
 *
 * @author WIN8
 */
public class TLoginServlet extends HttpServlet {

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
            out.println("<title>Servlet TLoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TLoginServlet at " + request.getContextPath() + "</h1>");
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
        System.out.print("TLoginServlet - post");
        HttpSession session=request.getSession();
        
        if(session.getAttribute("session_dba_userid")!=null || session.getAttribute("session_ll_userid")!=null || session.getAttribute("session_t_userid")!=null){
            System.out.println("T session check if loop");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Some user already loged in please logout');");
            out.println("location='tenantlogin.jsp?userlogout=available';");
            out.println("</script>");
        }else{
            System.out.println("T session check else loop");
        
            boolean status = new GetQueryInfo().checktLogin(request.getParameter("tUserId"),request.getParameter("tUserpassword"));
            if(status){
                session.setAttribute("session_t_firstname", GetQueryInfo.t_firstname);
                session.setAttribute("session_t_lastname", GetQueryInfo.t_lastname);
                session.setAttribute("session_t_userid", GetQueryInfo.t_userid);
                session.setAttribute("tloginstatus", "success");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Tenant Login Success');");
                out.println("location='myaccount.jsp?status=success';");
                out.println("</script>");
                //response.sendRedirect("myaccount.jsp");
            }
            else{
                session.setAttribute("tloginstatus", "fails");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Tenant Login Fails. Please try again');");
                out.println("location='tenantlogin.jsp?status=fails';");
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
