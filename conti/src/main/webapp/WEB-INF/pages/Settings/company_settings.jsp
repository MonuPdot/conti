<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@page session="true"%>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>


	
	
<title>${title}</title>
<!-- Bootstrap Styles-->
<link href="resources/built-in/assets/css/bootstrap.css"
	rel="stylesheet" />
<!-- FontAwesome Styles-->
<link href="resources/built-in/assets/css/font-awesome.css"
	rel="stylesheet" />

<link href="resources/built-in/assets/Drawer/animate.css"
	rel="stylesheet" />

<!-- Morris Chart Styles-->
<link href="resources/built-in/assets/js/morris/morris-0.4.3.min.css"
	rel="stylesheet" />
<!-- Custom Styles-->
<link href="resources/built-in/assets/css/custom-styles.css"
	rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet"
	href="resources/built-in/assets/js/Lightweight-Chart/cssCharts.css">

<link href="resources/built-in/assets/Drawer/trouserDrawer.css"
	rel="stylesheet" />
<link href="resources/custom/css/custom.css" rel="stylesheet">

 	<script type="text/javascript" src="resources/built-in/js/angular.min.js"></script>
	<script type="text/javascript" src="resources/custom/js/app.js"></script>
	<script type="text/javascript" src="/resources/custom/js/session.js"></script>
	
</head>


<body style="overflow-x: hidden;"  data-ng-app="contiApp">


	<jsp:include page="../Dashboard/nav.jsp" />

	<div id="wrapper" data-ng-controller="companyController as comctrl" >
		<div id="page-wrapper"  >

		<form data-ng-submit="comctrl.submit()"  >
 
			<input type="hidden" data-ng-model="comctrl.company.company_id"/>
			
			
			<div class="panel panel-default panelMarginBottom" data-ng-click="comctrl.submit()">
				<div class="panel-heading"></div>
				<div class="panel-body customer-font">
					<b>${title}</b>
				</div>
			</div>

			<div class="marginLeftRight">

				<div  class="subHeading"><span>Company Information</span></div>

				<div class="row">

					<div class="col-lg-6">
						<div class="form-group">
							<label for="companyName">Company Name</label> 
							<input type="text" 	class="form-control" 
							placeholder="Enter Company Name"
							id="companyName"
							data-ng-model="comctrl.company.company_name">
						</div>
						
						<div class="form-group">
							<label for="address1">Address Line 1</label>
							 <input
							  data-ng-model="company_address1"
							  type="text"
							  id="address1"
							  placeholder="Enter Address"
					          class="form-control" >
						</div>
						
					</div>


					<div class="col-lg-6">

						<div class="col-lg-12 noPaddingLeft">
							<label for="companyImage">Company Logo</label>
						</div>

						<div class="col-lg-6 noPaddingLeft">
							<img src="resources/Image/images.png" id="companyImage"
								alt="pic_mountain.jpg" id="companyImage" 
								style="width: 105px; height: 105px;">
						</div>

						<div class="col-lg-6 noPaddingLeft">

							<div class="col-lg-12">
								<button type="button" style="visibility: hidden;"
									class="btn btn-default">Browse</button>
							</div>
								<div class="col-lg-12">
								<button type="button" style="visibility: hidden;"
									class="btn btn-default">Browse</button>
									
							</div>

							<input 
							 data-ng-model="company_logo"
							 type="text" 
							 class="btn btn-default" name="Browse">
							 
						</div>

					</div>		
					
				</div>

				<div class="row">
					<div class="col-lg-6">
						
					</div>
					<div class="col-lg-6">
						
					</div>

				</div>


				<div class="row">
					<div class="col-lg-6">
						<div class="form-group">
							<label for="address2">Address Line 2</label> 
							<input 
							id="address2"
							data-ng-model="company_address2"
							placeholder="Enter Address"
							type="text"
							class="form-control">
						</div>
					</div>
					<div class="col-lg-6">
					<div class="form-group">
							<label for="tinNo">TIN No</label> 
							<input
							 data-ng-model="tin_number"
							 type="text" id="tinNo"
							 placeholder="Enter Tin Number"
							 class="form-control">
						</div>
					</div>

				</div>


				<div class="row">
					<div class="col-lg-6">
						<div class="form-group">
							<label for="location">Location</label> 
							<input 
							    data-ng-model="company_location"
							    placeholder="Enter Location"
								type="text"
								class="form-control"
								id="location">
						</div>
					</div>
					<div class="col-lg-6">
						<div class="form-group">
							<label for="gstNo">GST No</label>
							 <input type="text"
							 id="gstNo"
							 data-ng-model="gst_number"
							 placeholder="Enter GST Number"
							 class="form-control">
						</div>
					</div>

				</div>

				<div class="row">
					<div class="col-lg-3">
						<div class="form-group">
							<label for="city">City</label> 
							<input type="text"
								data-ng-model="company_city"
								placeholder="Enter City"
								class="form-control" 
								id="city">
						</div>
					</div>
					<div class="col-lg-3">	
						<div class="form-group">
							<label for="state">State</label>
							 <input type="text"
							 data-ng-model="company_state"
							 placeholder="Enter State"
								class="form-control" id="state">
						</div>
					</div>
						<div class="col-lg-3">
						<div class="form-group">
							<label for="landline">Landline</label>
							 <input type="text"
							 data-ng-model="company_landlineno"
							 placeholder="Enter Landline Number"
							 class="form-control" id="landline">
						</div>
					</div>
					<div class="col-lg-3">
						<div class="form-group">
							<label for="altNo">Alternate Number</label> 
							<input type="text"
							data-ng-model="company_alternateno"
							placeholder="Enter Alternate Number"
								class="form-control" id="altNo">
						</div>
					</div>

				</div>


				<div class="row">
					<div class="col-lg-3">
						<div class="form-group">
							<label for="country">Country</label> 
							<input type="text"
							data-ng-model="company_country"
							placeholder="Enter Country"
								class="form-control" id="country">
						</div>
					</div>
					<div class="col-lg-3">
						<div class="form-group">
							<label for="pincode">Pincode</label>
							 <input type="text"
							 	data-ng-model="company_pincode"
							 	placeholder="Enter Pincode"
								class="form-control" id="pincode">
						</div>
					</div>
					<div class="col-lg-6">
						<div class="form-group">
							<label for="email">Email</label> 
							<input type="email"
							data-ng-model="company_email"
							placeholder="Enter Email"
								class="form-control" id="email">
						</div>
					</div>

				</div>
			</div>



			<div class="marginLeftRight">

			<div  class="subHeading"><span>Other Setting</span></div>

				<div class="row">

					<div class="col-lg-6">
						<div class="form-group">
							<label for="gstPer">Tax GST%</label> 
							<input type="text"
								data-ng-model="tax_GST"
								placeholder="Enter GST%"
								class="form-control" id="gstPer">
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-3">
						<div class="form-group">
							<label for="email">No.of.days for Delivery</label>
							 <input type="number"
							 data-ng-model="expct_deliverydate"
							 placeholder="Enter No.of.days for Delivery"
							 class="form-control" id="email">
						</div>
					</div>
					<div class="col-lg-3">
						<label for="timeout">Application Timeout</label>
						<div class="input-group">
							<input type="number"
								data-ng-model="company_apptimeout"
								placeholder="Enter Application Timeout"
							 class="form-control" id="timeout"> 
							<span class="input-group-addon" id="basic-addon1"><label>mins</label></span>
						</div>
					</div>
				</div>
				
				<div class="row">
				
				<div class="col-lg-12"><br><br></div>
				
					<div class="col-lg-12">
						<div class="form-group text-center">
						
	     		 		 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<button type="submit"   class="btn btn-success "><label><i class="fa fa-floppy-o" aria-hidden="true"></i>
						Save & Update</label></button>
						</div>
					</div>
				</div>
				
			</div>


		</form>

		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->

<!--====================================================== SCRIPTS START=========================================-->
	<script>
		$('.drawerOpen').click(function() {
			$('.overlay').removeClass('hideme');
			$('.drawer').removeClass('hideme');
			$('body').addClass('scrollHidden');
			animationOpenClick('.drawer', 'bounceInRight');
		});

		$('.drawerClose').click(function() {
			$('.overlay').addClass('hideme');
			$('.drawer').addClass('hideme');
		});
	</script>
	 
	
	<script type="text/javascript" src="resources/custom/js/CompanySetting/company_setting_control.js"></script>
	
	<script type="text/javascript" src="resources/custom/js/CompanySetting/company_setting_service.js"></script>

<!--====================================================== SCRIPTS END =========================================-->
</body>
</html>