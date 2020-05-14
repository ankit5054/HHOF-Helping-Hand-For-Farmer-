
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<script type="text/javascript">
		function getId() {
			var id = prompt("Please enter your id");
			if(id ==null || id=="")
			{
				alert("id can not be null");
				getId();
			}
			else
		    {
			window.location.replace("FarmerLoginOTP2.jsp?id="+id);}

		}
	</script>
</head>
<body onload="getId()">

</body>
</html>