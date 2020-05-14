<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"   %>

<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script> 
</head>
<body>
<% if(request.getParameter("otpvalue")==null)
    {%>
    	<script type="text/javascript">
    		alert("please register first");
    		window.location.href="ConsumerRegister.jsp";
    	</script><%}
    	else{
String phone=(String)session.getAttribute("phone");
int otp= (Integer) session.getAttribute("otp");
String otpvalue=request.getParameter("otpvalue");
int enterOtp=Integer.parseInt(otpvalue);
out.println(otp+" / "+enterOtp);
if(otp == enterOtp)
{ session.removeAttribute("otp");
session.setAttribute("pass","yes");
 request.getRequestDispatcher("ConsumerKyc.jsp").forward(request,response);
 
}
else
{ 
 session.removeAttribute("ConsumerName");
    session.removeAttribute("MobileNumber");
    session.removeAttribute("ConsumerState");
    session.removeAttribute("ConsumerCity");
    session.removeAttribute("ZipCode");
    session.removeAttribute("ConsumerAddress");
    session.removeAttribute("BuyConsumer");
    session.removeAttribute("flow");
%>
<script type="text/javascript">
		alert("OTP not matched");
		window.location.href="ConsumerRegister.jsp";
	</script>
<%}

session.removeAttribute("otp");}
%>
</body>
</html>