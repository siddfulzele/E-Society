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

    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="../index.jsp" class="text-success">E-SOCIETY MANAGER</a>
        </li>
      </ol>

      <!-- Intro Content -->
      <div class="row">
        <div class="col-lg-6">
            <img src="img/esoc.png" class="img img-fluid">
        </div>
        <div class="col-lg-6">
             <form method="post" action="AdminLogin">
                <TABLE class="table table-bordered">
                    <TR>
                        <TD colspan="2" class="text-center bg-success text-white">ADMIN LOGIN</TD>
                   </TR>

                   <TR>
                         <TD>ADMIN EMAIL</TD>
                         <TD><INPUT TYPE="email" NAME="admin_email" class="form-control" required></TD>
                   </TR>
                   <TR>
                         <TD>ADMIN PASSWORD</TD>
                         <TD><INPUT TYPE="password" NAME="admin_password" class="form-control" required=""></TD>
                   </TR>
                   <TR>
                       <TD colspan="2"><INPUT TYPE="submit" value="LOGIN" class="btn btn-success"></TD>
                   </TR>
                   </TABLE>
            </form>
        </div>
       
      </div>
      <!-- /.row -->
    </div>
    <!-- /.container -->

    <!-- Footer -->

    <%@include file="scriptfile.jsp" %>

  </body>

</html>
