/**
 * @Project_Name conti
 * @Package_Name resources/custom/js
 * @File_name company_setting_service.js
 * @author Monu.c
 * @Created_date_time Jun 21, 2017 7:20:17 PM
 * @Updated_date_time Jun 21, 2017 7:20:17 PM
 * 
 */

ContiApp.factory('CompanySettingService',['$http','$q',function($http,$q){
	
	var COMPANY_SETTING_REST_URL="";
	
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
	function addCS(){
		
	}
	//=============================update company settings====================================
	function updateCS(){
		
	}
	
	
}]);