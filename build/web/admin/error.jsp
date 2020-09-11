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
            <%@page import="com.dl.app.DAL,java.sql.*;" %>
            <%
               DAL d=new DAL();
               ResultSet rs=d.executeQuery("select * from soc_details where soc_code=1 limit 1");
               if(rs.next()){
                   %>
                   <h2 style="text-transform: uppercase;font-weight: bold;" class="text-primary">OOP's</h2>
                   <p style="text-transform: uppercase;font-size: 15px;font-weight: bold;" class="text-success">
                       Given Member Already Paid the Amount
                   </p>
                   <%
               }
            %>
          
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
