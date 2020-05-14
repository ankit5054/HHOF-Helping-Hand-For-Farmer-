<!DOCTYPE html>
<html>
<head>
	<title></title>
	<script type="text/javascript">
		function getId() {
			// body...
			var id = prompt("Enter your id");
			if(id==""||id==null)
			{   alert("id can't be null");
				getId();
			}
            else{
            window.location.replace("ResetPassword2.jsp?id="+id);}
		}
	</script>
</head>
<body onload="getId()">  

</body>
</html>