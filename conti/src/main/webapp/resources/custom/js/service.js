/**
 * @Project_Name conti
 * @Package_Name resources/custom/js
 * @File_name service.js
 * @author Monu.c
 * @Created_date_time Jun 21, 2017 8:05:17 PM
 * @Updated_date_time Jun 21, 2017 8:05:17 PM 
 */

contiApp.factory('Service', ['$http', '$q', function($http, $q){
	
	//=============================get method====================================
	function get(URL,msg){
        var deferred = $q.defer();
        $http.get(URL)
            .then(
            function (response) {
            	 console.error("SUCCESS"+msg);
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error("ERROR"+msg);
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
	}
	
	//=============================put method====================================
	function put(URL,id,object,msg){
		var deferred = $q.defer();
        $http.put(URL+id, object)
            .then(
            function (response) {
            	 console.error("SUCCESS"+msg);
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error("ERROR"+msg);
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;	
	}
	
	//=============================post method====================================
	function post(URL,datas,msg){
		var deferred = $q.defer();
    	var headers = getCsrfHeader();
    	
    	$http({
    		method : 'POST',
    		url : URL,
    		data : datas,
    		headers : headers
    	})
    	.then(
    			function (response) {    
    				console.error("SUCCESS"+msg);
    				deferred.resolve(response.data);
    			},
    			function (errResponse) {
                    console.error("ERROR"+msg);
    				deferred.reject(errResponse);
    			}
    		);
    		return deferred.promise;	
	}
	
	//=============================delete method====================================
	function del(URL,datas,msg){
		var deferred = $q.defer();
    	$http.delete(URL+datas)
    		.then(
    				function(response){
        				console.error("SUCCESS"+msg);
    					deferred.resolve(response.data);
    				},
    				function(errResponse) {
                        console.error("ERROR"+msg);
    					deferred.reject(errResponse);
    				}
    		);
    		return deferred.promise;
	}
	
	
}]);