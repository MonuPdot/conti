/**
 * MC6
 * 
 */
package com.conti.setting.usercontrol;

import java.util.List;

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
import org.springframework.web.util.UriComponentsBuilder;

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
	
	/* ------------------------- Retrieve all Users begin-------------------------------- */
	@RequestMapping( value = "/users/", method = RequestMethod.GET	)
	public ResponseEntity<List<User>> fetchAllUsers() {
		List<User> users = usersDao.list();
		if(users.isEmpty()) {
			return new ResponseEntity<List<User>> (HttpStatus.NO_CONTENT);
		} else {
			return new ResponseEntity<List<User>> (users, HttpStatus.OK);	
		}		
	}
	/* ------------------------- Retrieve all Users end-------------------------------- */
	
	/* ------------------------- Retrieve single Users begin-------------------------------- */
	@RequestMapping( value = "/users/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<User> getUser(@PathVariable("id") int id) {
		User user = usersDao.get(id);
		if(user == null) {
			return new ResponseEntity<User> (HttpStatus.NO_CONTENT);
		} else {
			return new ResponseEntity<User> (user, HttpStatus.OK);
		}
	}
	/* ------------------------- Retrieve single Users end-------------------------------- */
	
	/* ------------------------- Create a User begin -------------------------------------  */
	@RequestMapping( value = "/create_user", method = RequestMethod.POST)
	public ResponseEntity<Void> createUser(@RequestBody User user, UriComponentsBuilder ucBuilder) {
		usersDao.saveOrUpdate(user);
		HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/users/{id}").buildAndExpand(user.getUser_id()).toUri());
		return new ResponseEntity<Void> (headers, HttpStatus.CREATED);
	}
	/* ------------------------- Create a User end -------------------------------------  */
	
	/* ------------------------- Update a User begin -------------------------------------  */
	@RequestMapping( value = "/users/{id}", method = RequestMethod.PUT)
	public ResponseEntity<User> updateUser(@PathVariable("id") int id, @RequestBody User user) {
		
		User currentUser = usersDao.get(id);
		if(currentUser == null) {
			return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
		} else {
			usersDao.saveOrUpdate(currentUser);
			return new ResponseEntity<User>(currentUser, HttpStatus.OK);
		}
		
	}
	/* ------------------------- Update a User end -------------------------------------  */
	
	/* ------------------------- Delete a User begin ----------------------------------- */
	@RequestMapping(value = "/users/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<User> deleteUser(@PathVariable("id") int id) {
		User currentUser = usersDao.get(id);
		if(currentUser == null) {
			return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
		} else {
			usersDao.delete(id);
			return new ResponseEntity<User>(currentUser, HttpStatus.OK);
		}
	}	
	/* ------------------------- Delete a User end ----------------------------------- */
}

