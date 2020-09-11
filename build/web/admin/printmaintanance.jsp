<!DOCTYPE html>
<%@page import="com.dl.app.DAL,java.sql.*;" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <%@include file="cssfile.jsp" %>

  </head>

  <body>
    <%@include file="nav.jsp" %>
    <div class="container">
      <h1 class="mt-4 mb-3">
      </h1>
      <div class="row">
          
          
        <!-- Content Column -->
        <div class="col-lg-12 mb-12">
          
        
        <p style="text-transform: uppercase;font-size: 15px;font-weight: bold;" class="text-success">
      
            <% 
                DAL d=new DAL();
                String sql_1 ="SELECT * FROM `soc_details`";
                ResultSet r_1=d.executeQuery(sql_1);
                if(r_1.next()){
                    String soc_name =r_1.getString("soc_name");
                    
                    %>
                    <h1 class="text-center "><%=soc_name%></h1>
                    <h6 class="text-center"><%=r_1.getString("soc_address")%></h6>
                    <h6 class="text-center">Contact : <%=r_1.getString("soc_contact")%>&nbsp;&nbsp;&nbsp;Email : <%=r_1.getString("soc_email")%></h6>
                    <hr>
            <%
                }
                String sql="select c.*,m.* from monthly_collection as c join soc_members as m on c.sm_code = m.sm_code where mc_code = "+Integer.parseInt(request.getParameter("mc_code"));
                String sql1 = "SELECT * FROM `maintain_details` where md_code = 1";
                String sql2 = "SELECT * FROM `maintain_details` where md_code = 2";
                String sql3 = "SELECT * FROM `maintain_details` where md_code = 3";
                ResultSet r=d.executeQuery(sql);
                ResultSet r1=d.executeQuery(sql1);
                ResultSet r2=d.executeQuery(sql2);
                ResultSet r3=d.executeQuery(sql3);
                if(r.next()&&r1.next()&&r2.next()&&r3.next()){         
                   %>
                   
                       <h5 class="text-center">Monthly Maintenance Collection Receipt</h5>
                       <br>
                       <h5>Member Name :- <%=r.getString("sm_name")%></h5>
                       <h5>Collection Month :- <%=r.getString("sm_month")%></h5>
                       <h5>Collection year :- <%=r.getString("sm_year")%></h5>
                       <h5>Payment Date :- <%=r.getString("collect_date")%></h5>
                       <h5><%=r1.getString(2)%> :- <%=r1.getString(3)%> </h5>
                       <h5><%=r2.getString(2)%> :- <%=r2.getString(3)%> X <%=r.getString("two_wheelers")%></h5>
                       <h5><%=r3.getString(2)%> :- <%=r3.getString(3)%> X <%=r.getString("four_wheelers")%></h5>
                       <br>
                       <h5>Total Payment Amount :- <%=r.getString("mc_total")%></h5>
                       <br><br>
                       <h5 class="text-center">Thanks for Payment</h5>
                   
                       
            <%
                }
            %>  
            
            
        
        </p>
                 
        </div>
      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->
<br>
    <!-- Footer -->
    <%@include file="footer.jsp" %>

    <!-- Bootstrap core JavaScript -->
    <%@include file="scriptfile.jsp" %>

  </body>

</html>
