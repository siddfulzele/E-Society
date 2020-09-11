
package com.dl.app;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;
import com.dl.app.DAL;
public class NewCommittee extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           DAL d=new DAL();
           String sc_dof=request.getParameter("sc_dof");
           int soc_chairman=Integer.parseInt(request.getParameter("soc_chairman"));
           int soc_secretary=Integer.parseInt(request.getParameter("soc_secretary"));
           int soc_treasurer=Integer.parseInt(request.getParameter("soc_treasurer"));
           
           String sql="insert into soc_committee(sc_dof,soc_chairman,soc_secretary,soc_treasurer)values('"+sc_dof+"',"+soc_chairman+","+soc_secretary+","+soc_treasurer+")";
           d.executeDML(sql);
           response.sendRedirect("index.jsp");
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
        processRequest(request, response);
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
