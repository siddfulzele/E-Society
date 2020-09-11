<%@page import="com.dl.app.DAL,java.sql.*;"%>
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
          
        <h2 style="text-transform: uppercase;font-weight: bold;width: 60%" class="text-primary">EDIT MAINTENANCE TYPE</h2>
        <p style="text-transform: uppercase;font-size: 15px;font-weight: bold;" class="text-success">
            <%
          DAL d=new DAL();
          String sql="select * from maintain_details where md_code="+Integer.parseInt(request.getParameter("md_code"));
          ResultSet rs=d.executeQuery(sql);
          if(rs.next()){
              int md_code = rs.getInt("md_code");
              String md_name=rs.getString("md_name");
              double md_cost = rs.getDouble("md_cost");
              %>
        <form method="post" action="UpdateMaintenance">
            <table class="table table-bordered"style="width:60%">
                <tr>
                    <td>Maintenance Name</td>
                    <td><input type="text" class="form-control" value="<%=md_name%>" readonly required name="md_name"></td>
                </tr>           
                <tr>
                    <td>Maintenance Cost</td>
                    <td><input type="text" class="form-control" value="<%=md_cost%>" required name="md_cost"></td>
                </tr>
                <input type="hidden" value="<%=md_code%>" name="md_code">
                <tr>
                    <td colspan="2"><input type="submit" class="btn btn-sm btn-primary" value="Update"></td>
                </tr>
            </table>
            
        </form>
        <%
          }
          
          %>
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
