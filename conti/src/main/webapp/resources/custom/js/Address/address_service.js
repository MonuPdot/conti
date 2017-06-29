/**
 * @Project_Name conti
 * @Package_Name resources/custom/js
 * @File_name address_setting_service.js
 * @author Monu.c
 * @Created_date_time Jun 29, 2017 12:29:17 AM
 * @Updated_date_time Jun 29, 2017 12:29:17 AM
 * 
 */



angular.module('contiApp').factory('AddressService', ['$http', '$q', function($http, $q){

	var factory={
		fetchAddress:fetchAddress	
	};
	
	return factory;

	//=============================fileUpload====================================
	function fetchAddress(){
		var deferred=$q.defer();
		
		$http.get("Address")
		.then(
				function(response){
					deferred.resolve(response.data);
				},
				function(errResponse){
					deferred.reject(errResponse);
					console.log("error Fetchng address");
				}
				);
		return deferred.promise;
	}
	
	
}]);