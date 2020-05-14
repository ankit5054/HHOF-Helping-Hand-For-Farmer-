<%@ page import="java.net.*,java.sql.*,java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<%
 if(request.getParameter("id")==null)
  {
  	 %> <script type="text/javascript">
      	 alert("please enter a id");
      	 window.location.href = "FarmerLogin.jsp";
      </script>
        <%  
  }
  else
  {
    try
	{
		Class.forName("com.mysql.jdbc.Driver");
		 session.setAttribute("id",request.getParameter("id"));
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sih project?serverTimezone=UTC", "root", "");
       
     PreparedStatement ps=con.prepareStatement("Select mob_no from farmer where UID_farmer = ?");
     ps.setString(1,request.getParameter("id"));
     ResultSet rs = ps.executeQuery();
     if(!rs.next())
      { %>
         <script type="text/javascript">
             alert("please enter correct id");
             window.location.assign("FarmerLogin.jsp");
         </script>
        <%
      }
     
     String phone = rs.getString(1);
     String apiKey = "apikey=" + "QhRTvfdZ3F4-les0r26cW0ZGJc0z05W03JhOit9rP9";
     Random r = new Random();
     int otp=r.nextInt(999999);
     session.setAttribute("otp",otp);
	 String message = "&message=" + "your otp is : "+otp;
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
          {  if(session!=null) { session.invalidate();}
%>
<script type="text/javascript">
	alert("otp is not sent ");
	window.location.href="FarmerLogin.jsp";
</script><% 

    }
        else
        { %>
        	<script type="text/javascript">
        		var k=0; var pass;
        		while(k==0)
        		{
        		 pass= prompt("Enter otp sent to your number");
        			if(!(pass==null || pass==""))
        			 {k=1;
        			 }
        		}
        		if( pass =="<%= otp %>")
        		{
                  window.location.assign("showfarmer.jsp");
        		}
        		else
        		{
        			window.location.assign("FarmerLogin.jsp");
        		}
        	</script>
          <% }
      }
	
	catch(Exception e)
	{ if(session != null){session.invalidate();}%>
     <script type="text/javascript">
     	alert("<%=e %>");
     	window.location.assign("FarmerLogin.jsp");
     </script>
   <%} 
  }
%>
</body>
</html>