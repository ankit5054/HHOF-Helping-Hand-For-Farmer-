<%@ page import="java.sql.*,java.io.*,java.net.*" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
    <script type="text/javascript">
      window.addEventListener('blur',change);
        function change() {
          // body...
          window.location.href="FarmerLogin.jsp";
        }
  </script> 
</head>
<body>
<%
    if(session.getAttribute("id") == null)
      { %> <script type="text/javascript">
      	 alert("please login first");
      	 window.location.href = "FarmerLogin.jsp";
      </script>
        <%  
      } 
     else
     { 
     	String id=(String)session.getAttribute("id");
      
      String phone ="";
      Connection con=null;
     	try
     	{
     		Class.forName("com.mysql.jdbc.Driver");
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sih project?serverTimezone=UTC", "root", "");
      con.setAutoCommit(false);
      PreparedStatement ps = con.prepareStatement("SELECT Product_name ,product_type,price,Quantity from stock where UID_farmer = ?");
      ps.setString(1,id);
      ResultSet rs = ps.executeQuery();
      
      
     %>
     <div class="container">
       <div class="table-responsive">
         <table class="table table-hover table-bordered">
          <tr class="success"><th>Product</th><th>Type</th><th>Price</th><th>Quantity</th></tr>
          <%  while(rs.next()){%>
           <tr class="info"><td><%= rs.getString(1) %></td>
                            <td><%= rs.getString(2) %></td>
                            <td><%= rs.getInt(3) %></td>
                            <td><%= rs.getInt(4) %></td></tr>
          <% } %>
         </table>
       </div>
     </div> 
     <% }
     catch(Exception e)
     {
     	%>
     <div class="container alert alert-warning ">
     	<%= e %>
     </div>
   <%
     }}
  %> 

</body>
</html>