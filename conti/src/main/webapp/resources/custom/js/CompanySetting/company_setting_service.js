/**
 * @Project_Name conti
 * @Package_Name resources/custom/js
 * @File_name company_setting_service.js
 * @author Monu.c
 * @Created_date_time Jun 21, 2017 7:20:17 PM
 * @Updated_date_time Jun 21, 2017 7:20:17 PM
 * 
 */


angular.module('contiApp').factory('CompanySettingService',['$http','$q',function($http,$q){
	
	var COMPANY_SETTING_REST_URL="http://localhost:8080/Conti/company_settings/";
	

	var factory={
			fetchCompanySetting:fetchCS,
			addCompanySetting:addCS,
			updateCompanySetting:updateCS
	};
	
	return factory;
	
	
	//=============================fetch company settings====================================
	function fetchCS(){
		
	}
	
	//=============================add company settings====================================
	function addCS(company,header){

		var deferred=$q.defer();
		
		console.log(getHeader());
		
		$http({
			  method: 'POST',
			  url: 'companySave',
			  data:company,
			  headers:getHeader()
			})
		.then(
		function(response){
			deferred.resolve(response.data);
		},
		function(errResponse){
			console.error('Error creating company detail');
			deferred.reject(errResponse);
		});
		 return deferred.promise;
	}
	//=============================update company settings====================================
	function updateCS(){
		
	}
	
	function getHeader(){
		 
		 var csrfToken = $("input[name='_csrf']").val();

		 var headers = {}; 
		 headers["X-CSRF-TOKEN"] = csrfToken;
		 headers["_csrf"] = csrfToken;
		 
		 return headers;
	}; 
	
	
}]);

