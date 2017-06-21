/**
 * sankarPdot
 */

contiApp.controller('UserController', ['$scope', 'UserService', function($scope, UserService) {
    var self = this;
    self.user={id:null,username:''};
    self.users=[];
    self.message = null;

	
	/*    self.submit = submit;
    self.edit = edit;
    self.remove = remove;
    self.reset = reset;*/
 
    self.findUsername = findUsername;
	
	 
    fetchAllUsers();
    
    function fetchAllUsers(){
        UserService.fetchAllUsers()
            .then(
            function(d) {
                self.users = d;
                
                console.log(d);
            },
            function(errResponse){
                console.error('Error while fetching Users');
            }
        );
    }
    
    
    function findUser(user, id){
        UserService.findUser(user, id)
            .then(
            fetchAllUsers,
            function(errResponse){
                console.error('Error while updating User');
            }
        );
    }
 
    function findUsername() {
    	UserService.findusername(self.user.username)
    		.then(
	    			function (response) {
	    				if(response != "") {
	    					if(response.obsolete == "SUPER_ADMIN") {
	    						self.message = "Kindly contact your technical person..!";
	    					} else if (response.obsolete == "ADMIN") {
	    						self.message = "Kindly check your mail..!";
	    					} else {
	    						self.message = "Kindly contact your manager..!";
	    					}
	    				} else {
	    					self.message = "User name does not match..!";
	    				}
	    				
	    			},
	    			function(errResponse) {
	    				console.log(errResponse);
	    			}
    			);
    }

 
}]);