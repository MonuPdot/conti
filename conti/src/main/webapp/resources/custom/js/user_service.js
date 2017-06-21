/**
 * @Project_Name conti
 * @Package_Name custom js user_service.js
 * @File_name user_service.js
 * @author Sankar
 * @Updated_user Sankar
 * @Created_date_time Jun 21, 2017 8:24:17 PM
 * @Updated_date_time Jun 20, 2017 3:24:17 PM
 */
contiApp.factory('UserService', ['$http', '$q', function($http, $q){
 
    var REST_SERVICE_URI = 'http://localhost:8080/Conti/users/';
 
    var factory = {
        fetchAllUsers: fetchAllUser,
        findUser: findUser,
        findusername : findUserbyName
    };
 
    return factory;
    
    
	//------------------------- CSRF begin ---------------------------------- //	
	 function getCsrfHeader() {
		 
		 var csrfToken = $("input[name='_csrf']").val();
	
		 var headers = {}; 
		 headers["X-CSRF-TOKEN"] = csrfToken;
		 headers["_csrf"] = csrfToken;
		 
		 return headers;
	 };
	 
	 //------------------------- CSRF end ---------------------------------- //

	 
	 
    //----------------------  Fetch All users begin ----------------------------- //
    function fetchAllUser() {
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while fetching Users');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    //----------------------  Fetch All users end ----------------------------- //
    
    //----------------------  Find user by user id with PUT begin ----------------------------- //    
    function findUser(user, id) {
        var deferred = $q.defer();
        $http.put(REST_SERVICE_URI+id, user)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while updating User');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    //----------------------  Find user by user id with PUT end ----------------------------- // 
    
  //----------------------  Find user by user name begin ----------------------------- //
    function findUserbyName(username) {
    	var deferred = $q.defer();
    	var headers = getCsrfHeader();
    	
    	$http({
    		method : 'POST',
    		url : 'forgotPassword',
    		data : username,
    		headers : headers
    	})
    	.then(
    			function (response) {    				
    				deferred.resolve(response.data);
    			},
    			function (errResponse) {
    				deferred.reject(errResponse);
    			}
    		);
    		return deferred.promise;
    }
    

  //----------------------  Find user by user name begin ----------------------------- //    
 
  //----------------------  Delete user by user id begin ----------------------------- //  
    function deleteUser(id) {
    	var deferred = $q.defer();
    	$http.delete(REST_SERVICE_URI+id)
    		.then(
    				function(response){
    					deferred.resolve(response.data);
    				},
    				function(errResponse) {
    					deferred.reject(errResponse);
    				}
    		);
    		return deferred.promise;
    }
    //----------------------  Delete user by user id end ----------------------------- //    
}]);