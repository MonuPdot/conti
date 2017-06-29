




angular.module('contiApp').controller('companyController'
		,['$scope','CompanySettingService','AddressService',function($scope,CompanySettingService,AddressService){
			
			var self=this;
		
   self.addresses=[];
			
	self.address={
			    "id": 0,
			    "state": null,
			    "country": null,
			    "cityCode": null,
			    "city": null,
			    "stateCode": null,
			    "countryCode": null,
			    "active": null,
			    "obsolete": null
			}		
			
	self.company={
			    "company_id": null,
			    "expct_deliverydate":null ,
			    "company_apptimeout": null,
			    "company_landlineno": null,
			    "company_alternateno": null,
			    "updated_by": null,
			    "created_by": null,
			    "company_name": null,
			    "company_address1": null,
			    "company_address2": null,
			    "company_location": null,
			    "company_city": null,
			    "company_state": null,
			    "company_country": null,
			    "company_pincode": null,
			    "company_email": null,
			    "company_logo": null,
			    "created_datetime": null,
			    "updated_datetime": null,
			    "tin_number": null,
			    "gst_number": null,
			    "tax_GST": null
			    
			};
	
	
	$('#companyImageHide').hide();
    $('#companyImage').show();
	  
	$scope.setFile = function(element) {
		  $scope.currentFile = element.files[0];
		   var reader = new FileReader();

		  reader.onload = function(event) {
			$('#companyImageHide').show();
			$('#companyImage').hide();
		    $scope.image_source = event.target.result
		    $scope.$apply()

		  }
		  // when the file is read it triggers the onload event above.
		  reader.readAsDataURL(element.files[0]);
		}

	fetchCS();
	
	function fetchCS(){
		CompanySettingService.fetchCompanySetting(1)
	.then(
			function(d){
				console.log("fetching wit id success");
				console.log(d);
				if(d.status==200){
					console.log("fetched  wit id data"+d.data);
					self.company=d.data;
					
					for(var i = 0; i < self.addresses.length; i++) {
						if(self.company.company_city==self.addresses[i].id){
							self.company.selectedAddress=self.addresses[i];
						}
					}
					
				}else{
					console.log("no content for id");
				}
				
			},
			function(errResponse){
				console.log("error while fetching company")
			});
	}
	

	

	
	$scope.updateCountryAndState=function updateCountryAndState(){
		console.log( self.company.selectedAddress);
		self.company.company_city=self.company.selectedAddress.id;
	    self.company.company_state=self.company.selectedAddress.state;
	    self.company.company_country=self.company.selectedAddress.country;
	}
	
	
	self.submit=function submit(){
		
		if(self.company.company_id==0){
			console.log("Company New Record");
		    CompanySettingService.addCompanySetting(self.company, $scope.myFile,"fileUpload")
		    .then(
					function(d){						
						fetchCS();						
					},
					function(errResponse){
						console.log("error while fetching company")
					});
		}else{
			console.log("Company Record Update");
		    CompanySettingService.addCompanySetting(self.company, $scope.myFile,"fileUpload")
		    .then(
					function(d){						
						fetchCS();					
					},
					function(errResponse){
						console.log("error while fetching company")
					});
		}	
	/*	
		  if($("#image").val().length){	
  			self.uploadFile();
  		}else{
  			console.log("file not available");
  		}
        */
		
		
	}
	
	//=============================fileUpload====================================
	self.uploadFile=function uploadFile(){
		console.log("uploadFile");
		  var file = $scope.myFile;
          
          console.log('file is ' );
          console.dir(file);
          
          var uploadUrl = "fileUpload";
          var promise= CompanySettingService.uploadFileToUrl(file, uploadUrl);
         
          promise.then(function (response) {
              $scope.serverResponse = response;
          }, function () {
              $scope.serverResponse = 'An error has occurred';
          })   
	}
	

	//=============================fetch Address====================================
	//AddressService
	fetchAddressDetail();
	
	function fetchAddressDetail(){
		
		AddressService.fetchAddress()
		.then(function(response){
			self.addresses=response;
			console.log(self.addresses);
			
			
			for(var i = 0; i < self.addresses.length; i++) {
				if(self.company.company_city==self.addresses[i].id){
					self.company.selectedAddress=self.addresses[i];
				}
			}
			
		},
		function(errRes){
			console.log("error Fetchng address");
		});
		
	}


	
}]);

