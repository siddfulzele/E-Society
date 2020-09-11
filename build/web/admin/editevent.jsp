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
          
        <h2 style="text-transform: uppercase;font-weight: bold;width: 60%" class="text-primary">NEW EVENT</h2>
        <p style="text-transform: uppercase;font-size: 15px;font-weight: bold;" class="text-success">
            <%
          DAL d=new DAL();
          String sql="select * from other_collect_type where oct_code="+Integer.parseInt(request.getParameter("oct_code"));
          ResultSet rs=d.executeQuery(sql);
          if(rs.next()){
              int oct_code = rs.getInt("oct_code");
              String oct_name =rs.getString("oct_name");
              
              %>
        <form method="post" action="UpdateEvent">
            <table class="table table-bordered"style="width:60%">
                <tr>
                    <td>Event Name</td>
                    <td><input type="TEXT" value="<%=oct_name%>" class="form-control" required name="oct_name"></td>
                </tr>                
                <input type="hidden" value="<%=oct_code%>" name="oct_code">
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
