<%@page import="java.util.Random"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>enter OTP</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
  <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="Main.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>

</head>
<body>
    <%
      if( session.getAttribute("flow")==null)
      {
        %>
        <script type="text/javascript">
          alert("please go to registration first");
          window.location.href="ConsumerRegister.jsp";
        </script>
        <%
      }
      else {
      String Cname = (String)session.getAttribute("ConsumerName");
      String phone = (String)session.getAttribute("MobileNumber");
      String CAddress = (String)session.getAttribute("ConsumerAddress");
           
    %>
    <div class="container text-center">
      <form class="form-group" action="consumerotpprocess.jsp" method="post" >
          <b> <h1>Welcome <%
          out.print(Cname);
           %> </h1> </b>

          <b> <h2> Please Enter OTP Send To <% out.print(phone);}%> </h2> </b>
          <b> <label for=""> OTP : </label> <input type="text" name="otpvalue" id="otpvalue">  </b>
          <input class="btn btn-primary" type="Submit"  value="verify">
      </form>
          
        <a href="Main.jsp"><button type="button" class="btn btn-primary">Home</button></a>
    </div>
<!--
<form action="http://localhost:8080/SIH/Web%20Pages/otpprocess.jsp" method="post">
  <div class="form-row">
  <div class="form-group">
    <b> Welcome <% out.println(request.getParameter("ConsumerName")); %> </b>
    </div>
  </div>
  <div class="form-row form-group">
        <b><label for="otpvalue">Enter OTP</label></b> <br>
        <input type="text" name="otpvalue" id="otpvalue" class="form-group"/> <br>
  </div>

<input type="submit" value="verify" />
</form>
-->

<!-- footer -->
<footer class="ct-footer">
<div class="container">

<div class="ct-footer-pre text-center-lg">
<div class="">
  <span>Join HHOF (helping hands of farmers) to receive updates, offers</span>
</div>
</div>
  <h2 class="ct-footer-list-header" style="color:white;">About</h2>
  <ul style="color:white;">
    <li>
      <a href="">FAQ</a>
    </li>
    <li>
      <a href="">Our Staff</a>
    </li>
    <li>
      <a href="">Contact Us</a>
    </li>
  </ul>


<div class="ct-footer-meta text-center-sm">
<div class="row">

  <div class="col-md-6 col-sm-6 col-xs-6">
    <address>
      <span>Join HHOF (helping hands of farmers)CorpCo<br></span>123 Ghaziabad<br>
      Uttar Pradesh, India, 201003<br>
      <span>Phone: <a href="tel:123456789">+91 123456789</a></span>
    </address>
  </div>
  <div class="col-md-6 col-sm-6 col-xs-6">
    <a href="" target="_blank"><img alt="app store" src="https://www.solodev.com/assets/footer/appstore.png"></a>
  </div>
</div>
<div class="row">
  <div class="col-md-6 col-sm-6 col-xs-6">
    <a href="" target="_blank"><img alt="google play store" src="https://www.solodev.com/assets/footer/androidstore.png"></a>
  </div>
  <div class="col-md-6 col-sm-6 col-xs-6">
    <ul class="ct-socials" type="none">
      <li style="color:white;" >
        Connect With Us
      </li>
      <li>
        <a href="" target="_blank"><img alt="facebook" src="https://www.solodev.com/assets/footer/facebook-white.png"></a>
      </li>
      <li>
        <a href="" target="_blank"><img alt="twitter" src="https://www.solodev.com/assets/footer/twitter-white.png"></a>
      </li>
      <li>
        <a href="" target="_blank"><img alt="youtube" src="https://www.solodev.com/assets/footer/youtube-white.png"></a>
      </li>
      <li>
        <a href="" target="_blank"><img alt="instagram" src="https://www.solodev.com/assets/footer/instagram-white.png"></a>
      </li>

    </ul>
  </div>
</div>
</div>
<div class="ct-footer-post">
<div class="container">
<div class="inner-center text-center">
  <ul>
    <li>
      <a href="">FAQ</a>
    </li>
    <li>
      <a href="">News</a>
    </li>
    <li>
      <a href="">Contact Us</a>
    </li>
  </ul>
</div>
<div class="text-center" style="background:black">
  <p>Copyright © 2020 HHOF (helping hands of farmers)CorpCo.&nbsp;<br><a href="">Privacy Policy</a></p>
</div>
</div>
</div>
</footer>
<!-- End Of Footer -->

</body>
</html>
