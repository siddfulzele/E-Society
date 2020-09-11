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
          
        <h2 style="text-transform: uppercase;font-weight: bold;width: 60%" class="text-primary">Edit society detail</h2>
        <p style="text-transform: uppercase;font-size: 15px;font-weight: bold;" class="text-success">
            <%
          DAL d=new DAL();
          String sql="select * from soc_details";
          ResultSet rs=d.executeQuery(sql);
          if(rs.next()){
              String soc_name =rs.getString("soc_name");
              int soc_code = rs.getInt("soc_code");
              %>
        <form method="post" action="UpdateSociety">
            <table class="table table-bordered"style="width:60%">
                <tr>
                    <td>Society Name</td>
                    <td><input type="TEXT" value="<%=soc_name%>" class="form-control" required name="soc_name"></td>
                </tr>                
                <tr>
                    <td>Society Address</td>
                    <td><textarea type="TEXT" rows="3" class="form-control" required name="soc_address"><%=rs.getString("soc_address")%></textarea></td>
                </tr>
                <tr>
                    <td>Society Contact</td>
                    <td><input type="TEXT" value="<%=rs.getString("soc_contact")%>" class="form-control" required name="soc_contact"></td>
                </tr> 
                <tr>
                    <td>Society Email</td>
                    <td><input type="TEXT" value="<%=rs.getString("soc_email")%>" class="form-control" required name="soc_email"></td>
                </tr> 
                <input type="hidden" value="<%=soc_code%>" name="soc_code">
                <tr>
                    <td colspan="2"><input type="submit" class="btn btn-sm btn-primary" value="update"></td>
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
