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
public class LlPostPropServlet extends HttpServlet {

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
            out.println("<title>Servlet LlPostPropServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LlPostPropServlet at " + request.getContextPath() + "</h1>");
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
        System.out.println("LlPostPropServlet - Post");
        String llloginid = request.getParameter("ll_pp_llloginid1");
        String propid = request.getParameter("ll_pp_propid");
        String propcategory = request.getParameter("ll_pp_category");
        String propfurnished = request.getParameter("ll_pp_propfurnished");
        String propname = request.getParameter("ll_pp_propertyname");
        String proptype = request.getParameter("ll_pp_propertytype");
        String proprentamount = request.getParameter("ll_pp_rentamount");
        String propcontactno = request.getParameter("ll_pp_contactno");
        String propertyaddress = request.getParameter("ll_pp_propertyaddress");
        String propadvancemonths = request.getParameter("llt_advancemonths");
        String propadvanceamountpermonth = request.getParameter("ll_pp_advanceamountpermonth");
        //String propagree = request.getParameter("ll_pp_agree");
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession();
        //String sql1 = "insert into llpostproperty values('"+llloginid+"',"+propid+",'"+propcategory+"','"+propfurnished+"','"+propname+"','"+proptype+"','"+proprentamount+"','"+propcontactno+"','"+propertyaddress+"','"+propadvancemonths+"','"+propadvanceamountpermonth+"','"+propagree+"','14/05/2017 02:12:59 PM')";
String sql1 = "insert into llpostproperty values('"+llloginid+"',"+propid+",'"+propcategory+"','"+propfurnished+"','"+propname+"','"+proptype+"','"+proprentamount+"','"+propcontactno+"','"+propertyaddress+"','"+propadvancemonths+"','"+propadvanceamountpermonth+"','14/05/2017 02:12:59 PM')";        
        System.out.println(sql1);
        boolean status = new GetQueryInfo().addllpostproperty(sql1,llloginid,propid);
        if(status){
            
            session.setAttribute("llloginstatus", "success");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('LandLord Added post property entry Success');");
            out.println("location='postproperties.jsp?status=success';");
            out.println("</script>");
            //response.sendRedirect("myaccount.jsp");
	}
	else{
            session.setAttribute("llloginstatus", "fails");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('LandLord Added post property entry fails');");
            out.println("location='postproperties.jsp?status=fails';");
            out.println("</script>");
            //response.sendRedirect("dbalogin.jsp?status=fails");
	}
        //response.sendRedirect("postproperties.jsp?status=success");
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
