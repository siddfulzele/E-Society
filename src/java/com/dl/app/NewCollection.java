
package com.dl.app;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Arman
 */
public class NewCollection extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           DAL d=new DAL();
           int sm_code = Integer.parseInt(request.getParameter("sm_code"));
            System.out.println(sm_code);
           String collect_date =request.getParameter("collect_date");
           String sm_month = request.getParameter("sm_month");
           String sm_year =request.getParameter("sm_year");
           System.out.println(sm_year);
           String main = "SELECT m.*,d.* FROM `soc_members` as m NATURAL JOIN maintain_details as d WHERE sm_code ="+sm_code+" and md_code = 1";
           String two = "SELECT m.*,d.* FROM `soc_members` as m NATURAL JOIN maintain_details as d WHERE sm_code ="+sm_code+" and md_code = 2";
           String four = "SELECT m.*,d.* FROM `soc_members` as m NATURAL JOIN maintain_details as d WHERE sm_code ="+sm_code+" and md_code = 3";
           ResultSet r1 = d.executeQuery(main);
           ResultSet r2 = d.executeQuery(two);
           ResultSet r3 = d.executeQuery(four);
            System.out.println(main);
           if(r1.next() && r2.next() && r3.next())
           {
               int two_wheeler = r1.getInt("two_wheelers");
               int four_wheeler = r1.getInt("four_wheelers");
               double main_cost = r1.getDouble("md_cost");
               double two_cost = r2.getDouble("md_cost");
               double four_cost = r3.getDouble("md_cost");
               double total_two = two_wheeler * two_cost;
               double total_four = four_wheeler * four_cost;
               double mc_total = total_two + total_four + main_cost;
           
           
                String sql_test = "select * from monthly_collection where sm_code = "+sm_code;
                ResultSet r = d.executeQuery(sql_test);     

                if(r.next())
                {
                    String test_month = r.getString("sm_month");
                    String test_year = r.getString("sm_year");

                     if(sm_month.equals(test_month) && sm_year.equals(test_year))
                     {
                         response.sendRedirect("error.jsp");
                     }
                     else
                     {
                         String sql="insert into monthly_collection(sm_code,collect_date,sm_month,sm_year,mc_total) values("+sm_code+",'"+collect_date+"','"+sm_month+"','"+sm_year+"',"+mc_total+")";
                         d.executeDML(sql);
                         response.sendRedirect("index.jsp");
                     }
                }     
                else
                     {
                         String sql="insert into monthly_collection(sm_code,collect_date,sm_month,sm_year,mc_total) values("+sm_code+",'"+collect_date+"','"+sm_month+"','"+sm_year+"',"+mc_total+")";
                         d.executeDML(sql);
                         response.sendRedirect("index.jsp");
                     }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(NewCollection.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(NewCollection.class.getName()).log(Level.SEVERE, null, ex);
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
