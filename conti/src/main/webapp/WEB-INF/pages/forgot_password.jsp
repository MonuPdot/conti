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
  	<link href="resources/built-in/assets/Drawer/animate.css" rel="stylesheet" />
  	
  	<link href="resources/built-in/assets/Drawer/trouserDrawer.css" rel="stylesheet" />
  	 <!-- FontAwesome Styles-->
    <link href="resources/built-in/assets/css/font-awesome.css" rel="stylesheet" />
  	<style>
  		.success {
  			background-color: #85ca2b;
		    padding: 25px;
		    color: white;
		    text-align: center;
		    position:absolute;
		    width : 100%;
		   /*  box-shadow: 0px 5px 5px rgba(0, 0, 0, 0.3); */
		   
		      -webkit-box-shadow:0 1px 4px rgba(0, 0, 0, 0.3);
   			 box-shadow:0 1px 4px rgba(0, 0, 0, 0.3);
		    font-size: 5mm;
		    z-index: 2;
  		}
  		.success:after{
		    content:"";
		    position:absolute;
		    z-index:-1;
		    top:100%;
		    bottom:0;
		    width:120%;
		    height:50px;
		    left:-10%;
		    right:-10%;
		    background:-webkit-radial-gradient(50% -3%, ellipse cover, rgba(00, 00, 00, 0.5), rgba(97, 97, 97, 0.0) 30%);
		    background:radial-gradient(ellipse at 50% -3%, rgba(00, 00, 00, 0.5), rgba(97, 97, 97, 0.0) 30%);
		}
  		.hideme {
  			display : none;
  		}
  		.scrollHidden {				
			overflow-x: hidden;			
		}
  	</style>
</head>

<body data-ng-app = "contiApp" data-ng-controller = "UserController as ctrl">

	<div class="success hideme"><i class="fa fa-check-circle" aria-hidden="true"></i> {{ctrl.message}}</div>

	<div class="login-page"  >
	  <div class="form">
	    
	    <form name="login-form" class="login-form" role="form" data-ng-submit = "ctrl.findUsername()" >
      	      <input class="form-control" data-ng-model = "ctrl.user.username" placeholder="Username" id="username" name="username" type="text" autofocus required />      		  
     	      <button type="submit">Get password</button>
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
