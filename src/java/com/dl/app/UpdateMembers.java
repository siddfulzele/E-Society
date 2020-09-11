
package com.dl.app;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateMembers extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            DAL d=new DAL();
           int sm_code=Integer.parseInt(request.getParameter("sm_code"));
           String sm_name=request.getParameter("sm_name");
           String room_no=request.getParameter("room_no");
           String family_members=request.getParameter("family_members");
           String sm_contact=request.getParameter("sm_contact");
           String sm_email=request.getParameter("sm_email");
           String four_wheelers=request.getParameter("four_wheelers");
           String two_wheelers=request.getParameter("two_wheelers");
           
           String sql="update soc_members set sm_name = '"+sm_name+"',room_no = '"+room_no+"',family_members = '"+family_members+"',sm_contact = '"+sm_contact+"',sm_email = '"+sm_email+"',two_wheelers = '"+two_wheelers+"',four_wheelers = '"+four_wheelers+"' where sm_code = "+sm_code;
            System.out.println(sql);
           d.executeDML(sql);
         
           response.sendRedirect("members.jsp");
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
