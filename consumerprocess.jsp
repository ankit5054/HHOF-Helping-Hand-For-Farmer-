

<html>
<head>

<title>sending OTP</title>
</head>
<body>
<%@page import="java.util.Random" %>
	<%@page import="java.io.*"%>
	<%@page import="java.net.*"%>
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<% if(request.getParameter("MobileNumber")==null)
{
	%>
	<script type="text/javascript">
		alert("please register first");
		window.location.href="ConsumerRegister.jsp"
	</script>
	<%
}
else{
	  String CName = request.getParameter("ConsumerName");
		session.setAttribute("ConsumerName",CName);
		String phone=request.getParameter("MobileNumber");
		session.setAttribute("MobileNumber",phone);
		String CState = request.getParameter("ConsumerState");
	session.setAttribute("ConsumerState",CState);
		String CCity = request.getParameter("ConsumerCity");
		session.setAttribute("ConsumerCity",CCity);
		String CZipCode = request.getParameter("ZipCode");
		session.setAttribute("ZipCode",CZipCode);
		String CAddress = request.getParameter("ConsumerAddress");
		session.setAttribute("ConsumerAddress",CAddress);
		String CType = request.getParameter("BuyConsumer");
		session.setAttribute("BuyConsumer",CType);
		session.setAttribute("flow","true");
		%>

<%
try {

			String apiKey = "apikey=" + "QhRTvfdZ3F4-les0r26cW0ZGJc0z05W03JhOit9rP9";
                        Random r= new Random();
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
			String status = s.substring(s.indexOf("status")+8);
               if(status.equalsIgnoreCase("\"failure\"}"))
               {
               	session.removeAttribute("flow");
               	%>
               	<script type="text/javascript">
               		alert("otp is not sent");
               		window.location.href="ConsumerRegister.jsp"
               	</script><%
               }
               else
               	{ request.getRequestDispatcher("Consumerotp.jsp").include(request,response);  }
		} catch (Exception e) {
			System.out.println("Error SMS "+e);

		}

}

%>

</body>
</html>
