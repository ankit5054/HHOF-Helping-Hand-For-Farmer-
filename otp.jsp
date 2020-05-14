<%@page import="java.util.Random"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" errorPage="error.jsp" %>
<html>
<head>
<title>enter OTP</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
  <meta name="viewport" content="width=device-width,initial-scale=1">  
</head>
<body>
	<% if(session.getAttribute("flow")==null)
	{
		%>
		<script type="text/javascript">
			alert("please registration first");
			window.location.href="FarmerRegister.jsp";
		</script>
		<%
	}
	else{request.removeAttribute("flow"); %>

<form action="otpprocess.jsp" method="post" class="form">
<div class="container">
<div class="form-group">  
    <b style="font-size: 40px;"><label for="otpvalue">Enter OTP</label>  </b>
    <input type="password" class="form-control" id="otpvalue" placeholder="Password" name="otpvalue"> 

  </div>
  <input type="submit" value="verify" class="btn btn-md btn-dark" /> </div> 
</form>
<% }%>
</body>
</html>