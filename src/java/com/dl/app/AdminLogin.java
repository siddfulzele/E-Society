/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dl.app;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;
import com.dl.app.DAL;
import java.sql.*;

public class AdminLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           DAL d=new DAL();
            String admin_email=request.getParameter("admin_email");
            String admin_password=request.getParameter("admin_password");
            String sql="select * from admin_details where admin_email='"+admin_email+"' and admin_password='"+admin_password+"' limit 1";
            //out.print(admin_name);
            try{
                ResultSet rs=d.executeQuery(sql);
                if(rs.next()){
                HttpSession session= request.getSession(true);
                session.setAttribute("admin_name", rs.getString("admin_name"));
                session.setAttribute("admin_email", rs.getString("admin_email"));
                session.setAttribute("admin_code", rs.getInt("admin_code"));
                rs.close();
                response.sendRedirect("admin/index.jsp"); 
                }
                else{
                    rs.close();
                   response.sendRedirect("index.jsp"); 
                }
                
            }catch(SQLException s){                
                System.out.println(s);
            } 
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
