<%@ page import="java.sql.*,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<% if(session.getAttribute("id")==null)
    {
    	%>
      <script type="text/javascript">
        alert("please login first");
        window.location.assign("ConsumerLogout.jsp");
      </script>
     <%
    }
    else{
 String a = request.getParameter("access");
 String val = request.getParameter(a);
 String arr[] = val.split(",");
 String product=arr[0];
 String type=arr[1];
 String fid=arr[2];
 String cid=arr[3];
 int qty = Integer.parseInt(arr[5]);
 
  try
  {
   Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sih project?serverTimezone=UTC", "root", "");
    con.setAutoCommit(false);
    PreparedStatement ps = con.prepareStatement("Delete from cart where UID_farmer = ? and UID_customer = ? and Product_name = ? and Product_type = ?");
    ps.setString(1,fid); ps.setString(2,cid);
    ps.setString(3,product); ps.setString(4,type);
    int i = ps.executeUpdate();
    if(i>0)
     {  
     	PreparedStatement ps2 = con.prepareStatement("Update stock SET Quantity = Quantity + ? where UID_farmer = ? and Product_name = ? and product_type = ? ");
     	ps2.setInt(1,qty);
     	ps2.setString(2,fid);
     	ps2.setString(3,product);
     	ps2.setString(4,type);
     	int j = ps2.executeUpdate();
     	if(j>0)
     	{
     	  con.commit();
     	  con.close();
     	%>
     	<script type="text/javascript">
     		alert("product deleted");
     		
     	</script>
     	<% 
     	response.sendRedirect("ConsumerBuy.jsp");
     	}
     	else 
     	{
     	con.rollback();
     	con.close();
     	%>
     	<script type="text/javascript">
     		alert("product is not deleted");
     		window.location.assign("ConsumerBuy.jsp");
     	</script>
     	<%	
     	}
     	
     }
     else
     {
     	con.rollback();
     	con.close();
     		%>
     	<script type="text/javascript">
     		alert("please try again");
     		window.location.assign("showcart.jsp");
     	</script>
     	<%
     }
  }
  catch(Exception e)
  {
  	%>
  	<script type="text/javascript">
  		alert(e);
  	</script>
  	<%
  }
}
%>
</body>
</html>