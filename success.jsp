<%@ page import="java.sql.*,java.io.*"  %>
<!DOCTYPE html>
<html>
<head>
	<title>success</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
</head>
<body>
	<% if(request.getParameter("FarmerId")==null)
       {
        %>
        <script type="text/javascript">
            alert("please login first");
            window.location.href="FarmerLogin.jsp";
        </script>
        <% 
        }else{
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sih project?serverTimezone=UTC", "root", "");
       
     PreparedStatement ps=con.prepareStatement("Select pswd_farmer from Farmer_login where UID_farmer = ?");
     ps.setString(1,request.getParameter("FarmerId"));
     ResultSet rs = ps.executeQuery();
     if(!rs.next())
      { %>
         <script type="text/javascript">
             alert("please enter correct id");
             window.location.href="FarmerLogin.jsp";
         </script>
        <%
      }
     
     String pass= rs.getString(1);
    
     
     if(pass.equals(request.getParameter("FarmerPassword")))
     {  session.setAttribute("id",request.getParameter("FarmerId"));
     	%><jsp:forward page="showfarmer.jsp" /><% }
     else
     { %>
     	<script type="text/javascript">
     		alert("Wrong id or password");
     		window.location.href="FarmerLogin.jsp"
     	</script>
    	
    <%
      }
	}
	catch(Exception e)
	{%>
     <div class="container alert alert-warning ">
     	<%= e %>
     </div>
   <%}}
	%>
     
</body>
</html>