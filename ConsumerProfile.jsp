<%@ page import="java.net.*,java.sql.*,java.io.*,java.util.*" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>User Profile</title>
    <script type="text/javascript">
    	 window.addEventListener('blur',change);
        function change() {
          // body...
          window.location.href="ConsumerLogout.jsp";
        }
    </script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
  

  </head>
  <body>
  	<%  if(session.getAttribute("id")==null)
	    {%>
	    	<script type="text/javascript">
	    		alert("please login first");
	    		window.location.assign("ConsumerLogin.jsp");
	    	</script>
         <%
	    }
	    else {
	try
   	{   String id= (String)session.getAttribute("id");
   		Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sih project?serverTimezone=UTC", "root", "");
     PreparedStatement stm = con.prepareStatement("Select * from customer where UID_customer = ?");
     stm.setString(1,id);
     ResultSet rs = stm.executeQuery();
     if(!rs.next())
      { %>
         <script type="text/javascript">
             alert("please enter correct id");
             window.location.assign("ConsumerLogout.jsp");
         </script>
        <%
      }
   
	%>
	<div class="container" >
	
    <table class="table table-bordered  table-hover " style="margin: 0px auto;">
    	
  	<tr class="info" >
  		<th style="text-align:center;"  >Name</th><td><%= rs.getString("Name") %></td>
  	</tr>
  	<tr class="info" >
  		<th style="text-align:center;"  >contact</th><td><%= rs.getString("mob_no") %></td>
  	</tr>
  	
  	
  	<tr class="info" >
  		<th style="text-align:center;"  >State</th><td><%= rs.getString("State") %></td>
  	</tr>
  	<tr class="info" >
  		<th style="text-align:center;"  >City</th><td><%= rs.getString("City_2") %></td>
  	</tr>
  	<tr class="info" >
  		<th style="text-align:center;"  >ZipCode</th><td><%= rs.getString("Zip") %></td>
  	</tr>
  	<tr class="info">
  		<th style="text-align:center;" rowspan='2'>Address</th><td rowspan='2'><%= rs.getString("Address") %></td>
  	</tr>
  	<tr class="info" ></tr>
  </table>
  <a href="EditConsumer.jsp" role="button" class="btn btn-dark btn-md" style="width: 100px;margin-top: 10px;">Edit</a>
</div>

    <% }
   catch(Exception e)
    { %>
    	<script type="text/javascript">
    		alert("<%= e %>");
    	</script>
       <%
    } }
    %> 

      
  </body>
</html>
