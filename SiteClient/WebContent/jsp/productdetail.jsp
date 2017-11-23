<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<% 
String pid =request.getParameter("data");

%>

<script>
    function addFunction(){
        alert('The product is added to basket!');
        <%
        if (session.getAttribute("pidList") == null) {
        	ArrayList<String> pidList=new ArrayList<String>();
        	pidList.add(pid);
            session.setAttribute("pidList", pidList);
        	
            
        } else {
        	ArrayList<String> pidList2=(ArrayList<String>)session.getAttribute("pidList");
        	pidList2.add(pid);
        	session.setAttribute("pidList", pidList2);
        }
        
 

        %>
        
    }
</script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js" type="text/javascript"></script>
	<script type="text/Javascript">
		$(document).ready(function() {
			
		
				var Pid=<%=pid %>;
				var url="http://localhost:8080/findbyPid?pid="+Pid;
				
				
				$.get( url , function (data1) {
					//alert(data1);
					
					
					var data=JSON.parse(data1);
					var imgsrc="/SiteClient/images/"+data.catalog+"/"+data.photo;
					//alert(imgsrc);
				        	

					        $("#quote").append("<li><strong>"+data.pname + "</strong></li >");
					        $("#quote").append("<img src=\""+imgsrc+"\">");
					        
					        $("#detail").append("<li><small>"+data.detail + "</small></li >");
					        $("#quote2").append("<li style=\"color:Tomato\">"+data.price+"&euro;</li >");
					        $("#quote2").append("<button type=\"button\" onclick=\"addFunction();\">Add to basket </button>");
					        
				        
					
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
    bottom: 18px;

}
input[type=submit] {
     
    background:#00BFFF; 
    border-radius: 5px; 
    border:0 none;
 
}
</style>
</head>
<body>
 
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
    

<div id="quote" align="center">
  
</div>
<p id=detail align="center"> </p>
<div id="quote2" align="center">
  
</div>

</body>
</html>