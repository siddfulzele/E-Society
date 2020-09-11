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
        <div  style="overflow-x: auto;height: 400px;">
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
                String sql="select c.*,m.sm_name,oct.oct_name from other_collection as c join soc_members as m on c.sm_code = m.sm_code  join other_collect_type as oct on c.oct_code = oct.oct_code where oc_code="+Integer.parseInt(request.getParameter("oc_code"));
                ResultSet r=d.executeQuery(sql);
                if(r.next()){         
                   %>
                   <div style="padding: 0 150px;">
                       <h5 class="text-center">Event Collection Receipt</h5>
                       <br>
                       <h5>Member Name :- <%=r.getString("sm_name")%></h5>
                       <h5>Event Name :- <%=r.getString("oct_name")%></h5>
                       <h5>Payment Date :- <%=r.getString("oc_date")%></h5>
                       <h5>Payment Amount :- <%=r.getString("oc_amount")%></h5>
                       <br><br>
                       <h5 class="text-center">Thanks for Payment</h5>
                   </div>
                       
            <%
                }
            %>  
            
            
        </div>
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
