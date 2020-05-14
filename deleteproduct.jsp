<%@ page import="java.sql.*,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
  <meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
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
    if(session.getAttribute("id") == null)
      { %> <script type="text/javascript">
      	 alert("please login first");
      	 window.location.href = "FarmerLogin.jsp";
      </script>
        <%  
      } 
    
  %> 
 <div class="container">
  	<form  class="form" action="delete.jsp" method="post">
  		<div class="form-group">
  			 <b>  <label for="ProductName">Product Name</label> </b>
      <input type="text" class="form-control" id="ProductName" placeholder="--------" name="ProductName" pattern="[A-Z a-z]+" required>
  		</div>
  		<div class="form-group">
  			 <b>  <label for="Type">Type</label> </b>
      <input type="text" class="form-control" id="Type" placeholder="--------" name="Type"  required>
  		</div>
  		
  		<input type="submit" value="delete"  class="btn btn-primary">
       <a href="ConsumerLogout.jsp" role="button" class="btn btn-secondary">LogOut</a>
  	</form>
  </div>
</body>
</html>