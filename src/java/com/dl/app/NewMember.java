
package com.dl.app;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;
import com.dl.app.DAL;
public class NewMember extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           DAL d=new DAL();
           String sm_name=request.getParameter("sm_name");
           String room_no=request.getParameter("room_no");
           String sm_email=request.getParameter("sm_email");
           String sm_contact=request.getParameter("sm_contact");
           String family_members=request.getParameter("family_members");
           String two_wheelers=request.getParameter("two_wheelers");
           String four_wheelers=request.getParameter("four_wheelers");
           String sql="insert into soc_members(sm_name,sm_email,sm_contact,room_no,family_members,two_wheelers,four_wheelers)values"
                   + "('"+sm_name+"','"+sm_email+"','"+sm_contact+"','"+room_no+"','"+family_members+"','"+two_wheelers+"','"+four_wheelers+"')";
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
