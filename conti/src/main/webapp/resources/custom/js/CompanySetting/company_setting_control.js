

angular.module('contiApp').controller('companyController'
		,['$scope','CompanySettingService',function($scope,CompanySettingService){
	
	var self=this;
	


	self.company={
			    "company_id": 0,
			    "expct_deliverydate": 0,
			    "company_apptimeout": 0,
			    "company_landlineno": 0,
			    "company_alternateno": 0,
			    "updated_by": 0,
			    "created_by": 0,
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
			    "tax_GST": 0
			};
			

	
	self.submit=function submit(){
		
		if(self.company.company_id==0){
			console.log("Company New Record");
			CompanySettingService.addCompanySetting(self.company);			
		}else{
			console.log("Company Record Update");
			CompanySettingService.updateCompanySetting();
			
		}		
	}
	
	
}]);

