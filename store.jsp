<%@page isThreadSafe ="true"  import="java.sql.*,java.util.*,java.net.*,java.io.*" errorPage="erro.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>storing database</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
</head>
<body>
	
    <%
    if(session.getAttribute("store")==null )
         {
          %>
          <script type="text/javascript">
            alert("please go to register page");
            window.location.href="FarmerRegister.jsp";
          </script>
          <%
         }
         else {  
      String   name=(String)session.getAttribute("name");
  String kid=(String)session.getAttribute("kid");
  String acn=(String)session.getAttribute("acn");
  String bankname=(String)session.getAttribute("bankname");
  String ifsc=(String)session.getAttribute("ifsc");
  String holder=(String)session.getAttribute("holder");
  String state=(String)session.getAttribute("state");
  String city=(String)session.getAttribute("city");
  String zip=(String)session.getAttribute("code");
  String address=(String)session.getAttribute("address");
  String phone=(String)session.getAttribute("phone");
  
  int code =Integer.parseInt(zip);
  
  try
   	{ Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sih project?serverTimezone=UTC", "root", "");
     Statement stm = con.createStatement();
     PreparedStatement st=con.prepareStatement("INSERT INTO farmer VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");
     con.setAutoCommit(false);
     ResultSet rs = stm.executeQuery("Select count(UID_farmer) from farmer");
     rs.next();
     int count = rs.getInt(1);
     
     st.setString(4,acn);
     st.setInt(9,code);
     st.setInt(12,0);
     st.setString(1,"K00"+count);  st.setString(6,ifsc);
     st.setString(2,kid);  st.setString(8,state);
     st.setString(3,name);  st.setString(10,address);
     st.setString(7,city);  st.setString(11,phone);
     st.setString(5,bankname);
     int i=st.executeUpdate();
     
     String apiKey = "apikey=" + "QhRTvfdZ3F4-les0r26cW0ZGJc0z05W03JhOit9rP9";
     Random r= new Random();
     int pass=r.nextInt(99999999)+1000000;
     String message = "&message=" + "Your id: K00"+count+"\n"+"Your Password: "+pass;
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
	 out.println(status);
     if(status.equalsIgnoreCase("\"failure\"}"))
      {         con.rollback();
         con.close();
        if(session != null) {session.invalidate();}
     %><script type="text/javascript">
        alert("registration failure due to some error");
        window.location.href="FarmerRegister.jsp";
      </script> <%
 }
      else
      {  
   PreparedStatement pst = con.prepareStatement("insert into farmer_login Values(?,?)");
   pst.setString(1,"K00"+count);
   pst.setString(2,""+pass);
   int a= pst.executeUpdate();
        
        con.commit();
        con.close();
        session.removeAttribute("phone");
session.removeAttribute("name");
session.removeAttribute("kid");
session.removeAttribute("acn");
session.removeAttribute("bankname");
session.removeAttribute("ifsc");
session.removeAttribute("holder");
session.removeAttribute("state");
session.removeAttribute("city");
session.removeAttribute("code");
session.removeAttribute("address");
        %>
        <script type="text/javascript">
          alert("registration done! id and password is sent to your number");
          window.location.href="FarmerLogin.jsp";
        </script>
        <%}
      
        
 
   }
   catch(Exception e){out.println(e);}
   } %>
</body>
</html>