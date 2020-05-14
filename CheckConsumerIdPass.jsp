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
  <% if(request.getParameter("ConsumerId")==null)
       {
        %>
        <script type="text/javascript">
            alert("please login first");
            window.location.href="ConsumerLogin.jsp";
        </script>
        <% 
        }else{
  try
  {
    Class.forName("com.mysql.jdbc.Driver");
    
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sih project?serverTimezone=UTC", "root", "");
       
     PreparedStatement ps=con.prepareStatement("Select pswd_customer from Customer_login where UID_customer = ?");
     ps.setString(1,request.getParameter("ConsumerId"));
     ResultSet rs = ps.executeQuery();
     if(!rs.next())
      { %>
         <script type="text/javascript">
             alert("please enter correct id");
             window.location.href="ConsumerLogin.jsp";
         </script>
        <%
      }
     String pass= rs.getString(1);
    
     
     if(pass.equals(request.getParameter("ConsumerPassword")))
     {  session.setAttribute("id",request.getParameter("ConsumerId"));
      %><script type="text/javascript">
        window.location.assign("ConsumerBuy.jsp");
      </script><% }
     else
     { %>
      <script type="text/javascript">
        alert("Wrong id or password");
        window.location.href="ConsumerLogin.jsp"
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