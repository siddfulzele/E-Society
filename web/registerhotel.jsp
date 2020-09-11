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
      <h1 class="mt-4 mb-3">Hotel
        <small>Registration</small>
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.jsp">Home</a>
        </li>
        <li class="breadcrumb-item active">Register</li>
      </ol>

      <!-- Intro Content -->
      <div class="row">
        <div class="col-lg-6">
            <form method="post" action="RegisterHotel">
                
            </form>
        </div>
        <div class="col-lg-6">
          <h2>About Registration</h2>
          <p>
              Please provide proper data along with proper location details<br>
              Valid email and password should be provided
          </p>
        </div>
      </div>
      <!-- /.row -->
    </div>
    <!-- /.container -->

    <!-- Footer -->
    <%@include file="footer.jsp" %>

    <%@include file="scriptfile.jsp" %>

  </body>

</html>
