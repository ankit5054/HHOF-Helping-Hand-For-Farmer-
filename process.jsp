<%@page import="java.util.Random"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" errorPage="error.jsp" %>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<title>sending OTP</title>
</head>
<body >
<%
if(request.getParameter("MobileNumber")==null)
{
	%>
	 <script type="text/javascript">
	 	alert("please register first");
	 	window.location.href="FarmerRegister.jsp";
	 </script>
	<%
}
else {
String phone=request.getParameter("MobileNumber");
String name =request.getParameter("FarmerName");
String kisanid=request.getParameter("KisanId");
String acn=request.getParameter("FarmerAccountNumber");
String bankname=request.getParameter("BankName");
String ifsc=request.getParameter("BankIfsc");
String holdername=request.getParameter("HolderName");
String state=request.getParameter("FarmerState");
String city=request.getParameter("FarmerCity");
String code=request.getParameter("ZipCode");
String address=request.getParameter("FarmerAddress");
session.setAttribute("phone",phone);
session.setAttribute("name",name);
session.setAttribute("kid",kisanid);
session.setAttribute("acn",acn);
session.setAttribute("bankname",bankname);
session.setAttribute("ifsc",ifsc);
session.setAttribute("holder",holdername);
session.setAttribute("state",state);
session.setAttribute("city",city);
session.setAttribute("code",code);
session.setAttribute("address",address);

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
			String status= s.substring(s.indexOf("status")+8);
	 if(status.equalsIgnoreCase("\"failure\"}"))
          {  session.removeAttribute("phone");
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
session.removeAttribute("otp");
%>
<script type="text/javascript">
	alert("otp is not sent ");
	window.location.href="FarmerRegister.jsp";
</script><% 

    }
        else
        {  session.setAttribute("flow","true");%>
 <div class="alert alert-success alert-dismissable">
 <button type="button" class="close" data-dismiss="alert">x</button>
 <strong>SUCCESS !</strong> otp is sent succesfully         
        </div>  <%   request.getRequestDispatcher("otp.jsp").include(request,response);  	
        } 
		} catch (Exception e) {
			System.out.println("Error SMS "+e);
		
		}}

%>
</body>
</html>  