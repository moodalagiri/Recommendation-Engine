<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Login</title>


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

<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

<link rel="stylesheet" type="text/css" href="css/style.css" />
<style>
html{background:black;}
h1.headtitle{width:100%;margin:0 auto;color:#fff;font-size:50px;padding-bottom:20px;padding-left:30%;}
.tag-line{width:100%;margin:0 auto;color:#fff;font-size:25px;padding-bottom:50px;padding-left:30%;}
.imgcapt{float:left;width:55%;}
.login-wrap{float:left;width:43%;margin-left:2%;}
.form--login{margin-left:0px;width:100%;}
</style>
   

  </head>

  <body background ="black">


  <div class="container">
  <h1 class="headtitle"><strong><i>FlixTrix</i></strong></h1>
<p class="tag-line">The ultimate movie Recommendation system</p>
 <div class="imgcapt"><img src="outdoorfilm.gif" alt="" /></div>
         <div class=" login-wrap">

       <form action="login" method="post" class="form form--login  col-xs-offset-0 col-md-offset-4 col-xs-12 col-md-5">
            <div class="form__field">

</div>
        <div class="form__field">
          <label class="fontawesome-user" for="login__username"><span class="hidden">Username</span></label>
          <input id="login__username" type="text" class="form__input" placeholder="Username" required name="USERNAME">
        </div>

        <div class="form__field">
          <label class="fontawesome-lock" for="login__password"><span class="hidden">Password</span></label>
          <input id="login__password" type="password" class="form__input" placeholder="Password" required name="PASSWORD">
        </div>

        <div class="form__field">
          <input type="submit" value="Sign In">
        </div>

      </form>


    </div>
<div class="signupbottom row "><p class="text--center col-xs-offset-0 col-md-offset-4 col-md-5">Not a member? <a href="register.html">Sign up now</a> <span class="fontawesome-arrow-right"></span></p></div>

  </div>
  </body>
</html>