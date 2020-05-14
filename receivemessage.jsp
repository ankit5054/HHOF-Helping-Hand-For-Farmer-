<%@ page import="java.sql.*,java.net.*,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
 <%
  
 String val = request.getParameter("receive");
 String arr[] = val.split(",");
 String op = arr[0];
 String number = arr[1];
 String id = arr[2];
 String pwd = arr[3];
 String product = arr[4];
 String type = arr[5];
 int price,qty;
 boolean send=false;
 String phone="";
 Connection con=null;
 boolean loop = true;
 int count =0;
 String message = "Initial message";
 try{ Class.forName("com.mysql.jdbc.Driver");
 Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/sih project?serverTimezone=UTC", "root", "");
 PreparedStatement stmt = con1.prepareStatement("Select pswd_farmer from farmer_login where UID_farmer = ?");
 stmt.setString(1,id);
 ResultSet rs45 = stmt.executeQuery();
 if(rs45.next() && rs45.getString(1).equals(pwd))
 {
 if(op.equalsIgnoreCase("Add"))
 { 
   price = Integer.parseInt(arr[6]); qty=Integer.parseInt(arr[7]);
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
      ps1.setString(1,product); ps1.setString(2,id);
      ps1.setString(3,type);
      ResultSet rs=ps1.executeQuery();
     
      if(rs.next()==false)
       {
       	PreparedStatement ps2=con.prepareStatement("INSERT into stock values (?,?,?,?,?)");
       	ps2.setString(1,id); ps2.setInt(4,price);
       	ps2.setString(2,product); ps2.setInt(5,qty);
       	ps2.setString(3,type);
       	int i= ps2.executeUpdate();
       	if(i>0) {send=true;message="Your product "+product+" is added";}
       	else{message="Your product is not added";}

       }
       else
       {
       	PreparedStatement ps2=con.prepareStatement("UPDATE stock SET Quantity = Quantity + ? where Product_name = ? and product_type = ?");
       	ps2.setInt(1,qty); ps2.setString(2,product);
        ps2.setString(3,type);
       	int i= ps2.executeUpdate();
       	if(i>0) {send=true;message="Your product "+product+" is added";}
       		else{message="Your product is not added";}
       } 
       if(send)
       {
       	con.commit();
       	con.close();
       }
       else
       {
       	con.rollback();
       	con.close();
       }}
catch(Exception e)
     	 {}
     
 }
 else if(op.equalsIgnoreCase("Delete"))
  {
    try	{
     	Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sih project?serverTimezone=UTC", "root", "");
        con.setAutoCommit(false);
      PreparedStatement ps = con.prepareStatement("SELECT mob_no from Farmer where UID_farmer = ?");
      ps.setString(1,id);
      ResultSet rst = ps.executeQuery();
      rst.next();
      phone = rst.getString(1);
      PreparedStatement ps1=con.prepareStatement("SELECT Quantity from Stock where Product_name =? and UID_farmer =? and product_type =?");
      ps1.setString(1,product); ps1.setString(2,id); 
      ps1.setString(3,type);
      ResultSet rs=ps1.executeQuery();
     
      if(rs.next() == false)
       {
       	message = "Your product "+product+" does not exist";
       }
       else
       {
       	PreparedStatement ps2=con.prepareStatement("DELETE from stock where UID_farmer = ? and Product_name = ? and product_type =?");
       	ps2.setString(1,id); ps2.setString(2,product); 
       	ps2.setString(3,type);
       	int i= ps2.executeUpdate();
       	if(i>0) { send=true;  message="Your product "+product+" is deleted";}
       	else
       	{
       		message = "Your product is not deleted";
       	}
       }
       if(send)
       {
       	con.commit();
       	con.close();
       }
       else
       { 
       	con.rollback();
       	con.close();
       }
     	}
     	catch(Exception e)
     	{}
  }
}
else
{
	message = "id or password is wrong";
	con1.close();
}
}catch(Exception e)
 {

 }
  while(loop && count <= 2)
  	{ count++;
  try {
		
		 	String apiKey = "apikey=" + "QhRTvfdZ3F4-les0r26cW0ZGJc0z05W03JhOit9rP9";
                        
			String msg = "&message=" + message;
			String sender = "&sender=" + "SIHIMS";
			String numbers = "&numbers=" + phone;
            HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
			String data = apiKey + numbers + msg + sender;
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
          {  phone = number;

    }
        else
        {  loop = false;   	
        } 
		} 
		catch (Exception e) {}
 
} %>
</body>
</html>