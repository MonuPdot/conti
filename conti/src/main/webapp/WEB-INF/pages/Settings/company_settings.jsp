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

	
</head>


<body style="overflow-x: hidden;"  data-ng-app="contiApp">


	<jsp:include page="../Dashboard/nav.jsp" />

	<div id="wrapper" data-ng-controller="companyController as comctrl" >
		<div id="page-wrapper"  >

		<form data-ng-submit="comctrl.submit()"  >
 
			<input type="hidden" data-ng-model="comctrl.company.company_id"/>
			
			
			<div class="panel panel-default panelMarginBottom">
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
							<label for="companyName">Company Name<span style="color:red">&nbsp;*</span></label> 
							<input type="text" 
									data-trigger="focus" data-toggle="popover"
									data-placement="top" data-content="Please Enter Company Name"
									class="form-control" placeholder="Enter Company Name"
									id="companyName" maxlength="30"
									onKeyPress="return CheckIsCharacterWithspace(event,this.value)"
									data-ng-model="comctrl.company.company_name">
							</div>
						
						<div class="form-group">
							<label for="address1">Address Line 1<span style="color:red">&nbsp;*</span></label>
							 <input
							  data-ng-model="comctrl.company.company_address1"
							  type="text"
							  id="address1"
							  placeholder="Enter Address"
					          class="form-control" 
					          onKeyPress="return CheckIsAlphaNumericWithspace(event,this.value)"
					          maxlength="100"
					          >
						</div>
						
					</div>


					<div class="col-lg-6">

						<div class="col-lg-12 noPaddingLeft">
							<label for="companyImage">Company Logo</label>
						</div>

						<div class="col-lg-6 noPaddingLeft">
						<!-- 	<img data-ng-src="resources/Image/images.png" 
								id="companyImage" 
								alt="pic_mountain.jpg" id="companyImage" 
								style="width: 105px; height: 105px;"> -->
								<img data-ng-src="data:image/JPEG;base64,{{comctrl.company.company_logo}}" 
								id="companyImage" 
								onerror="this.src='resources/Image/images.png'"
								id="companyImage" 
								style="width: 105px; height: 105px;">
								
								<img ng-src="{{image_source}}"
								id="companyImageHide" 
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
							<button type="button" 
								style="visibility: hidden;"
								data-ng-click = "comctrl.uploadFile()">upload me</button>	
							</div>

							<input 
							id="image"
							 type="file"
							 demo-file-model="myFile" 	
							 accept="image/*"	
							 onchange="angular.element(this).scope().setFile(this)"				 
							 class="btn btn-default" name="Browse">
						</div>

					</div>		
					
				</div>

		


				<div class="row">
					<div class="col-lg-6">
						<div class="form-group">
							<label for="address2">Address Line 2</label> 
							<input 
							id="address2"
							data-ng-model="comctrl.company.company_address2"
							placeholder="Enter Address"
							type="text"
							class="form-control"
					          onKeyPress="return CheckIsAlphaNumericWithspace(event,this.value)"
					          maxlength="100">
						</div>
					</div>
					<div class="col-lg-6">
					<div class="form-group">
							<label for="tinNo">TIN No <span style="color:red">&nbsp;*</span></label> 
							<input
							 data-ng-model="comctrl.company.tin_number"
							 type="text" id="tinNo"
							 placeholder="Enter Tin Number"
							 class="form-control"
							  onKeyPress="return CheckIsAlphaNumericWithspace(event,this.value)"
							  maxlength="20">
						</div>
					</div>

				</div>


				<div class="row">
					<div class="col-lg-6">
						<div class="form-group">
							<label for="location">Location<span style="color:red">&nbsp;*</span></label> 
							<input 
							    data-ng-model="comctrl.company.company_location"
							    placeholder="Enter Location"
								type="text"
								onKeyPress="return CheckIsAlphaNumericWithspace(event,this.value)"
								maxlength="50"
								class="form-control"
								id="location">
						</div>
					</div>
					
					<div class="col-lg-6">
						<div class="form-group">
							<label for="gstNo">GST No</label>
							 <input type="text"
							 id="gstNo"
							 data-ng-model="comctrl.company.gst_number"
							 placeholder="Enter GST Number"
							 class="form-control"
							onKeyPress="return CheckIsAlphaNumericWithspace(event,this.value)"
							maxlength="20">
						</div>
					</div>

				</div>

				<div class="row">
					<div class="col-lg-3">
						<div class="form-group">
							<label for="city">City<span style="color:red">&nbsp;*</span></label> 
							<select 
								data-ng-model="comctrl.company.selectedAddress"
								class="form-control" 
								id="city"
								data-ng-change="updateCountryAndState()"
								data-ng-options="  x.city for x in comctrl.addresses | orderBy:'city'  track by x.id" 
								>
								<option value="">--Select City --</option>
		 					 	</select>
		 						<input type="text" 
		 						data-ng-hide="true"
								data-ng-model="comctrl.company.company_city"
								class="form-control" 
								id="city"
								onKeyPress="return CheckIsAlphaNumericWithspace(event,this.value)"/> 
							
		 					 	
						</div>
					</div>
					<div class="col-lg-3">	
						<div class="form-group">
							<label for="state">State<span style="color:red">&nbsp;*</span></label>
							 <input type="text"
							 data-ng-model="comctrl.company.company_state"
							 placeholder="Enter State"
							 onKeyPress="return CheckIsAlphaNumericWithspace(event,this.value)"
							maxlength="50"
							class="form-control disabled" id="state">
						</div>
						
						
					</div>
						<div class="col-lg-3">
						<div class="form-group">
							<label for="landline">Landline<span style="color:red">&nbsp;*</span></label>
							 <input type="text"
							 data-ng-model="comctrl.company.company_landlineno"
							 placeholder="Enter Landline Number"
							 maxlength="12"
							 onKeyPress="return CheckIsNumeric(event)"
							 class="form-control" id="landline">
						</div>
					</div>
					<div class="col-lg-3">
						<div class="form-group">
							<label for="altNo">Alternate Number<span style="color:red">&nbsp;*</span></label> 
							<input type="text"
							maxlength="12
							onKeyPress="return CheckIsNumeric(event)"
							data-ng-model="comctrl.company.company_alternateno"
							placeholder="Enter Alternate Number"
							class="form-control" id="altNo">
						</div>
					</div>

				</div>


				<div class="row">
					<div class="col-lg-3">
						<div class="form-group">
							<label for="country">Country<span style="color:red">&nbsp;*</span></label> 
							<input type="text"
							data-ng-model="comctrl.company.company_country"
							placeholder="Enter Country"
							class="form-control disabled" id="country"
							onKeyPress="return CheckIsAlphaNumericWithspace(event,this.value)"
							maxlength="50">
						</div>
					</div>
					<div class="col-lg-3">
						<div class="form-group">
							<label for="pincode">Pincode<span style="color:red">&nbsp;*</span></label>
							 <input type="text"
							 	data-ng-model="comctrl.company.company_pincode"
							 	placeholder="Enter Pincode"
							 	onKeyPress="return CheckIsNumericAndHyphen(event,this.value)"
								maxlength="50"
								class="form-control" id="pincode">
						</div>
					</div>
					<div class="col-lg-6">
						<div class="form-group">
							<label for="email">Email<span style="color:red">&nbsp;*</span></label> 
							<input type="email"
							data-ng-model="comctrl.company.company_email"
							placeholder="Enter Email"
							maxlength="60"
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
							<label for="gstPer">Tax GST%<span style="color:red">&nbsp;*</span></label> 
							<input type="text"
								data-ng-model="comctrl.company.tax_GST"
								placeholder="Enter GST%"
								class="form-control" id="gstPer"
								onKeyPress="return CheckIsNumericAnddot(event,this.value)"
								maxlength="5">
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-3">
						<div class="form-group">
							<label for="email">No.of.days for Delivery<span style="color:red">&nbsp;*</span></label>
							 <input type="number"
							 data-ng-model="comctrl.company.expct_deliverydate"
							 placeholder="Enter No.of.days for Delivery"
							 onKeyPress="return CheckIsNumeric(event)"
							 maxlength="5"
							 class="form-control" id="email">
						</div>
					</div>
					<div class="col-lg-3">
						<label for="timeout">Application Timeout<span style="color:red">&nbsp;*</span></label>
						<div class="input-group">
							<input type="number"
								data-ng-model="comctrl.company.company_apptimeout"
								placeholder="Enter Application Timeout"
							    class="form-control" id="timeout"
							 	onKeyPress="return CheckIsNumericAnddot(event,this.value)"
								maxlength="5"> 
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
		
		    $('[data-toggle="popover"]').popover();
		
	</script>

	<script type="text/javascript" src="resources/custom/js/validation.js"></script>
	<script type="text/javascript" src="resources/custom/js/CompanySetting/company_setting_directive.js"></script>
	<script type="text/javascript" src="resources/custom/js/CompanySetting/company_setting_service.js"></script>
	<script type="text/javascript" src="resources/custom/js/Address/address_service.js"></script>
	<script type="text/javascript" src="resources/custom/js/CompanySetting/company_setting_control.js"></script>
	
   <!--====================================================== SCRIPTS END =========================================-->
</body>
</html>