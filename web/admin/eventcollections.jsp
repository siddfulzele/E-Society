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
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.jsp">Home</a>
        </li>
      </ol>
      <div class="row">
          
          <%@include file="sidenav.jsp" %>
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">
          
        
        <p style="text-transform: uppercase;font-size: 15px;font-weight: bold;" class="text-success">
        <div  style="overflow-x: auto;height: 400px;">
            <table class="table table-bordered"style="width:100%">
                <tr><td colspan="9" class="bg-primary text-center text-white">Event Collection</td></tr>
                 <tr>
                    <td>Member Name</td>
                    <td>Event Name</td>
                    <td>Payment Date</td>
                    <td>Month</td>
                    <td>Year</td>
                    <td>Amount</td>
                    <td></td>
                    <td>Print</td>
                </tr>
                    <%
                DAL d=new DAL();
                String sql="select c.*,m.sm_name,oct.oct_name from other_collection as c join soc_members as m on c.sm_code = m.sm_code  join other_collect_type as oct on c.oct_code = oct.oct_code ";
                ResultSet r=d.executeQuery(sql);
                
                while(r.next()){         
                   %>
                   <tr>
                       
                       <td><%=r.getString("sm_name")%></td>
                       <td><%=r.getString("oct_name")%></td>
                       <td><%=r.getString("oc_date")%></td>
                       <td><%=r.getString("oc_month")%></td>
                       <td><%=r.getString("oc_year")%></td>
                       <td><%=r.getString("oc_amount")%></td>
                       <td><a href="editeventcollection.jsp?oc_code=<%=r.getInt("oc_code")%>">edit</a></td>
                       <td><a href="printevent.jsp?oc_code=<%=r.getInt("oc_code")%>">Print</a></td>
                   </tr>
                 
                   <%
                }
            %>  
            <%
                String sql1="select oc_amount from other_collection";
                ResultSet r1=d.executeQuery(sql1);
                double total_amount = 0;
                while(r1.next()){  
                   double amount = r1.getDouble("oc_amount");
                   total_amount = total_amount + amount;
                }
            %>  
            <tr>
                <td colspan="5" class="text-center ">Total Collection</td>
                <td><%=total_amount%></td>
                <td colspan="2" ></td>
            </tr>
            </table>
            
        </div>
        </p>
                 
        </div>
      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->

    <!-- Footer -->
    <%@include file="footer.jsp" %>

    <!-- Bootstrap core JavaScript -->
    <%@include file="scriptfile.jsp" %>

  </body>

</html>
