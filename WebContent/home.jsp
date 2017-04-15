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
$j(document).ready(function(e){
	$j('.selection').change(function(e){
		//alert($j(this).attr('data-title'));
		document.getElementById('moviename').value=$j(this).attr('data-title');
	});
});
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
  </head>
  <body background ="dark_embroidery.png">
  <div class="container">
 <h1 class="headtitle"><strong><i>FlixTrix</i></strong></h1>
<p class="tag-line">The ultimate movie Recommendation system</p>
 
  <div class="top-panel"><nav class="navbar navbar-inverse navbar-fixed-top" id="my-navbar">
     <div class="container">
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
 
         <div class="row login-wrap movie-list">

<h2 class="srch">Search Resuts</h2>
        <form action="Reco" method="post" class="form form--login  col-xs-offset-0 col-md-offset-4 col-xs-12 col-md-5">
<c:forEach var="title" items="${titles}" varStatus = "loop">
       <input type = "radio" name = "Selection" value = "${loop.index}" id="radio${loop.index}" class="selection" data-title="        <c:out value="${title}"/>
       ">
        <c:out value="${title}"/>
       <br><br>
       </input>
</c:forEach>
<input type="hidden" value="" id="moviename" name="moviename" />
<br/>
       <input type="submit" value="Select" class="space-pad"/>
       </form>
    </div>

  </div>






  </body>
</html>
