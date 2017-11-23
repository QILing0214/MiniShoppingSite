<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
   session.invalidate(); 
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js" ></script>
<script type="text/Javascript">
$(document).ready(function() {
		//alert("0");
	$("#login").click(function () 
	  {
		var uname=$('#uname').val();
		var passwd=$('#passwd').val();
		$.ajax({
			type:"POST",
			dataType: 'application/json',
			
			url:"http://localhost:8080/login",
			data:{"uname":uname,"passwd":passwd},
			success:function(data){
				
				//alert(data.toString());
				var data2=JSON.parse(data);
				var theKey = 'result';
				var theValue=data2[theKey];
				//alert(data2[theKey]);
			
               

				
				if(theValue=="good"){
					//alert(theValue+"good");

					$(location).attr('href','product.jsp?uname='+uname);
					
					
				}else{
					//alert(theValue+"wrong");
					$("#quote p").html("<p>" + "wrong username or password!" + "</p>");
				}
			//	});
			}
	
	  });
	});
	});

	</script>
</head>
<body>
	<h1>Login</h1>
	<div id="regist-main">
		
			 User name:<br>
             <input id="uname" name="uname" type="text" >
             <br>
             User password:<br>
             <input id="passwd" name="passwd" type="password">
			 <br>
			
			 <input type="submit" id="login" value="login">
		  
	</div>
	
	<div id="quote">
		<hr>
			<p>Please login</p>
		<hr/>
	</div>
</body>
</html>