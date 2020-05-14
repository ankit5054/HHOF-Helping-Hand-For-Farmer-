<%@ page import="java.sql.*,java.io.*,java.net.*" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
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
      String pname=request.getParameter("ProductName");
      String type=request.getParameter("Type");
      int price=Integer.parseInt(request.getParameter("Price"));
      int quantity=Integer.parseInt(request.getParameter("Quantity"));
      String phone ="";
      Connection con=null;
       boolean send = false;
     	try
     	{
     		Class.forName("com.mysql.jdbc.Driver");
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sih project?serverTimezone=UTC", "root", "");
     
      
      con.setAutoCommit(false);
      PreparedStatement ps = con.prepareStatement("SELECT mob_no from Farmer where UID_farmer = ?");
      ps.setString(1,id);
      ResultSet rst = ps.executeQuery();
      rst.next();
      phone = rst.getString(1);
      PreparedStatement ps1=con.prepareStatement("SELECT Quantity from Stock where Product_name =? and UID_farmer =? and product_type = ?");
      ps1.setString(1,pname); ps1.setString(2,id);
      ps1.setString(3,type);
      ResultSet rs=ps1.executeQuery();
     
      if(rs.next()==false)
       {
       	PreparedStatement ps2=con.prepareStatement("INSERT into stock values (?,?,?,?,?)");
       	ps2.setString(1,id); ps2.setInt(4,price);
       	ps2.setString(2,pname); ps2.setInt(5,quantity);
       	ps2.setString(3,type);
       	int i= ps2.executeUpdate();
       	if(i>0) send=true;

       }
       else
       {
       	PreparedStatement ps2=con.prepareStatement("UPDATE stock SET Quantity = Quantity + ? where Product_name = ? and product_type = ?");
       	ps2.setInt(1,quantity); ps2.setString(2,pname);
        ps2.setString(3,type);
       	int i= ps2.executeUpdate();
       	if(i>0) send=true;
       }
     	}
     
     catch(Exception e)
     {
     	%>
     <div class="container alert alert-warning ">
     	<%= e %>
     </div>
   <%
     }
     if(send)
     {
     	try {
		
		 	String apiKey = "apikey=" + "QhRTvfdZ3F4-les0r26cW0ZGJc0z05W03JhOit9rP9";
                        
			String message = "&message=" + "Your product "+pname+" is added";
			String sender = "&sender=" + "SIHIMS";
			String numbers = "&numbers=" + phone;
            HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
			String data = apiKey + numbers + message + sender;
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
			conn.getOutputStream().write(data.getBytes("UTF-8"));
			final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			final StringBuffer stringBuffer = new StringBuffer();
			String line;
			while ((line = rd.readLine()) != null) {
				stringBuffer.append(line);
			}
			rd.close();
			String s= stringBuffer.toString(); 
			String status= s.substring(s.indexOf("status")+8);
	 if(status.equalsIgnoreCase("\"failure\"}"))
          {  con.rollback(); con.close(); %>
        <script type="text/javascript">
        	alert("product cant be added due to some error");
        	window.location.href="addproduct.jsp";

        </script> <% 
    }
        else
        {  con.commit(); con.close();%>
 
        <script type="text/javascript">
        	alert("your product is added");
        	window.location.href="addproduct.jsp";
        </script> <%     	
        } 
		} catch (Exception e) {
			
		 	%>
     <div class="container alert alert-warning ">
     	<%= e %>
     </div>
   <%
		}

     } }
  %> 

</body>
</html>