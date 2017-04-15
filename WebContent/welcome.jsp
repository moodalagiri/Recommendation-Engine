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
         <div class="row login-wrap">
						
      <form action="Welcome" method="post" class="form form--login  col-xs-offset-0 col-md-offset-4 col-xs-12 col-md-5">
            <div class="form__field">
       <input type = "hidden" value = <%=(String)request.getAttribute("username")%> required name="username"/>

</div>
        <div class="form__field">
          <i class="fa fa-search" for="login__username"><span class="hidden">Search</span></i>
          <input id="welcome_search" type="text" class="form__input" placeholder="search" required name="search">
        </div>



        <div class="form__field">
          <input type="submit" value="Search">
        </div>

      </form>


    </div>

  </div>






  </body>
</html>
