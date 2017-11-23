<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- bootstrap --> 
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- bootstrap --> 
  
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Computer</title>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js" type="text/javascript"></script>
	<script type="text/Javascript">
		$(document).ready(function() {
			//alert("0");
		
				
				$.get("http://localhost:8080/findbyCatalog?catalog=computer" , function (data1) {
					
					var data=JSON.parse(data1);//I guess data1 is string
					var len = data.length
				        for (var i=0; i<len; i++) {
					        
				        	 $("#quote").append("<li><strong><a href=\"/SiteClient/jsp/productdetail.jsp?data="+data[i].pid+"\">"+data[i].pname + "</a></strong></li >");
						        $("#quote").append("<img src=\"/SiteClient/images/computer/"+data[i].photo+"\">");//$("#picture").append("<img src=\" + returnData.img_url + "\" />");
						        
						        $("#quote").append("<li><small>"+data[i].description + "</small></li >");
						        $("#quote").append("<li style=\"color:Tomato\">"+data[i].price+"&euro;</li >");
						        $("#quote").append("<hr>");
					        
				        }
					
				});
				$("#submit").click(function () 
						  {
							var search=$('#search').val();
							
							$.ajax({
								type:"GET",
								dataType: 'application/json',
								
								url:"http://localhost:8080/findbyPnameCatalog",
								data:{"pname":search,"catalog":"computer"},
								success:function(data1){
									
									//alert(data1.toString());
									var data=JSON.parse(data1);
									var len = data.length
									 $("#quote").html("");
							        for (var i=0; i<len; i++) {
								        
							        	

								        $("#quote").append("<li><strong><a href=\"/SiteClient/jsp/productdetail.jsp?data="+data[i].pid+"\">"+data[i].pname + "</a></strong></li >");
								        $("#quote").append("<img src=\"/SiteClient/images/computer/"+data[i].photo+"\">");//$("#picture").append("<img src=\" + returnData.img_url + "\" />");
								        
								        $("#quote").append("<li><small>"+data[i].description + "</small></li >");
								        $("#quote").append("<li style=\"color:Tomato\">"+data[i].price+"&euro;</li >");
								        $("#quote").append("<hr>");
							        }
								}
									
						
						  });
						});
			
		});
	</script>
	<style>
div.basket {
    position: relative;
    left: 1100px;

}

div.logout {
    position: relative;
    left: 1300px;
    bottom: 22px;

}
input[type=submit] {
     
    background:#00BFFF; 
    border-radius: 5px; 
    border:0 none;
 
}
</style>
</head>
<body>

    <div id="header" align="center">
       <h2>Minishop</h2>
      

        Search computer: <input id="search" name="search" type="text">
        <input src="/SiteClient/images/others/searchbutton.jpg" id="submit" name="submit" type="image" style="width:25px;height:25px;position: absolute;" >
   
    </div>
    
    <div class="basket" >
    <form action="/SiteClient/jsp/basket.jsp" >
           <input src="/SiteClient/images/others/basket.png" id="submit2" name="submit2" type="image" style="width:50px;height:50px;" >
           <input type="submit" value="GO to Basket" />
     </form>
    </div>
        
   <div class="logout" >
    <form action="/SiteClient/jsp/testLogin.jsp" >
           <input type="submit" value="Logout"  />
    </form>
    </div>
    
    <div class="container">
                 
      <ul class="breadcrumb">
        <li><a href="/SiteClient/jsp/product.jsp">Phone</a></li>
        <li><a href="/SiteClient/jsp/catalog/book.jsp">Book</a></li>
        
        <li><a href="/SiteClient/jsp/catalog/sport.jsp">Sport</a></li>
        <li class="active">Computer</li>
      </ul>
    </div>
	<div id="quote" align="center">

	</div>

	
	
	
</body>
</html>