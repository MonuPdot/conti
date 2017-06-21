/**
 * sankarPdot
 */

angular.module('myApp').controller('UserController', ['$scope', 'UserService', function($scope, UserService) {
    var self = this;
    self.user={id:null,username:'',address:'',email:''};
    self.users=[];
 
/*    self.submit = submit;
    self.edit = edit;
    self.remove = remove;
    self.reset = reset;*/
 

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
 

 
}]);