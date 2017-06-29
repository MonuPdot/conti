<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib
    prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" 
%>
<%@ page isELIgnored="false" %> 
<%@page session="true"%>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>  ${title}</title>
    <!-- Bootstrap Styles-->
    <link href="resources/built-in/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="resources/built-in/assets/css/font-awesome.css" rel="stylesheet" />
	
	 <link href="resources/built-in/assets/Drawer/animate.css" rel="stylesheet" />
	 
    <!-- Morris Chart Styles-->
    <link href="resources/built-in/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="resources/built-in/assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="resources/built-in/assets/js/Lightweight-Chart/cssCharts.css"> 
	
	 <link href="resources/built-in/assets/Drawer/trouserDrawer.css" rel="stylesheet" />
	 <link href="resources/custom/css/custom.css" rel="stylesheet">
	 
	 <script type="text/javascript" src="resources/built-in/js/angular.min.js"></script>
   <script src="resources/custom/js/app.js"></script>
</head>


<body style="overflow-x:hidden;" data-ng-app = "contiApp" data-ng-controller = "EmployeeController as ctrl">

 		<div class="overlay hideme"></div>
 		
 		<div class="drawer hideme">
 		<form data-ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
 			<div class="row">
 			<div class="col-lg-12 trowserHeader">
 				 
                   <div class="col-lg-6 headerLeft">
                   		 <b class="model-title">Employee Master</b>
                   		 
                   </div>
                   
                   <div class="col-lg-6 headerRight">
                   		<i class="fa fa-times fa-2x drawerClose pull-right iconLeft"></i>
                   </div>
            
             </div>
 			</div>
                
                 <input type="hidden" data-ng-model="ctrl.employee.emp_id" />
                 
                 <div class="model-body test-size">
	                <div class="row">
		                <div class="col-lg-12">
		                <div class="col-lg-6 contentLeft">
		                 	   <span>Employee Name </span>	         
			                   <input type="text" class="form-control" data-ng-model="ctrl.employee.emp_name">
			                   
			                   <span>Employee Code</span>
			                   <input type="text" class="form-control" data-ng-model="ctrl.employee.emp_code">
			                   
			                   <span>Employee Category</span>
			                   <input type="text" class="form-control" data-ng-model="ctrl.employee.empcategory">
			                   
			                   <span>Branch Name</span>
			                   <input type="text" class="form-control" data-ng-model="ctrl.employee.branch_id">
			                   
			                   <span>Date of Birth</span>
			                   <input type="text" class="form-control">
			                   
			                   <span>Date Of Joining</span>
			                   <input type="text" class="form-control">
			                   
			                   <span>Address</span>
			                   <input type="text" class="form-control"  data-ng-model="ctrl.employee.emp_address">
			           
			             </div>  
			             
			             <div class="col-lg-6 contentRight">
		                 	   <span>Location </span>	         
			                   <input type="text" class="form-control">
			                   
			                   <span>City </span>	         
			                   <input type="text" class="form-control">
			                   
			                   <span>State </span>	         
			                   <input type="text" class="form-control">
			                   
			                   <span>Country </span>	         
			                   <input type="text" class="form-control">
			                   
			                   <span>Pincode </span>	         
			                   <input type="text" class="form-control">
			                   
			                   <span>Phone Number </span>	         
			                   <input type="text" class="form-control">
			                   
			                   <span>Mail </span>	         
			                   <input type="text" class="form-control" data-ng-model="ctrl.employee.emp_email">
			           
			             </div>   	
			                	                
		                </div>                
	                </div>                
                 </div>
                 
                 <div class="modal-footer footerHeight">
				
				<div class="row">
					<div class="col-lg-12">
						<div class="col-lg-4 footerLeft">
							<button type="button" class="btnPadding btn btn-danger drawerClose" style="float:left; margin-right: 25px;">Cancel</button>
						</div>
						
						<div class="col-lg-4" style="text-align:center; !important;">
							<a id="" class="btnPadding btn btn-warning"	style="display: none; "><i class="fa fa-trash"  aria-hidden="true"></i> &nbsp;Delete</a> 
							
							<a id="" class="btnPadding btn btn-primary" style="display:none;">Clear</a>							
						</div>
						
						<div class="col-lg-4 footerRight">

						    <div class="btn-group dropup" id="savebutton">
								  <button type="submit" class="btnPadding btn btn-success dropdown-toggle">					  
								  Save
								  </button>
								      
						</div>



						
						
						</div>
					</div>
				</div>
            </div>
 			
 			
 			</form>
 		</div>
 
	
	<jsp:include page="../Dashboard/nav.jsp"/>
	
    <div id="wrapper">        	  
		<div id="page-wrapper">	 
      
      		<div class="row">
      		<div class="col-lg-12">
	      		<div class="page-header">
	      		   ${title}
	      		</div>      		
      		</div>      		
      		</div>
      		
      		<div class="row">
      		<div class="col-lg-12">
	      		<div class="col-lg-4">
	      		    <button class="btn btn-info drawerOpen" >Add New Employee</button>
	      		</div>
      			{{ctrl.empmsg}}
      		</div>      		
      		</div>
      
            
        </div>
        <!-- /. PAGE WRAPPER  -->
		
    </div>
    <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
    <!-- jQuery Js -->
    
    
   <script src="resources/custom/js/custom.js"></script>
   
  <script src="resources/custom/js/employee_master/employee_controller.js"></script>
  <script src="resources/custom/js/employee_master/employee_service.js"></script>
     

</body>

</html>