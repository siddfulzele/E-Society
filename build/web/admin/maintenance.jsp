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
                <tr><td colspan="9" class="bg-primary text-center text-white">Maintenance Details</td></tr>
                <tr>
                    <td>Maintenance Name</td>
                    <td>Maintenance Cost</td>
                    <td></td>
                </tr>
                <tr>
                    <%
                DAL d=new DAL();
                String sql="select * from maintain_details";
                ResultSet r=d.executeQuery(sql);
                while(r.next()){         
                   %>
                   <tr>
                       
                       <td><%=r.getString("md_name")%></td>
                       <td><%=r.getString("md_cost")%></td>
                       <td><a href="editmaintenance.jsp?md_code=<%=r.getInt("md_code")%>">edit</a></td>
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
