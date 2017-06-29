/**
 * @Project_Name conti
 * @Package_Name custom js employee_control.js
 * @File_name employee_control.js
 * @author Sankar
 * @Updated_user Sankar
 * @Created_date_time Jun 26, 2017 12:59:17 PM
 * @Updated_date_time Jun 26, 2017 12:59:17 PM
 */

contiApp.controller('EmployeeController', ['$scope', 'EmployeeService', function($scope, EmployeeService){
	
	var self = this;
	self.employees = [];
	
	self.employee = {
			   emp_id : null,
			   branch_id : 1,
			   update_by : 1,
			   created_by : 1,
			   emp_name : "ss",
			   emp_code : "ds",
			   empcategory : "cd",
			   emp_address : "dddd",
			   emp_email : "rm",
			   created_datetime : "da",
			   updated_datetime : "da",
			   obsolete : "N",
			   active : "Y"
			};
	self.submit = submit;
	self.empmsg = "helloooooo";
	//-------------------------- Fetch Allo Employees begin ---------------------//
	fetchAllEmployees();
	
	function fetchAllEmployees() {
		EmployeeService.fetchAllEmployees()
			.then(
					function (d) {
						self.employees = d;
						console.log(d);						
					}, 
					function (errResponse) {
						console.log('Error while fetching employees');
					}
				);
	}
	//-------------------------- Fetch Allo Employees end ---------------------//
	
	
    function createEmployee(employee){
    	EmployeeService.createEmployee(employee)
            .then(
            fetchAllEmployees,
            function(errResponse){
                console.error('Error while creating User');
            }
        );
    } 
    
    function submit() {
    	
    	
    	createEmployee(self.employee);
    }
}]);