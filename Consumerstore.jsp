<%@page isThreadSafe ="true"  import="java.sql.*,java.util.*,java.net.*,java.io.*" errorPage="error.jsp"%>
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
            window.location.href="ConsumerRegister.jsp";
          </script>
          <%
         }
         else {  
     String   Cname=(String)session.getAttribute("ConsumerName");
  String Cstate=(String)session.getAttribute("ConsumerState");
  String Ccity=(String)session.getAttribute("ConsumerCity");
  String Czip=(String)session.getAttribute("ZipCode");
  String Caddress=(String)session.getAttribute("ConsumerAddress");
  String Cphone=(String)session.getAttribute("MobileNumber");
  String Ctype = (String)session.getAttribute("BuyConsumer");
  String doctype=(String)session.getAttribute("doctype");
  String docid=(String)session.getAttribute("docid");
  int zip=Integer.parseInt(Czip);

  
  try
   	{ Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sih project?serverTimezone=UTC", "root", "");
     Statement stm = con.createStatement();
     PreparedStatement st=con.prepareStatement("INSERT INTO Customer VALUES (?,?,?,?,?,?,?,?,?,?,?)");
     con.setAutoCommit(false);
     ResultSet rs = stm.executeQuery("Select count(UID_customer) from Customer");
     rs.next();
     int count = rs.getInt(1);
     
     st.setString(4,Cname);
     st.setString(9,Ctype);
     st.setInt(11,1);
     st.setString(1,"C00"+count);  st.setString(6,Ccity);
     st.setString(2,docid);  st.setInt(8,zip);
     st.setString(3,doctype);  st.setString(10,Cphone);
     st.setString(7,Cstate);  
     st.setString(5,Caddress);
     int i=st.executeUpdate();
     
     String apiKey = "apikey=" + "QhRTvfdZ3F4-les0r26cW0ZGJc0z05W03JhOit9rP9";
     Random r= new Random();
     int pass=r.nextInt(99999999)+1000000;
     String message = "&message=" + "Your id: C00"+count+"\n"+"Your Password: "+pass;
     String sender = "&sender=" + "SIHIMS";
	 String numbers = "&numbers=" + Cphone;
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
         session.invalidate();
     %><script type="text/javascript">
        alert("registration failure due to some error");
        window.location.href="ConsumerRegister.jsp";
      </script> <%
 }
      else
      {  
   PreparedStatement pst = con.prepareStatement("insert into Customer_login Values(?,?)");
   pst.setString(1,"C00"+count);
   pst.setString(2,""+pass);
   int a= pst.executeUpdate();
        
        con.commit();
        con.close();
        session.removeAttribute("ConsumerName");
session.removeAttribute("ConsumerState");
session.removeAttribute("ConsumerCity");
session.removeAttribute("ZipCode");
session.removeAttribute("consumerAddress");
session.removeAttribute("BuyConsumer");
session.removeAttribute("doctype");
session.removeAttribute("docid");
session.removeAttribute("MobileNumber");

        %>
        <script type="text/javascript">
          alert("registration done! id and password is sent to your number");
          window.location.href="ConsumerLogin.jsp";
        </script>
        <%}
      
    session.removeAttribute("store");    
 
   }
   catch(Exception e){out.println(e);}
   } %>
</body>
</html>