<%@ page errorPage="error.jsp"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    
    <meta name="viewport" content="width=device-width, initial-scale=1" charset="utf-8">  
    <title>Farmer Signup page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="Farmer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="E:\HTML work\jquery\jq.js"></script>

    <script type="text/javascript">
      function SelectCity(s,c)
      {
        var s = document.getElementById(s);
        var c = document.getElementById(c);
        c.innerHTML = "";
        if(s.value == "Andhra Pradesh")
        {
            var optionArray = ["|","Visakhapatnam|Visakhapatnam","Vijayawada|Vijayawada","Kakinada|Kakinada","Kurnool|Kurnool","Tirupati|Tirupati"];
        }
        else if (s.value== "-------------") {
            var optionArray = "|"
        }
        else if(s.value == "Arunachal Pradesh")
        {
              var optionArray = ["|","Tawang|Tawang","Itanagar|Itanagar","Ziro|Ziro","Bomdila|Bomdila","Bomdila|Bomdila"];
        }
        else if(s.value == "Gujarat")
        {
                var optionArray = ["|","Ahmedabad|Ahmedabad","Ambaji|Ambaji","Amreli|Amreli","Anand|Anand","Bharuch|Bharuch"];
        }
        else if(s.value == "Haryana")
        {
                var optionArray = ["|","Panipat|Panipat","Ambala|Ambala","Yamunanagar|Yamunanagar","Rohtak|Rohtak","Sonipat|Sonipat"];
        }
        else if(s.value == "Uttar Pradesh")
        {
                var optionArray = ["|","Lucknow|Lucknow","Ghaziabad|Ghaziabad","Agra|Agra","Meerut|Meerut","Hapur|Hapur"];
        }
        for(var option in optionArray)
        {
          var pair = optionArray[option].split("|");
          var newOption = document.createElement("option");
          newOption.value = pair[0];
          newOption.innerHTML = pair[1];
          c.options.add(newOption);

        }
      }

    </script>
  </head>
  <body>

    <div class="text-center">
    <h2>Welcome To Farmer Register Page</h2>
    </div>
    <br>

      <!-- Start Of Regitration Form-->
      <div class="container ">
          <!-- here on action file is calles on server to send OTP -->
        <form action="process.jsp" method="post" >
          <!-- application/x-www-form-urlencoded :- Default. All characters are encoded before sent (spaces are converted to "+" symbols, and special characters are converted to ASCII HEX values)-->
  <div class="form-row">
    <div class="form-group col-md-6">
    <b>  <label for="FarmerName">Name</label> </b>
      <input type="text" class="form-control alphaonly" id="FarmerName" placeholder="Full Name" name="FarmerName" pattern="[A-Z a-z]+" required>
    </div>
    <div class="form-group col-md-6">
    <b>  <label for="KisanId">Kisan Id</label> </b>
      <input type="text" class="form-control" id="KisanId" placeholder="Kisan Unique ID" name="KisanId" pattern="[A-Za-z0-9]+" required>
    </div>
  </div>
  <div class="form-row">
  <div class="form-group col-md-6">
  <b>  <label for="FarmerAccountNumber">Account Number</label></b>
    <input type="text" class="form-control" id="FarmerAccountNumber" placeholder="AccountNumber" name="FarmerAccountNumber" pattern="[0-9]+" required>
  </div>
  <div class="form-group col-md-6">
  <b>  <label for="BankName">Bank Name</label> </b>
    <input type="text" class="form-control" id="BankName" placeholder="Bank Name" name="BankName" pattern="[A-Z a-z]+" required>
  </div>
  </div>
  <div class="form-row">
  <div class="form-group col-md-6">
  <b>  <label for="BankIfsc">Bank IFSC Code</label> </b>
    <input type="text" class="form-control" id="BankIfsc" placeholder="Bank IFC Code" name="BankIfsc" pattern="[A-Za-z0-9]+" required>
  </div>
  <div class="form-group col-md-6">
  <b>  <label for="HolderName">Account Holder Name</label> </b>
    <input type="text" class="form-control" id="HolderName" placeholder="Account Holder Name" name="HolderName" pattern="[A-Z a-z]+" required>
  </div>
  </div>
  <!-- State and City and zip code -->
  <div class="form-row">
    <div class="form-group col-md-6">
  <b>    <label for="FarmerState">State</label> </b>
      <select id="FarmerState" class="form-control" name="FarmerState" onchange="SelectCity(this.id,'FarmerCity')" required>
        <option value="-------------">-------------</option>
        <option value="Andhra Pradesh">Andhra Pradesh</option>
        <option value="Arunachal Pradesh">Arunachal Pradesh</option>
        <option value="Gujarat">Gujarat</option>
        <option value="Haryana">Haryana</option>
        <option value="Uttar Pradesh">Uttar Pradesh</option>

      </select>
    </div>
    <div class="form-group col-md-4">
    <b>  <label for="FarmerCity">city</label> </b>
      <select id="FarmerCity" class="form-control" name="FarmerCity" required>
      <option value="-------------">-------------</option>
      </select>
    </div>

    <div class="form-group col-md-2">
    <b>  <label for="ZipCode">Zip</label></b>
      <input type="text" class="form-control" id="ZipCode" placeholder="Zipcode" name="ZipCode" pattern="[0-9]{6}" required>
    </div>
  </div>
  <!-- End Of State City zip code -->
  <!-- MobNo and  Address -->
  <div class="form-row">
  <div class="form-group col-md-6">
    <b>  <label for="MobileNumber">Mobile Number</label> </b>
    <input type="text" class="form-control" id="MobileNumber" placeholder="Mobile Number Linked With Farmer Id" name="MobileNumber"  pattern="[0-9]{10}" required>
  </div>
  <div class="form-group col-md-6">
  <b>  <label for="FarmerAddress">Address</label> </b>
    <input type="text" class="form-control" id="FarmerAddress" placeholder="Full Address" name="FarmerAddress" pattern="[A-Z a-z 0-9]+" required>
  </div>
  </div>
  <!-- End of MobNo and  Address -->

  <div class="form-row">
  <div class="form-group">
    <div class="form-check col-md-12">
      <input class="form-check-input" type="checkbox" id="gridCheck" required>
    <b>  <label class="form-check-label" for="gridCheck">
        I agree to Terms And Conditions of ....
      </label></b>
    </div>
    <div class="form-check col-md-12">
      <input class="form-check-input" type="checkbox" id="gridCheck" required>
    <b>  <label class="form-check-label" for="gridCheck">
        I agree to Terms And Conditions of ....
      </label> </b>
    </div>
    </div>
  </div>
  <!-- Buttons-->
  <div class="">
  <input type="submit" class="btn btn-primary" value="Next">
  <a href="FarmerLogin.jsp"><button type="button" 
    class="btn btn-primary">Login</button></a>
  <a href="Main.html"><button type="button" class="btn btn-primary">Home</button></a>

  </div>
  <!-- End Of Buttons-->
</form>
</div>
<!--End Of Container -->
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