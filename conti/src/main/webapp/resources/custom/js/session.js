/**
 * @Project_Name conti
 * @Package_Name resources/custom/js
 * @File_name session.js
 * @author Sankar
 * @Updated_user Monu.C
 * @Created_date_time Jun 21, 2017 8:05:17 PM
 * @Updated_date_time Jun 21, 2017 8:05:17 PM 
 */


//------------------------- CSRF begin ---------------------------------- //	
	 function getCsrfHeader() {
		 
		 var csrfToken = $("input[name='_csrf']").val();
	
		 var headers = {}; 
		 headers["X-CSRF-TOKEN"] = csrfToken;
		 headers["_csrf"] = csrfToken;
		 
		 return headers;
	 }; 	
	 //------------------------- CSRF end ---------------------------------- //
	 
	 
	
	 
// ------------------------ track Session ------------------------------------------------ // 
 		
		var valid = false;
		
		function force_logout () {
	 		
	 		 var token = $("meta[name='_csrf']").attr("content");
	 		 var header = $("meta[name='_csrf_header']").attr("content");
	 		 alert("call force_logout");
	 		 $.ajax({
	 		        url : 'logout',
	 		        type : 'POST',
	 		        data: token,
	 		        beforeSend:function(xhr){
	 		             xhr.setRequestHeader(header, token);
	 		        },
	 		        success : function(data) { 
	 		        	window.location ="http://localhost:8080/Conti/login?logout";    
	 		        }, 
	 		        error : function(data) {
	 		            console.log(data);
	 		        }
	 		    });
	 	} 

//		 window.onload = function (e) {
//			
//			  console.log(e);
//		  }
		 
			window.onbeforeunload = function(e) {	
				console.log(e);
				
	 	        if( !valid ){
	 	        	force_logout();
	 	        }
	 	       } 
			 
			$("button").on("click", function() {
		 		  valid = true;			
		 		}); 
			
			$("tr").on("dblclick", function() {
		 		  valid = true;			
		 		});
	 	
	 	  $("a").bind("click", function() {
	 		  valid = true;			
	 		}); 
	 	  
	 		  $(document.body).on("keydown", this,
	 		     function (event) {
	 			  
	 		        if (event.keyCode == 116) { valid = true; } 
	 		        if( event.keyCode == 82 && event.ctrlKey) { valid = true; } 
	 		        if( event.keyCode == 82 && event.ctrlKey && event.shiftKey ) { valid = true; }
	 		});
			
	 		 function setValidtrue(){
	 			 valid = true;
}