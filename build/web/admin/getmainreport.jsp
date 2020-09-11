<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

   

    <%@include file="cssfile.jsp" %>

  </head>

  <body>

    <!-- Navigation -->
    <%@include file="nav.jsp" %>

    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">
       
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.jsp">Home</a>
        </li>
       
      </ol>

      <!-- Content Row -->
      <div class="row">
          
          <%@include file="sidenav.jsp" %>
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">
            <%@page import="com.dl.app.DAL,java.sql.*;"  %>
            <%
                DAL d=new DAL();
                String sm_month =request.getParameter("sm_month");
                String sm_year =request.getParameter("sm_year");
                //out.print( "<h3 align=\"center\">" + sm_month + "</h3>");
                //out.print( "<h3 align=\"center\">" + sm_year + "</h3>");
            %>
            <ul class="nav">
                <li class="active"><a data-toggle="tab" class="btn btn-primary" href="#Paid">Paid</a></li>
                &nbsp;&nbsp;&nbsp;
                <li><a data-toggle="tab" class="btn btn-primary" href="#unpaid">Not Paid</a></li>                  
                <li style="margin-left: 60%;"><a class="btn" ><%=sm_month%></a></li>
                <li><a class="btn">:</a></li>
                <li><a class="btn"><%=sm_year%></a></li>
              </ul>
            <hr>
            <div class="tab-content">
            <div id="Paid" class="tab-pane active">
                
                <table class="table table-bordered"style="width:100%">
                <tr><td colspan="9" class="bg-primary text-center text-white">Maintenance Details</td></tr>
                <tr>
                    <td>Member Name</td>
                    <td>Collection Date</td>
                    <td>Collection Amount</td>
                </tr>
                <tr>
                    <%

                String sql="select m.*,c.* from monthly_collection AS c JOIN soc_members as m on m.sm_code=c.sm_code where sm_month = '"+sm_month+"' and sm_year = '"+sm_year+"'";     
                ResultSet r=d.executeQuery(sql);
                while(r.next()){         
                   %>
                   <tr>

                       <td><%=r.getString("sm_name")%></td>
                       <td><%=r.getString("collect_date")%></td>
                       <td><%=r.getInt("mc_total")%></a></td>
                   </tr>

                   <%
                }
                %>  
                </table>
                
            </div>
            <div id="unpaid" class="tab-pane fade">
              
                <table class="table table-bordered"style="width:100%">
                <tr><td colspan="9" class="bg-primary text-center text-white">Maintenance Details</td></tr>
                <tr>
                    <td>Member Name</td>
                    <td>Contact Number</td>
                    <td>Room Number</td>
                </tr>
                <tr>
                    <%

                String sql1="select * from soc_members WHERE NOT EXISTS (SELECT sm_code from monthly_collection WHERE soc_members.sm_code = monthly_collection.sm_code AND sm_month = '"+sm_month+"' and sm_year = '"+sm_year+"')";     
                ResultSet r1=d.executeQuery(sql1);
                while(r1.next()){         
                   %>
                   <tr>

                       <td><%=r1.getString("sm_name")%></td>
                       <td><%=r1.getString("sm_contact")%></td>
                       <td><%=r1.getString("room_no")%></a></td>
                   </tr>

                   <%
                }
                %>  
                </table>
                
                
            </div>
          </div>

          
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
