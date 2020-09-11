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
          
        <h2 style="text-transform: uppercase;font-weight: bold;width: 60%" class="text-primary">EDIT MEMBER</h2>
        <p style="text-transform: uppercase;font-size: 15px;font-weight: bold;" class="text-success">
         <%@page import="com.dl.app.DAL,java.sql.*;" %>
         <%
          DAL d=new DAL();
          String sql="select * from soc_members where sm_code="+Integer.parseInt(request.getParameter("sm_code"));
          ResultSet rs=d.executeQuery(sql);
          if(rs.next()){
              int sm_code = rs.getInt("sm_code");
              String sm_name=rs.getString("sm_name");
              String room_no=rs.getString("room_no");
              String family_members=rs.getString("family_members");
              String sm_contact=rs.getString("sm_contact");
              String sm_email=rs.getString("sm_email");
              String four_wheelers=rs.getString("four_wheelers");
              String two_wheelers=rs.getString("two_wheelers");
              %>
        <form method="post" action="UpdateMembers">
            <table class="table table-bordered"style="width:60%">
                <tr>
                    <td>Member Name</td>
                    <td><input type="text" class="form-control" value="<%=sm_name%>" required name="sm_name"></td>
                </tr>
                <tr>
                    <td>Room No</td>
                    <td><input type="text" class="form-control" value="<%=room_no%>" required name="room_no"></td>
                </tr>
                <tr>
                    <td>Family Members</td>
                    <td><input type="number" class="form-control" value="<%=family_members%>" required name="family_members"></td>
                </tr>
                <tr>
                    <td>Member Contact</td>
                    <td><input type="text" class="form-control" required value="<%=sm_contact%>" name="sm_contact" maxlength="10"></td>
                </tr>
                <tr>
                    <td>Member Email</td>
                    <td><input type="email" class="form-control" value="<%=sm_email%>" required name="sm_email"></td>
                </tr>
                <tr>
                    <td>Two Wheelers</td>
                    <td><input type="number" class="form-control" value="<%=two_wheelers%>" required name="two_wheelers"></td>
                </tr>
                <tr>
                    <td>Four Wheelers</td>
                    <td><input type="number" class="form-control" value="<%=four_wheelers%>" required name="four_wheelers"></td>
                </tr>
                <tr>
                <input type="hidden" value="<%=sm_code%>" name="sm_code">
                    <td colspan="2"><input type="submit" class="btn btn-sm btn-primary"></td>
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
