<%@ page import="java.util.*,java.sql.*,java.net.*" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
  
  <% if(session.getAttribute("id")==null || request.getParameter("tostorecart") == null)
   {
     %>
      <script type="text/javascript">
        alert("please login first");
        window.location.assign("ConsumerLogout.jsp");
      </script>
     <%
   } else{
   try{
    Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sih project?serverTimezone=UTC", "root", "");
    con.setAutoCommit(false);
    int qty = Integer.parseInt(request.getParameter("qty"));
    String str = request.getParameter("cart");
    String val = request.getParameter(str);
    String arr[]= val.split("\\s");
    String fid = arr[0];
    String product = arr[1];
    String type = arr[2];
    int price = Integer.parseInt(arr[3]);
    String cid = (String)session.getAttribute("id");
    PreparedStatement ps = con.prepareStatement("Select Quantity from stock where UID_farmer = ? and Product_name = ? and product_type = ?");
    ps.setString(1,fid); ps.setString(2,product); ps.setString(3,type);
    ResultSet rs1 = ps.executeQuery();
    rs1.next();
    int quantity = Integer.parseInt(rs1.getString("Quantity"));
    if(quantity >= qty)
    { 
    PreparedStatement ps1 = con.prepareStatement("Select * from cart where UID_farmer = ? and UID_customer = ? and Product_name = ? and Product_type = ?");
    ps1.setString(1,fid);ps1.setString(2,cid);
    ps1.setString(3,product);ps1.setString(4,type);
    ResultSet rs = ps1.executeQuery();
    PreparedStatement ps2;
     
    if(rs.next())
     { 
       ps2 = con.prepareStatement("Update cart Set Qty = Qty + ? where UID_farmer = ? and UID_customer = ? and Product_name = ? and Product_type = ?");
      ps2.setString(2,fid);ps2.setString(3,cid);
      ps2.setString(4,product);ps2.setString(5,type);
      ps2.setInt(1,qty);
     }
     else
     {  
      ps2 = con.prepareStatement("Insert Into cart Values (?,?,?,?,?,?)");
      ps2.setString(1,product);ps2.setString(2,type);
      ps2.setString(3,fid); ps2.setString(4,cid);
      ps2.setInt(5,qty);
      ps2.setInt(6,price);
     }
     int i = ps2.executeUpdate();
     if(i>0)
      { 
        PreparedStatement stm = con.prepareStatement("Update stock Set Quantity = Quantity - ? where UID_farmer = ? and Product_name = ? and product_type = ?");
        stm.setString(2,fid); stm.setString(3,product);
        stm.setString(4,type); stm.setInt(1,qty);
        int j = stm.executeUpdate();
        if(j>0)
         {
          con.commit();
          con.close();
         
        
        %>
         <script type="text/javascript">
           alert("product is added to cart");
         </script>
        <% }
        else
        {
          con.rollback();
         con.close();%>
        <script type="text/javascript">
          alert("please try again");
        </script>
       <%
        }
      }
      else
      { con.rollback();
         con.close();%>
        <script type="text/javascript">
          alert("please try again");
        </script>
       <%
      }
      
    }
    else
    { con.close();
      %>
      <script type="text/javascript">
        alert("quantity is less");
      </script> 
      <%
    }
    %>
       <script type="text/javascript">
         window.location.assign("ConsumerBuy.jsp");
       </script>
      <%
 } 
 catch(Exception e)
 { %>
 <script type="text/javascript">
   alert("<%= e %>");
 </script> 
  <%} }%>
</body>
</html>