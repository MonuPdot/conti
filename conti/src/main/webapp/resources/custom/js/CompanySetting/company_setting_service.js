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
			fetchCompanySetting:fetchCompanyWithId,
			addCompanySetting:addCS,
			updateCompanySetting:updateCS,
			uploadFileToUrl:uploadFileToUrl
	};
	
	return factory;
	
	
	//=============================fileUpload====================================
	function uploadFileToUrl(file, uploadUrl){

		console.log('uploading');
		console.log(uploadUrl);
	  
		var fd = new FormData();
        fd.append('file', file);
     
		
		$http({
			  method: 'POST',
			  url: uploadUrl,
			  data:fd,
			  transformRequest: angular.identity,
			  headers:getHeaderWithContentType()
			})
		.then(
				function(response){
					console.log('upload done');
					console.log(response.data);
				},
				function(errResponse){
					console.log('upload error');
					console.log(errResponse.data);
				}
		);
                      
	}
	
	
	
	//=============================fetch company settings====================================
	function fetchCompanyWithId(id){
		var deferred =$q.defer();
		$http.get("company/"+id)
		.then(
				function(response){
					console.error(" fetched company");
					deferred.resolve(response);
				},
				function(errResponse){
					console.error("error while fetching company");
					deferred.reject(errResponse);					
				}
				);	
		return deferred.promise;
	}
	
	//=============================add company settings====================================
	function addCS(company,file,uploadUrl){

		var deferred=$q.defer();
		
		console.log(company);
		
		$http({
			  method: 'POST',
			  url: 'companySave',
			  data:company,
			  headers:getHeader()
			})
		.then(
		function(response){
			
			console.log(response.data);
			 if($("#image").val().length){	
				 uploadFileToUrl(file, uploadUrl);
				 console.log("file available");
			 }else{
				 console.log("file not available");
			 }
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
	
	
	function getHeaderWithContentType(){
		 
		 var csrfToken = $("input[name='_csrf']").val();

		 var headers = {}; 
		 headers["X-CSRF-TOKEN"] = csrfToken;
		 headers["_csrf"] = csrfToken;
		 headers["Content-Type"] = undefined;
		 
		 return headers;
	}; 
}]);

