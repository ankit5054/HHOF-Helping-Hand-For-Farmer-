<%@page import="java.sql.*,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
        <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="Consumer.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
      <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.0.min.js">
</script>
<script type="text/javascript">
	function del(counter) {
		
		document.getElementById("access").value= parseInt(counter)+1;
		document.getElementById("send").setAttribute("action","deletecart.jsp");
		document.getElementById("send").submit();
	}
</script>
</head>
<body>
	<div class="container">
<%
 if(session.getAttribute("id")==null)
  {
     %>
      <script type="text/javascript">
        alert("please login first");
        window.location.assign("ConsumerLogout.jsp");
      </script>
     <%
   }
   else
   { response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"

   	try
   	{ int counter =0;
     Class.forName("com.mysql.jdbc.Driver");
     Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/sih project?serverTimezone=UTC", "root", "");
     Statement st1=con1.createStatement();
     String strQuery1 = "SELECT * FROM cart,farmer where cart.UID_farmer = farmer.UID_farmer";

     ResultSet  rs1 = st1.executeQuery(strQuery1);
     %><div class="row" style="text-align: center;">
     	<form method="post" id="send"><input type="hidden" name="access" id="access" value=""><%
     while(rs1.next())
    {
      %>
      <div class="col-md-6">
      <div class="card bg-warning">
      <br />
      <p class="card-header"><b>Product Name : <%= rs1.getString("Product_name")%></b></p>
        <div class="card-body"  style="height: 22rem;">
          <p class="card-text "><b>Product Type : <%= rs1.getString("Product_type")%></b></p>
          <p class="card-text"><b>Quantity Orderd (KG) : <%= rs1.getString("Qty")%></b></p>
          <p class="card-text"><b>Price (Per KG) : <%= rs1.getString("Price")%></b></p>
          <p class="card-text"><b>Farmer Name : <%= rs1.getString("Name")%></b></p>
          <p class="card-text"><b>Farmer Number : <%= rs1.getString("mob_no")%></b></p>
          <button  onclick="del('<%= counter %>')" class="btn btn-primary">Delete Product</button><input type="hidden" name="<%= ++counter %>" value='<%= rs1.getString("Product_name")+","+rs1.getString("Product_type")+","+rs1.getString("UID_farmer")+","+rs1.getString("UID_customer")+","+rs1.getString("Price")+","+rs1.getString("Qty")%>'>
          <a href="#" class="btn btn-primary">Order Product</a>
        </div>
      </div>
      <br />
    </div>

    <%
} %></form></div><% }
     catch(Exception e)
   	 {
   	 	%>
   	 	<script type="text/javascript">
   	 		alert("<%= e%>");
   	 	</script>
   	 	<%
   	 }
   }
%>
</div>
</body>
</html>