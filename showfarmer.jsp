<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
  <meta name="viewport" content="width=device-width,initial-scale=1">

        <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="Consumer.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
      <script type="text/javascript">
      window.addEventListener('blur',change);
        function change() {
          // body...
          window.location.href="ConsumerLogout.jsp";
        }
  </script>
</head>
<% 
  if(session.getAttribute("id")==null)
   {
    %>
       <script type="text/javascript">
         alert("please login first");
         window.location.assign("FarmerLogin.jsp");
       </script>
    <%
   } else{
%>

<body bgcolor="black;">
	 <div class="container row" style="margin:0px auto;height: 300px;padding-top:100px;">

       <div class=" col-md-3 col-sm-3 col-lg-3 col-xs-3" style="padding-left:10%;" >
         <strong> <b> <label for="" >Your Profile</label> </b> </strong> <br>
         <a href="FarmerProfile.jsp"><button class="btn btn-lg" > <i class="fa fa-user" ></i> </button> </a>
       </div>
       <div class=" col-md-3 col-sm-3 col-lg-3 col-xs-3" style="padding-left:6%;">
         <strong> <b> <label for="">Your Products</label> </b> </strong> <br>
         <a href="stock.jsp"><button class="btn btn-lg"> <i class="fa fa-first-order"></i> </button> </a>
       </div>
       <div class=" col-md-3 col-sm-3 col-lg-3 col-xs-3" style="padding-left:5%;">
         <strong> <b> <label for="">Orders Status</label> </b> </strong> <br>
         <a href="TrackYourOrders.jsp"><button class="btn btn-lg"> <i class="fa fa-location-arrow"></i> </button> </a>
       </div>
       <div class=" col-md-3 col-sm-3 col-lg-3 col-xs-3" style="padding-left:3%;">
         <strong> <b> <label for="">&nbsp;Sign &nbsp;Out&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> </b> </strong> <br>
         <a href="ConsumerLogout.jsp"><button class="btn btn-lg"> <i class="fa fa-sign-out"></i> </button> </a>
       </div>
     </div>
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
      </li>

    <div class="ct-footer-meta text-center-sm">
      <div class="row">

        <div class="col-md-6 col-sm-6">
          <address>
            <span>Join HHOF (helping hands of farmers)CorpCo<br></span>123 Ghaziabad<br>
            Uttar Pradesh, India, 201003<br>
            <span>Phone: <a href="tel:123456789">+91 123456789</a></span>
          </address>
        </div>
        <div class="col-md-6 col-sm-6">
          <a href="" target="_blank"><img alt="app store" src="https://www.solodev.com/assets/footer/appstore.png"></a>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6 col-sm-6">
          <a href="" target="_blank"><img alt="google play store" src="https://www.solodev.com/assets/footer/androidstore.png"></a>
        </div>
        <div class="col-md-6 col-sm-6">
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
      <div class="inner-center">
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
      <div class="" style="background:black">
        <p>Copyright © 2020 HHOF (helping hands of farmers)CorpCo.&nbsp;<br><a href="">Privacy Policy</a></p>
      </div>
    </div>
  </div>
 </footer>
 <!-- End Of Footer -->
<% } %>
</body>
</html>