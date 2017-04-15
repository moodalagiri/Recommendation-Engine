<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Register</title>


<script type="text/javascript" language="javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js">
</script>
<script type="text/javascript" language="javascript">

$j = jQuery.noConflict();

</script>
<script type="text/javascript" language="javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.0/jquery-ui.min.js">
</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js">
</script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>


<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

<link rel="stylesheet" type="text/css" href="css/style.css" />

   

  </head>

  <body ng-app="MyApp">
  <div class="container">

    <div class="row">
      <form action="register" ng-controller="ValidationController" method="post" class="form form--login  col-xs-offset-0 col-md-offset-4 col-xs-12 col-md-5" name="myForm">
        <div class="form__field">
            <label class="fontawesome-user" for="login__firstname"><span class="hidden">UserName</span></label>
            <input id="login__firstname" type="text" class="form__input" placeholder="UserName" required name="username">
          </div>

          <div class="form__field">
            <label class="fontawesome-inbox" for="login__email"><span class="hidden">Email</span></label>
            <input id="login__email" type="email" class="form__input" placeholder="Email" required name="email" ng-model="email.text">
          </div>
                <div class="form__field">

      <span class="error" ng-show="myForm.email.$error.email">
        Not valid email!</span>
          </div>
          <div class="form__field">
            <label class="fontawesome-user" for="login__password1"><span class="hidden">Password</span></label>
            <input id="password" type="password" name="password" class="form__input" ng-model="password" required placeholder="Password" >
            </div>
          <div class="form__field">
            <label class="fontawesome-user" for="login__password2"><span class="hidden">Re-enter Password</span></label>
            <input id="verify" class="form__input" ng-model="verify" type="password" name="verify" placeholder="Confirm Password" required pw-check="password" >
            </div>
  <div class="form__field">

  <span class="error" ng-show="myForm.verify.$error.pwmatch">
    Passwords don't match.
  </span>
</div>


          <div class="form__field createuser">
            <input type="submit" value="Create User">
          </div>
      </form>
    </div>
<div class="signupbottom row "><p class="text--center col-xs-offset-0 col-md-offset-4 col-md-5">Sign Up? <a href="index.html">Back to Login</a> <span class="fontawesome-arrow-right"></span></p></div>

  </div>






  </body>
</html>
