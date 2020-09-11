<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.dl.app.DAL"%>
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
          
        <h2 style="text-transform: uppercase;font-weight: bold;width: 60%" class="text-primary">edit Collection</h2>
        <p style="text-transform: uppercase;font-size: 15px;font-weight: bold;" class="text-success">            
            <%
          DAL d=new DAL();
          String sql="select c.*,m.sm_name,oct.oct_name from other_collection as c join soc_members as m on c.sm_code = m.sm_code  join other_collect_type as oct on c.oct_code = oct.oct_code where oc_code="+Integer.parseInt(request.getParameter("oc_code"));
          ResultSet rs=d.executeQuery(sql);
          if(rs.next()){
              int oc_code = rs.getInt("oc_code");
              %>
        <form method="post" action="UpdateOtherCollection">
            <table class="table table-bordered"style="width:60%">               
                <tr>
                    <td>Event</td>
                    <td>
                        <select name="oct_code" class="form-control" required>
                            <option value="<%=rs.getString("oct_code")%>" selected><%=rs.getString("oct_name")%></option>
                        
                        <%
                          
                            String sql1="select * from other_collect_type";
                            ResultSet rs1=d.executeQuery(sql1);
                            while(rs1.next()){
                                %>
                                <option value="<%=rs1.getInt("oct_code")%>"><%=rs1.getString("oct_name")%></option>
                                <%
                            }
                        %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td>
                         <select name="sm_code" class="form-control" required>
                            <option value="<%=rs.getString("sm_code")%>" selected><%=rs.getString("sm_name")%></option>
                        <%
                            String sql2="select * from soc_members";
                            ResultSet rs2=d.executeQuery(sql2);
                            
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
                    <td>Collection Date</td>
                    <td>
                        <input type="date" value="<%=rs.getString("oc_date")%>" name="oc_date" class="form-control" required>
                    </td>
                </tr>   
                <tr>
                    <td>Collection Month</td>
                    <td>
                         <select name="oc_month" class="form-control" required>
                            <option value="<%=rs.getString("oc_month")%>" selected><%=rs.getString("oc_month")%></option>                        
                            <option value="January" >January</option>
                            <option value="February" >February</option>
                            <option value="March" >March</option>
                            <option value="April" >April</option>
                            <option value="May" >May</option>
                            <option value="June" >June</option>
                            <option value="July" >July</option>
                            <option value="August" >August</option>
                            <option value="September" >September</option>
                            <option value="October" >October</option>
                            <option value="November" >November</option>
                            <option value="December" >December</option>
                        </select>
                    </td>
                </tr>   
                <tr>
                    <td>Collection year</td>
                    <td>
                         <select name="oc_year" class="form-control" required>
                            <option value="<%=rs.getString("oc_year")%>" selected><%=rs.getString("oc_year")%></option>
                            <%        
                                Date date = new Date();
                                SimpleDateFormat ft = new SimpleDateFormat ("yyyy");
                                int year = Integer.parseInt(ft.format(date));
                                int yearPrev = year - 5;
                                int yearNext = year + 5;
                                out.print( "<h2 align=\"center\">" + yearPrev + "</h2>");
                                out.print( "<h2 align=\"center\">" + yearNext + "</h2>");
                                while(yearPrev<=yearNext){
                                yearPrev++;
                                %>
                                <option value="<%=yearPrev%>"><%=yearPrev%></option>
                                <%
                            }
                        %>
                        </select>
                    </td>
                </tr>   
                <tr>
                    <td>Amount</td>
                    <td><input type="text" value="<%=rs.getString("oc_amount")%>" class="form-control" required name="oc_amount"></td>
                </tr> 
                <input type="hidden" value="<%=oc_code%>" name="oc_code">
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
