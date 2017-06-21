/**
 * @Project_Name conti
 * @Package_Name custom js user_control.js
 * @File_name user_control.js
 * @author Sankar
 * @Updated_user Sankar
 * @Created_date_time Jun 21, 2017 8:24:17 PM
 * @Updated_date_time Jun 20, 2017 3:24:17 PM
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

    //----------------------  Fetch All users begin ----------------------------- //    
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
    //----------------------  Fetch All users end ----------------------------- //    

    //----------------------  Find user by user id begin ----------------------------- //    
    function findUser(user, id){
        UserService.findUser(user, id)
            .then(
            fetchAllUsers,
            function(errResponse){
                console.error('Error while updating User');
            }
        );
    }
    //----------------------  Find user by user end ----------------------------- //
    
    //----------------------  Find user by user name begin ----------------------------- //    
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

    //----------------------  Find user by user name begin ----------------------------- //
    
    //----------------------  Delete user by user id begin ----------------------------- //
    
    function deleteUser(id) {
    	 UserService.deleteUser(id)
         .then(
         fetchAllUsers,
         function(errResponse){
             console.error('Error while deleting User');
         }
     );
    }
    
    //----------------------  Delete user by user id end ----------------------------- //    
}]);