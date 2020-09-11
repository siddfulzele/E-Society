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
          
        <h2 style="text-transform: uppercase;font-weight: bold;width: 60%" class="text-primary">NEW COMMITTEE</h2>
        <p style="text-transform: uppercase;font-size: 15px;font-weight: bold;" class="text-success">
        <form method="post" action="NewCommittee">
            <table class="table table-bordered"style="width:60%">
                <tr>
                    <td>Formation Date</td>
                    <td><input type="date" class="form-control" required name="sc_dof"></td>
                </tr>
                <tr>
                    <td>Chairman</td>
                    <td>
                        <select name="soc_chairman" class="form-control" required>
                            <option value="" selected>Select</option>
                        
                        <%
                            DAL d=new DAL();
                            String sql="select * from soc_members";
                            ResultSet rs1=d.executeQuery(sql);
                            while(rs1.next()){
                                %>
                                <option value="<%=rs1.getInt("sm_code")%>"><%=rs1.getString("sm_name")%></option>
                                <%
                            }
                        %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Secretary</td>
                    <td>
                         <select name="soc_secretary" class="form-control" required>
                            <option value="" selected>Select</option>
                        <%
                            ResultSet rs2=d.executeQuery(sql);
                            while(rs2.next()){
                                %>
                                <option value="<%=rs2.getInt("sm_code")%>"><%=rs2.getString("sm_name")%></option>
                                <%
                            }
                        %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Treasurer</td>
                    <td>
                         <select name="soc_treasurer" class="form-control" required>
                            <option value="" selected>Select</option>
                        <%
                            ResultSet rs3=d.executeQuery(sql);
                            while(rs3.next()){
                                %>
                                <option value="<%=rs3.getInt("sm_code")%>"><%=rs3.getString("sm_name")%></option>
                                <%
                            }
                        %>
                        </select>
                    </td>
                    
                </tr>
                
                <tr>
                    <td colspan="2"><input type="submit" class="btn btn-sm btn-primary" value="Create"></td>
                </tr>
            </table>
            
        </form>
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
