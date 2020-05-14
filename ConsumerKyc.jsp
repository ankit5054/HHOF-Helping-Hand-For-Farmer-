<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Enter Kyc details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
      <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="Consumer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <!-- Latest compiled and minified JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>

  </head>
  <body>
    <% if(session.getAttribute("pass")==null)
     {
      %>
       <script type="text/javascript">
         alert("plz register first");
         window.location.href ="ConsumerRegister.jsp";
       </script> 
      <%
     }
     session.removeAttribute("pass");
    
    %>
    <div class="container">
  <label for=""><h2>Welcome </h2></label><br>

  <form class="form" action="ConsumerKycConfirm.jsp" method="post">


  <div class="">
      <b><label for=""> Please Select The Document From Below List</label></b>
      <br>
    <select class="form-group" name="ConsumerDoc" required>
      <option value="Aadhar Card">Aadhar Card</option>
      <option value="Driving License">Driving License</option>
      <option value="Voter Id">Voter Id</option>
    </select>
  </div>
  <div class="form-group">
    <b><label for="">Enter Your Uniqur Id Below</label></b>
    <br>
    <input type="text" name="ConsumerDocUID" pattern="[0-9A-za-z]+" required>
  </div>
  <input type="submit" name="button" value="Next" class="btn btn-primary">
  <a href="ConsumerLogin.jsp"><button type="button" class="btn btn-primary">Login</button></a>
  <a href="Main.html"><button type="button" class="btn btn-primary">Home</button></a>
  </form>
  </div>


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
