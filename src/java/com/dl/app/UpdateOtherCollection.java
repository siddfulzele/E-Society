/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dl.app;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Siddhant
 */
public class UpdateOtherCollection extends HttpServlet {

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
            DAL d=new DAL();
           int oc_code = Integer.parseInt(request.getParameter("oc_code"));
           int oct_code = Integer.parseInt(request.getParameter("oct_code"));
           int sm_code = Integer.parseInt(request.getParameter("sm_code"));
           String oc_date = request.getParameter("oc_date");
           String oc_month = request.getParameter("oc_month");
           String oc_year = request.getParameter("oc_year");
           double oc_amount =Double.parseDouble(request.getParameter("oc_amount"));
           
           
           String sql="update other_collection set oct_code = "+oct_code+",sm_code = "+sm_code+",oc_date = '"+oc_date+"',oc_month = '"+oc_month+"',oc_year = '"+oc_year+"',oc_amount = "+oc_amount+" where oc_code = "+oc_code;
            System.out.println(sql);
           d.executeDML(sql);
           
           response.sendRedirect("eventcollections.jsp");
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
