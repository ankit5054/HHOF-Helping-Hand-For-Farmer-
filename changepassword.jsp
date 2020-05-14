<%@ page import="java.net.*,java.sql.*,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<%
  if("true".equals(request.getParameter("hidden")) && session.getAttribute("id") != null)
   {
     try{ Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sih project?serverTimezone=UTC", "root", "");
          PreparedStatement ps;
          String id=(String)session.getAttribute("id");
          if(session != null){session.invalidate();}
          con.setAutoCommit(false);
          String url;
          String pass=request.getParameter("pass");
          if( id.charAt(0)=='K')
          {
           ps = con.prepareStatement("Update farmer_login SET pswd_farmer = ? where UID_farmer = ?");
           ps.setString(1,pass);
           ps.setString(2,id);
           url="FarmerLogin.jsp";
          }
          else
          {
            ps = con.prepareStatement("Update customer_login SET pswd_Customer = ? where UID_customer = ?");
           ps.setString(1,pass);
           ps.setString(2,id); 
           url="ConsumerLogin.jsp";
          }
          int a=ps.executeUpdate();
          if(a>0)
           { con.commit();
            %>
             <script type="text/javascript">
               alert("password has been reset");
               window.location.assign("<%= url %>");
             </script>
            <%
           }
           else
           {
            con.rollback();
            %>
             <script type="text/javascript">
               alert("try again");
               window.location.assign("<%= url %>");
             </script>
            <%
           }

        }
        catch(Exception e)
        {
          out.println(e);
        }
   	
   }
   else
   { if(session != null){session.invalidate();}
   	%>
    <script type="text/javascript">
      alert("please follow the right sequence");
      window.location.assign("Main.html");
    </script>
    <%
   }


%>
</body>
</html>