<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js" type="text/javascript"></script>
	<script type="text/Javascript">
		$(document).ready(function() {
			alert("0");
			$("#replaceContent").click(function() {
				//var text = $("#name").val();
				$.get("http://localhost:8080/findall2?id=1" , function (data) {
					

					$("#quote p").html("<p>"+ data+data.id+ data.firstName + data.lastName + "</p>");
					
				});
			});
		});
	</script>
</head>
<body>
	<div id="quote">
		<hr>
			<p>Hello </p>
		<hr/>
	</div>
	<input type="text" id="name" value="1">
	<input type="submit" id="replaceContent" value="Refresh local"></input>
</body>
</html>