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
  <!-- Bootstrap Styles-->
    <link href="resources/built-in/assets/css/bootstrap.css" rel="stylesheet" />
  	<link rel="stylesheet" href="resources/custom/css/login.css">
  	<link rel="stylesheet" href="resources/custom/css/success_failure_msg.css">  	
  	<link href="resources/built-in/assets/Drawer/animate.css" rel="stylesheet" />
  	
  	<link href="resources/built-in/assets/Drawer/trouserDrawer.css" rel="stylesheet" />
  	 <!-- FontAwesome Styles-->
    <link href="resources/built-in/assets/css/font-awesome.css" rel="stylesheet" />
  	
</head>

<body data-ng-app = "contiApp" data-ng-controller = "UserController as ctrl">

	<div class="success hideme"><i class="fa fa-check-circle" aria-hidden="true"></i> {{ctrl.message}}</div>
	<div class="failure hideme"><i class="fa fa-times-circle" aria-hidden="true"></i> {{ctrl.message}}</div>
	
	<div class="login-page"  >
	  <div class="form">
	    
	    <form name="login-form" class="login-form" role="form" data-ng-submit = "ctrl.findUserbyMbl(ctrl.user.mobileno)" >
      	      <input class="form-control" data-ng-model = "ctrl.user.mobileno" placeholder="Mobileno" id="mobileno" name="mobileno" type="number" data-ng-minlength="10" data-ng-maxlength="10" autofocus data-ng-required = "true" />      		  
      	    <!--   <span class="help-block" data-ng-show="login-form.mobileno.$error.required || login-form.mobileno.$error.required">
                           Valid phone number is required
            </span>
            <span class="help-block" data-ng-show="ctrl.user.mobileno.length != 10">
                           phone number should be 10 digits 
            </span>    -->        
    		 <span class="help-block" data-ng-show="!ctrl.user.mobileno">
                           phone number should be 10 digits 
            </span>
            
     	      <button type="submit" data-ng-disabled = "!ctrl.user.mobileno">Get Username</button>
     		  <p class="message"> << <a href="login">Go back</a></p> 
     		  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	    </form>
	    
	  </div>
	</div>


 	<script type="text/javascript" src="resources/built-in/js/jquery-1.11.1.min.js"></script>
 	<script type="text/javascript" src="resources/built-in/js/angular.min.js"></script>
	<script type="text/javascript" src="resources/custom/js/session.js"></script>
 	<script type="text/javascript" src="resources/custom/js/app.js"></script>
 	<script type="text/javascript" src="resources/custom/js/user_master/user_control.js"></script>
 	<script type="text/javascript" src="resources/custom/js/user_master/user_service.js"></script>
    
</body>

</html>
