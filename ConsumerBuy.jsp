<%@ page import="java.net.*,java.sql.*" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Buy Grains</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
        <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="Consumer.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>

      <script type="text/javascript">
        function process() {
          
             document.getElementById("reset").value="yes";
             document.buy.submit();
             return true; 
        }
        function store(arg) {
          // body...
          var qty = prompt("Enter Quantity : ");
          if(!qty.match('^[0-9]+$'))
          { alert("Quantity can neither be alphanumeric nor empty");
            store(arg);
          }
          document.getElementById("qty").value=qty;
          document.getElementById("cart").value=parseInt(arg)+1;
          document.getElementById("cartdata").submit();
        }
      </script>
      
  </head>
  <body>
    <div class="container">
 <%  if(session.getAttribute("id")==null)
           {
            %>
                <script type="text/javascript">
                  alert("please login first");
                  window.location.href="ConsumerLogin.jsp";
                </script>
            <%
           }
           else{
                  int price = 9999;
                  String product = "[a-zA-Z]*";
                  String type = "[a-zA-Z]*";
                  String state = "[a-zA-Z]*";
                  String city = "[a-zA-Z]*";
                  String code = "[0-9]*"; 
                  int counter = 0; %>
       
     <div class="jumbotron jumbotron-fluid"><b><h2>Welcome To HHOF <% out.print("User ");%></h2></b><b><h2>Please Choose From Below List What You Want to Purchase</h2></b></div>

     <div class=" row">
        <div class=" col-sm-2"  >
         <strong> <b> <label for="" >Your Profile</label> </b> </strong> <br>
         <a href="ConsumerProfile.jsp"><button class="btn btn-lg btn-dark" ><i class="fa fa-user" ></i></button></a>
       </div>
       <div class=" col-sm-2" >
         <strong> <b> <label for="">Your Orders</label> </b> </strong> <br>
         <a href="ConsumerOrders.jsp" ><button class="btn btn-lg btn-dark"> <i class="fa fa-first-order"></i> </button> </a>
       </div>
       <div class=" col-sm-2" >
         <strong> <b> <label for="">Track Orders</label> </b> </strong> <br>
         <a href="TrackYourOrders.jsp" ><button class="btn btn-lg btn-dark"> <i class="fa fa-location-arrow"></i></button> </a>
       </div>
       <div class=" col-sm-2">
         <strong> <b> <label for="">Your Cart</label> </b> </strong> <br>
         <a href="showcart.jsp"><button class="btn btn-lg"> <i class="fa fa-address-book-o"></i> </button> </a>
       </div> 
       
      
       
       <div class=" col-sm-2">
         <strong> <b> <label for="">Sign Out</label> </b> </strong> <br>
         <a href="ConsumerLogout.jsp"><button class="btn btn-lg"> <i class="fa fa-sign-out"></i> </button> </a>
       </div></div>
    
     <hr><br>
     
      <b><h1>Filters :- </h1></b><br>
 

           
         <form action="ConsumerBuy.jsp" method="post" name="buy" role="form" class="form-horizontal" >
          <input type="hidden" name="select" value="yes">
          <input type="hidden" name="reset" value="no" id="reset">
   <div class="form-row">

     <div class="form-group col-md-5">
   <b><label for="Product">Product Or Grains</label></b>
       <input onblur="" type="text" name="Product" class="form-control" id="Product" placeholder="--------">
     </div>
     <div class="col-md-2"></div>
     <div class="form-group col-md-5">
   <b> <label for="ProductType">Type</label> </b>
       <input onblur="" type="text" name="Type" id="ProductType" class="form-control" placeholder="------">
     </div> </div>
     <div class="form-row">
     <div class="form-group col-md-5">
   <b><label for="ProductPrice"> Max Price(per kg.) </label> </b>
      <input onblur="" type="number" name="Price" id="ProductPrice" placeholder="-------" class="form-control" > 
     </div>
     <div class="col-md-2"></div>
     <div class="form-group col-md-5">
   <b>    <label for="FarmerState">State</label> </b>
       <input onblur="" type="text" name="State" id="FarmerState" class="form-control" placeholder="--------">
     </div></div>
     <div class="form-row">
    <div class="form-group col-md-5">
     <b>  <label for="ZipCode">Zip</label></b>
       <input onblur="" type="text" class="form-control" id="ZipCode" placeholder="Zipcode" name="Zip" pattern="[0-9]{6}">
     </div>
     <div class="col-md-2"></div>
     <div class="form-group col-md-5">
     <b>  <label for="ConsumerCity">City</label> </b>
       <input onblur="" id="ConsumerCity" class="form-control" name="City" >
    </div></div>
    
      <button onclick="process()"  class="btn btn-success ">Reset</button>
   
      <input type="submit" class="btn btn-primary " value="Go">
    
    
</div>

</form>

<br>  <div class="container table-responsive text-nowrap">
       <form id="cartdata" action="storecart.jsp" method="post">
        <input type="hidden" name="cart" value="" id="cart">
        <input type="hidden" name="qty" id="qty">
        <input type="hidden" name="tostorecart" value="yes">
     <table border="4px" class="text-center table table-striped"
     id="focus">
       <label for="" class="text-center"><h2>Product Available With Our Farmers</h2></label>
       <tr>
       <th>Product Name</th>
       <th>Product Type</th>
       <th>Price Of Product</th>
       <th>Quantity Available</th>
       
       <th>Farmer Name</th>
       <th>Mob No.</th>
       <th>Select</th></tr>
       <tbody>
         <%
           try
            {
              Class.forName("com.mysql.jdbc.Driver");
  Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/sih project?serverTimezone=UTC", "root", "");
             PreparedStatement ps1=null;
             if("yes".equals(request.getParameter("select")))
              {
            ps1 = con.prepareStatement("Select * from stock,farmer where Product_name REGEXP ? and product_type REGEXP ?  and State REGEXP ? and farmer.City_1 REGEXP ? and Zip REGEXP ? and stock.UID_farmer = farmer.UID_farmer and stock.Price <= ?" );
            if(request.getParameter("reset").equals("yes"))
             {
              product = "[a-zA-Z]*";
              state = "[a-zA-Z]*";
              city = "[a-zA-Z]*";
              code = "[0-9]*";
              price = 9999;
              type = "[a-zA-Z]*";
             }
             else{
            if(!(request.getParameter("Price")==null || request.getParameter("Price")==""))
             {
              price = Integer.parseInt(request.getParameter("Price"));
             }
             if(!(request.getParameter("Product")==null || request.getParameter("Product")==""))
             {
              product = request.getParameter("Product");
             }
              if(!(request.getParameter("Type")==null || request.getParameter("Type")==""))
             {
              type = request.getParameter("Type");
             }
              if(!(request.getParameter("State")==null || request.getParameter("State")==""))
             {
              state = request.getParameter("State");
             }
              if(!(request.getParameter("City")==null || request.getParameter("City")==""))
             {
              city = request.getParameter("City");
             }
              if(!(request.getParameter("Zip")==null || request.getParameter("Zip")==""))
             {
              code = request.getParameter("Zip");
             } }
            ps1.setString(1,product);
             ps1.setString(2,type);
             
             ps1.setString(3,state);
             ps1.setString(4,city);
             ps1.setString(5,code);
             ps1.setInt(6,price); }
             else
             {
              ps1 = con.prepareStatement("Select * from stock,farmer where stock.UID_farmer = farmer.UID_farmer");
             }
             ResultSet rs = ps1.executeQuery();
             
              while(rs.next()){ %>
                     <tr>
                       <td><%= rs.getString("Product_name") %></td>
                       <td><%= rs.getString("product_type") %></td>
                       <td><%= rs.getString("Price") %></td>
                       <td><%= rs.getString("Quantity") %></td>
                       <td><%= rs.getString("Name") %></td>
                       <td><%= rs.getString("mob_no") %></td>
 <td><button class="btn btn-info" onclick="store('<%= counter%>')" >add</button>
  <input type="hidden" name='<%= ++counter %>' value='<%= rs.getString("UID_farmer")+" "+rs.getString("Product_name")+" "+rs.getString("product_type")+" "+rs.getString("Price") %>'></td>                      
                     </tr> </tbody>
                   <% }
                
                 con.close();
            }
            catch(Exception e)
             { 
              %>
                <script type="text/javascript">
                  alert("<%= e %>");
                 
                </script>
              <%
             } }
         %>
</table></form>
</div>
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

   </body>
 </html>
