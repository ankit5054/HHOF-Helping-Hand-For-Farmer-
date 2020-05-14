<%@ page import="java.sql.*,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
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
  {
  	try
  	{
  		Class.forName("com.mysql.jdbc.Driver");
  		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sih project?serverTimezone=UTC", "root", "");
  		PreparedStatement ps;
  		String url;
  		String name= request.getParameter("Name");
  		String account = request.getParameter("Account");
  		String bank= request.getParameter("Bank");
  		String ifsc = request.getParameter("Ifsc");
  		String city = request.getParameter("City");
  		String state = request.getParameter("State");
  		int zip = Integer.parseInt(request.getParameter("Zip"));
  		String address = request.getParameter("Address");
  		String phone = request.getParameter("Phone");
  		String id=(String)session.getAttribute("id");
  		con.setAutoCommit(false);
  		if(id.charAt(0)=='K')
  		 { 
  		 	ps=con.prepareStatement("Update farmer set Name = ?,Acc_no = ?,Bank_name = ?,IFSC = ?,City_1 = ?,   State = ?,Zip = ?,Address = ?,mob_no = ? where UID_farmer = ?");
  		 	url="showfarmer.jsp";
  		 	ps.setString(1,name);ps.setString(2,account);
  		 	ps.setString(3,bank);ps.setString(4,ifsc);
  		 	ps.setString(5,city);ps.setString(6,state);
  		 	ps.setInt(7,zip);ps.setString(8,address);
  		 	ps.setString(9,phone);ps.setString(10,id);
  		 }
  		 else
  		 {
  		 	ps=con.prepareStatement("Update customer set Name = ?,City_2 = ?,State = ?,Zip = ?,Address = ?,mob_no = ? where UID_customer = ?");
  		 	url="ConsumerBuy.jsp";
  		 	ps.setString(1,name);ps.setString(2,city);
  		 	ps.setString(3,state);ps.setInt(4,zip);
  		 	ps.setString(5,address);ps.setString(6,phone);
  		 	ps.setString(7,id);
  		 }
  		 int i= ps.executeUpdate();
  		 if(i>0)
  		 {
  		 	con.commit();
  		 	con.close();
  		 	%>
  		 	<script type="text/javascript">
  		 		alert("Successfully updated");
  		 		window.location.assign("<%= url %>");
  		 	</script>
  		 	<%
  		 }
  		 else
  		 {
  		 	con.rollback();
  		 	con.close();
  		 	%>
  		 	 <script type="text/javascript">
  		 	 	alert("please try again");
  		 	 	window.location.assign("ConsumerLogout.jsp");
  		 	 </script>
  		 	<%
  		 }
  	}
  	catch(Exception e)
  	 {
  	 	%>
  	 	<script type="text/javascript">
  	 		alert("<%= e%>");
  	 		window.location.assign("ConsumerLogout.jsp");
  	 	</script>
  	 	<%
  	 }
  }
%>
</body>
</html>