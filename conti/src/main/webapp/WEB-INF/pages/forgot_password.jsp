<!DOCTYPE html>

<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<%@ page isELIgnored="false" %> 
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
   <meta name="_csrf" content="${_csrf.token}"/>
   <meta name="_csrf_header" content="${_csrf.headerName}"/>

   <title>${title}</title>
  
  	<link rel="stylesheet" href="resources/custom/css/login.css">
</head>

<body data-ng-app = "contiApp">



	<div class="login-page"  data-ng-controller = "UserController as ctrl">
	  <div class="form">
	    
	    <form name="login-form" class="login-form" role="form" data-ng-submit = "ctrl.findUsername()" >
	    
	      	      <input class="form-control" data-ng-model = "ctrl.user.username" placeholder="Username" id="username" name="username" type="text" autofocus required />
	      		  
	     	      <button type="submit">Get password</button>
	     		  <p class="message"> << <a href="login">Go back</a></p>
	     		  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	     		
	    </form>
	    {{ctrl.message}}
	  </div>
	</div>


 	<script type="text/javascript" src="resources/built-in/js/jquery-1.11.1.min.js"></script>
 	<script type="text/javascript" src="resources/built-in/js/angular.min.js"></script>
	<script type="text/javascript" src="resources/custom/js/session.js"></script>
 	<script type="text/javascript" src="resources/custom/js/app.js"></script>
 	<script type="text/javascript" src="resources/custom/js/user_control.js"></script>
 	<script type="text/javascript" src="resources/custom/js/service.js"></script>
 	<script type="text/javascript" src="resources/custom/js/user_service.js"></script>
    
</body>

</html>
