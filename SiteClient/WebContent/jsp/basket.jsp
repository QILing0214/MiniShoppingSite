<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.util.*" %>
<%
ArrayList<String> pidList=new ArrayList<String>();
if (session.getAttribute("pidList") == null) {

}else{
	
	pidList.addAll((ArrayList<String>)session.getAttribute("pidList"));
	  
}
  
   String uname=(String)session.getAttribute( "uname" );
   out.println("Hi "+uname);
   out.println("<br></br>");
  // out.println("Product Id List : " +pidList.toString());
   
   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Basket</title>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js" type="text/javascript"></script>
<script>

    function deleteFunction(element){
        alert('The product is deleted!');
        var number = element.id;
     
         window.location=window.location.href+"?param="+number;
         <%    
     
        if (request.getParameter("param") == null) {
        	
        }else{
        	
        String s = request.getParameter("param");
        int a=Integer.parseInt(s);
        
        pidList.remove(a);
        session.setAttribute("pidList", pidList);
        }

         %>
         
        
    }
</script>
	<script type="text/Javascript">
	
		$(document).ready(function() {
			//alert("0");
			var pidList=<%=pidList.toString() %>;
			//alert(pidList);
		    var len=pidList.length;
		   
		for (var i=0; i<len; i++) {	
			
		 (function(i)
					    {
			
			var url="http://localhost:8080/findbyPid?pid="+pidList[i] ;
			
			
			$.get( url , function (data1) {
				//alert(data1);
				
				
				var data=JSON.parse(data1);
				var imgsrc="/SiteClient/images/"+data.catalog+"/"+data.photo;
				//alert(imgsrc);
			        	

				        $("#quote").append("<li><strong>"+data.pname + "</strong></li >");
				        $("#quote").append("<img src=\""+imgsrc+"\">");
				        
				       
				        $("#quote").append("<li style=\"color:Tomato\">"+data.price+"&euro;</li >");
				      $("#quote").append("<button type=\"button\" id="+i+" onclick=\"deleteFunction(this);\">delete</button>");
				      //$("#quote").append('<form action="/SiteClient/DeleteServlet" method="post"><input type="text" value=\''+i+'\' name="param" style="display:block;"><br></br><input type="submit" value="delete"></form>');
				        $("#quote").append("<hr>");
				
			});
					    })(i);
			}
			
		});
	
	</script>
	<style>
div.command {
    position: relative;
    left: 1100px;

}
div.logout {
    position: relative;
    left: 1300px;
    bottom: 25px;

}
input[type=submit] {
    padding:5px 15px; 
    background:#32CD32; 
    border:0 none;
    cursor:pointer;
    -webkit-border-radius: 5px;
    border-radius: 5px; 
}
</style>
</head>
<body>
<h2>Shopping Basket</h2>
<div class="command" >
<input type="submit" value="Command" />
</div>
    
<div class="logout" >
    <form action="/SiteClient/jsp/testLogin.jsp" >
           <input type="submit" value="Logout"  />
    </form>
    </div>
<div id="quote" align="center">

</div>
</body>
</html>