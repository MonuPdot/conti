/**
 * MC6
 * 
 */
package com.conti.setting.usercontrol;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.conti.config.SessionListener;
import com.conti.master.employee.EmployeeDao;
import com.conti.master.employee.EmployeeMaster;
import com.conti.others.ConstantValues;
import com.conti.others.Loggerconf;
import com.conti.others.SendMailSMS;
import com.conti.others.UserInformation;

/**
 * @Project_Name conti
 * @Package_Name com.conti.setting.usercontrol
 * @File_name UserRestController.java
 * @author Sankar
 * @Created_date_time Jun 20, 2017 3:54:17 PM
 * @Updated_date_time Jun 20, 2017 3:54:17 PM
 */

@RestController
public class UserRestController {
	
	@Autowired
	private UsersDao usersDao;
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private EmployeeDao employeeDao;
	@Autowired
	private SendMailSMS sendMailSMS;
	
	Loggerconf loggerconf = new Loggerconf();
	ConstantValues constantVal = new ConstantValues();
	SessionListener sessionListener = new SessionListener();
	UserInformation userInformation;
	
	/* ------------------------- Retrieve all Users begin-------------------------------- */
	@RequestMapping( value = "/users/", method = RequestMethod.GET	)
	public ResponseEntity<List<User>> fetchAllUsers(HttpServletRequest request) {
		userInformation = new UserInformation(request);
		String username = userInformation.getUserName();		
		try {
			loggerconf.saveLogger(username, request.getServletPath(), ConstantValues.FETCH_SUCCESS, null);
			List<User> users = usersDao.list();
			if(users.isEmpty()) {
				return new ResponseEntity<List<User>> (HttpStatus.NO_CONTENT);
			} else {
				return new ResponseEntity<List<User>> (users, HttpStatus.OK);	
			}			
		} catch (Exception exception) {			
			loggerconf.saveLogger(username,  request.getServletPath(), ConstantValues.FETCH_NOT_SUCCESS, exception);
			return new ResponseEntity<List<User>> (HttpStatus.UNPROCESSABLE_ENTITY);
		}
				
	}
	/* ------------------------- Retrieve all Users end-------------------------------- */
	
	/* ------------------------- Retrieve single Users begin-------------------------------- */
	@RequestMapping( value = "/users/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<User> getUser(@PathVariable("id") int id, HttpServletRequest request) {
		userInformation = new UserInformation(request);
		String username = userInformation.getUserName();
		try {
			loggerconf.saveLogger(username, request.getServletPath(), ConstantValues.FETCH_SUCCESS, null);
			User user = usersDao.get(id);
			if(user == null) {
				return new ResponseEntity<User> (HttpStatus.NO_CONTENT);
			} else {
				return new ResponseEntity<User> (user, HttpStatus.OK);
			}			
		} catch (Exception exception) {
			loggerconf.saveLogger(username,  request.getServletPath(), ConstantValues.FETCH_NOT_SUCCESS, exception);
			return new ResponseEntity<User> (HttpStatus.UNPROCESSABLE_ENTITY);
		}		
	}
	/* ------------------------- Retrieve single Users end-------------------------------- */
	
	/* ------------------------- Create a User begin -------------------------------------  */
	@RequestMapping( value = "/create_user", method = RequestMethod.POST)
	public ResponseEntity<Void> createUser(@RequestBody User user, UriComponentsBuilder ucBuilder, HttpServletRequest request) {
		userInformation = new UserInformation(request);
		String username = userInformation.getUserName();
		try {			
			usersDao.saveOrUpdate(user);			
			HttpHeaders headers = new HttpHeaders();
	        headers.setLocation(ucBuilder.path("/users/{id}").buildAndExpand(user.getUser_id()).toUri());
	        loggerconf.saveLogger(username, request.getServletPath(), ConstantValues.SAVE_SUCCESS, null);
			return new ResponseEntity<Void> (headers, HttpStatus.CREATED);
			
		} catch (Exception exception) {
			loggerconf.saveLogger(username,  request.getServletPath(), ConstantValues.SAVE_NOT_SUCCESS, exception);
			return new ResponseEntity<Void> (HttpStatus.UNPROCESSABLE_ENTITY);
		}
		
	}
	/* ------------------------- Create a User end -------------------------------------  */
	
	/* ------------------------- Update a User begin -------------------------------------  */
	@RequestMapping( value = "/users/{id}", method = RequestMethod.PUT)
	public ResponseEntity<User> updateUser(@PathVariable("id") int id, @RequestBody User user, HttpServletRequest request) {
		userInformation = new UserInformation(request);
		String username = userInformation.getUserName();
		try {
			User currentUser = usersDao.get(id);
			if(currentUser == null) {
				return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
			} else {
				usersDao.saveOrUpdate(currentUser);
				loggerconf.saveLogger(username, request.getServletPath(), ConstantValues.SAVE_SUCCESS, null);
				return new ResponseEntity<User>(currentUser, HttpStatus.OK);
			}
		} catch(Exception exception) {
			loggerconf.saveLogger(username, request.getServletPath(), ConstantValues.SAVE_NOT_SUCCESS, exception);
			return new ResponseEntity<User> (HttpStatus.UNPROCESSABLE_ENTITY);
		}
		
		
	}
	/* ------------------------- Update a User end -------------------------------------  */
	
	/* ------------------------- Delete a User begin ----------------------------------- */
	@RequestMapping(value = "/users/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<User> deleteUser(@PathVariable("id") int id, HttpServletRequest request) {
		userInformation = new UserInformation(request);
		String username = userInformation.getUserName();
		try {
			User currentUser = usersDao.get(id);
			if(currentUser == null) {
				return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
			} else {
				usersDao.delete(id);
				loggerconf.saveLogger(username, request.getServletPath(), ConstantValues.DELETE_SUCCESS, null);
				return new ResponseEntity<User>(currentUser, HttpStatus.OK);
			}
		} catch (Exception exception) {
			loggerconf.saveLogger(username, request.getServletPath(), ConstantValues.DELETE_NOT_SUCCESS, exception);
			return new ResponseEntity<User> (HttpStatus.UNPROCESSABLE_ENTITY);
		}
		
	}	
	/* ------------------------- Delete a User end ----------------------------------- */
	
	/* --------------------------- Retrieve a User by username begin ------------------------ */
	@RequestMapping(value = "forgotPassword", method = RequestMethod.POST)
	public ResponseEntity<User> getUserbyusername(@RequestBody String username, UriComponentsBuilder ucBuilder) {
		
			User currentUser = usersDao.findByUserName(username);
			
			if(currentUser == null) {
				return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
			} else {
				Role userRole = roleDao.get(currentUser.getUser_id());
				if( userRole == null ) {
					return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
				} else {
					currentUser.setObsolete(userRole.getRole_Name());
					if(userRole.getRole_Name().equals(constantVal.ROLE_CUSER)) {					
						List<EmployeeMaster> listemp = employeeDao.getEmployee(currentUser.getBranch_id(), constantVal.ROLE_ADMIN);
						currentUser.setActive(String.valueOf(listemp.get(0).getEmp_phoneno()));
					} 
					if(userRole.getRole_Name().equals(constantVal.ROLE_ADMIN)){
						
						String[] mail_id = {currentUser.getEmployeeMaster().getEmp_email()};
						
						DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd/HH:mm:ss");
						Date date = new Date();
						
						System.out.println(dateFormat.format(date)); //2016/11/16 12:08:43
						
						UriComponents uri = UriComponentsBuilder
			                    .fromHttpUrl("http://localhost:8080/conti/{id}/{date}")
			                    .buildAndExpand(currentUser.getUser_id(), dateFormat.format(date).toString());
						String urlString = uri.toUriString();
						
						System.out.println(urlString);
						sendMailSMS.send_Mail(mail_id, "Conti - Admin Password reset", urlString);
					}

					return new ResponseEntity<User>(currentUser, HttpStatus.OK);
				}			
			}
				
	}
	
	/* --------------------------- Retrieve a User by username end ------------------------ */
	
	
}

