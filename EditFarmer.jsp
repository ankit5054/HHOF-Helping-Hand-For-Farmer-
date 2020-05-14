<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
   
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="Main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
   <script type="text/javascript">
   	 window.addEventListener('blur',change);
        function change() {
          // body...
          window.location.href="ConsumerLogout.jsp";
        }
   </script>

</head>
<body>
<%
if(session.getAttribute("id")==null)
 {
 	%>
 	<script type="text/javascript">
 		alert("please login first");
 		window.location.assign("ConsumerLogout.jsp");
 	</script>
 	<%
 }
 else
 { %>
  <div class="container">
  	<form role="form" method="post" class="form-horizontal" action="EditFarmer2.jsp">
  		
  		<div class="form-group">
  			<label for="Name" class="control-label col-md-2"  ><b style="font-size: 20px;">Name</b></label>
  			<div class="col-md-10">
  			<input type="text" name="Name" id="Name" class="form-control " pattern="[A-Za-z ]+"  title="only alphabets allowed" required ></div>
  		</div>
  	    <div class="form-group">
  			<label for="phone" class="control-label col-md-2"  ><b style="font-size: 20px;">Contact</b></label>
  			<div class="col-md-10">
  			<input type="text" name="Phone" id="phone" class="form-control " pattern="[0-9]{10}"></div>
  		</div>
  		<div class="form-group">
  			<label for="bank" class="control-label col-md-2"  ><b style="font-size: 20px;">Bank Name</b></label>
  			<div class="col-md-10">
  			<input type="text" name="Bank" id="bank" class="form-control " pattern="[a-zA-Z ]{2,}"></div>
  		</div>
  		<div class="form-group">
  			<label for="ifsc" class="control-label col-md-2"  ><b style="font-size: 20px;">IFSC Code</b></label>
  			<div class="col-md-10">
  			<input type="text" name="Ifsc" id="ifsc" class="form-control " pattern="[a-zA-Z0-9]+"></div>
  		</div>
  		<div class="form-group">
  			<label for="a/c" class="control-label col-md-2"  ><b style="font-size: 20px;">A/C No.</b></label>
  			<div class="col-md-10">
  			<input type="text" name="Account" id="a/c" class="form-control "></div>
  		</div>
  		<div class="form-group">
  			<label for="state" class="control-label col-md-2"  ><b style="font-size: 20px;">State</b></label>
  			<div class="col-md-10">
  			<input type="text" name="State" id="state" class="form-control "></div>
  		</div>
  		<div class="form-group">
  			<label for="city" class="control-label col-md-2"  ><b style="font-size: 20px;">City</b></label>
  			<div class="col-md-10">
  			<input type="text" name="City" id="city" class="form-control "></div>
  		</div>
  		<div class="form-group">
  			<label for="zip" class="control-label col-md-2"  ><b style="font-size: 20px;">Zip Code</b></label>
  			<div class="col-md-10">
  			<input type="text" name="Zip" id="zip" class="form-control "></div>
  		</div>
  		<div class="form-group">
  			<label for="address" class="control-label col-md-2"  ><b style="font-size: 20px;">Address</b></label>
  			<div class="col-md-10">
  			<input type="text" name="Address" id="address" class="form-control "></div>
  		</div>
  		<div class="form-group">
  		<input type="submit" name="" class="btn btn-success btn-lg "></div>
  	</form>
  </div>
  <% }
%>
</body>
</html>