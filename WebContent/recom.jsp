 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html >
  <head>

    <meta charset="UTF-8">
    <title>Welcome</title>


    <script type="text/javascript" language="javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js">
</script>
<script type="text/javascript" language="javascript">

$j = jQuery.noConflict();

</script>
<script type="text/javascript" language="javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.0/jquery-ui.min.js">
</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js">
</script>
 <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js">
</script>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<link rel="stylesheet" type="text/css" href="./css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<style>


  h1.headtitle{width:100%;margin:0 auto;color:#fff;font-size:50px;padding-bottom:20px;padding-left:30%;}
.tag-line{width:100%;margin:0 auto;color:#fff;font-size:25px;padding-bottom:50px;padding-left:30%;}
.form--login{margin-left:0px;width:70%;}
.space-pad{margin-top:20px;}
h2.srch{color:#ffffff !important;font-size:16px;}
</style>
     <div class="container">

<h1 class="headtitle"><strong><i>FlixTrix</i></strong></h1>
<p class="tag-line">The ultimate movie Recommendation system</p>
 
  <div class="top-panel"><nav class="navbar navbar-inverse navbar-fixed-top" id="my-navbar">
        <div class="navbar-header">
 <%
String userName = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
    if(cookie.getName().equals("user")) userName = cookie.getValue();
}
}
if(userName == null) response.sendRedirect("index.html");
%>
		 
		  <a  class="navbar-brand">
		  <p>Welcome <%=userName%></p> 
		  </a>
		  <div class= "nav navbar-nav navbar-right">
		 <p allign="right"><a href="logout.html" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-shopping-cart" ></span> Logout</a></p>
		 
		   </div>
	
		
		
		
		</div> <!--navbar header-->
		
		
    </div><!--end container-->
</nav><!--end navbar-->
  
  

  </div>
  </head>
  <body background ="dark_embroidery.png">
  <div class="container">
   <h1 class="" style="color:white">Your Selection : <%=(String)request.getAttribute("movie")%></h1>
        
       <p> <a href = "http://localhost:8080/RecommendationEngine/webcamjs-master/src/click-to-run.html">Do you like this movie?</a></p>
        
  

        <form action="Reco" method="post" class="form form--login  col-xs-offset-0 col-md-offset-4 col-xs-12 col-md-5">
        <h2> Movies similar to your selection </h2>
       <c:forEach var="movie" items="${movies}" varStatus = "loop">
        <c:out value="${movie}"/>
       <br>
       </input>
</c:forEach>
        <h2> Users also liked the below movies </h2>
<c:forEach var="user" items="${users}" varStatus = "loop">
        <tr>
        <td><c:out value="${user}"/></td>
       <br>
       </tr>
       </input>
</c:forEach>
       </form>
    </div>

  </div>






  </body>
</html>
