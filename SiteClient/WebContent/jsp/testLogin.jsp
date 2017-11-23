<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
   session.invalidate(); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="/SiteClient/css/login.css">
<style> 

</style>
<!-- bootstrap --> 
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- bootstrap --> 
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" ></script>--> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js" type="text/javascript"></script>

<script type="text/Javascript">
$(document).ready(function() {
		//alert("0");
	$("#login-submit").click(function () 
	  {  //alert("0");
		var uname=$('#username').val();
		var passwd=$('#password').val();
		//alert(uname+passwd);
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
					alert("wrong username or password!");
				}
			//	});
			}
	
	  });
	});
	$("#register-submit").click(function () 
			  {  //alert("0");
				var uname=$('#username2').val();
				var passwd1=$('#password2').val();
				var passwd2=$('#confirm-password').val();
				var email=$('#email').val();
				// alert(uname+passwd1+passwd2+email);
				if (passwd1!==passwd2){
					alert("You should enter same password!");
				}else{
				//alert(uname+passwd);
				$.ajax({
					type:"POST",
					dataType: 'application/json',
					
					url:"http://localhost:8080/register",
					data:{"uname":uname,"passwd":passwd1,"email":email},
					success:function(data){
						
						//alert(data.toString());
						alert("Success register and you can login now!");
						//var data2=JSON.parse(data);
						$("#login-form").fadeIn(100);
				 		$("#register-form").fadeOut(100);
						$('#register-form-link').removeClass('active');
						$(this).addClass('active');
		               

						
						
					}
			
			  });
			       }
			});
	 $('#login-form-link').click(function(e) {
			$("#login-form").fadeIn(100);
	 		$("#register-form").fadeOut(100);
			$('#register-form-link').removeClass('active');
			$(this).addClass('active');
			e.preventDefault();
		});
		$('#register-form-link').click(function(e) {
			$("#register-form").fadeIn(100);
	 		$("#login-form").fadeOut(100);
			$('#login-form-link').removeClass('active');
			$(this).addClass('active');
			e.preventDefault();
		});
	});

	</script>
</head>
<body>
<div class="container">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">Login</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">Register</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<div id="login-form"  style="display: block;">
									<div class="form-group">
										<input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" >
									</div>
									<div class="form-group">
										<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div class="form-group text-center">
										<input type="checkbox" tabindex="3" class="" name="remember" id="remember">
										<label for="remember"> Remember Me</label>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="LogIn">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="testLogin.jsp" tabindex="5" class="forgot-password">Forgot Password?</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div id="register-form"  style="display: none;">
									<div class="form-group">
										<input type="text" name="username" id="username2" tabindex="1" class="form-control" placeholder="Username" value="">
									</div>
									<div class="form-group">
										<input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" value="">
									</div>
									<div class="form-group">
										<input type="password" name="password" id="password2" tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div class="form-group">
										<input type="password" name="confirm-password" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password">
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>