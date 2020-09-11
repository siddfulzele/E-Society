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
            <table class="table table-bordered" style="width:820px">
                <tr><td colspan="9" class="bg-primary text-center text-white">COMMITTEE DETAILS</td></tr>
                <tr>
                    <td>Formation Date</td>
                    <td>Chairman</td>
                    <td>Secretary</td>
                    <td>Treasurer</td>
                    <td></td>
                </tr>
                <tr>
                    <%
                DAL d=new DAL();
                String sql="select c.*,m.sm_name,m1.sm_name,m2.sm_name from soc_committee as c join soc_members as m on c.soc_chairman = m.sm_code  join soc_members as m1 on c.soc_secretary = m1.sm_code join soc_members as m2 on c.soc_treasurer = m2.sm_code";
                ResultSet r=d.executeQuery(sql);
                while(r.next()){         
                   %>
                   <tr>
                       
                       <td><%=r.getString("sc_dof")%></td>
                       <td><%=r.getString(6)%></td>
                       <td><%=r.getString(7)%></td>
                       <td><%=r.getString(8)%></td>
                       <td><a href="editcommittee.jsp?sc_code=<%=r.getInt("sc_code")%>">edit</a></td>
                   </tr>
                 
                   <%
                }
            %>  
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
