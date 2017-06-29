package com.conti.settings.company;


import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import com.conti.config.SessionListener;
import com.conti.others.ConstantValues;
import com.conti.others.Loggerconf;

/**
 * @Project_Name conti
 * @Package_Name com.conti.settings.company
 * @File_name CompanyController.java
 * @author Sakthi
 * @Created_date_time Jun 20, 2017 2:21:39 PM
 * @Updated_date_time Jun 20, 2017 2:21:39 PM
 */

@RestController
public class CompanyController {

	@Autowired
	private CompanySettingDAO companyDao;


	
	Loggerconf loggerconf = new Loggerconf();
	SessionListener sessionListener = new SessionListener();
	final Logger logger = LoggerFactory.getLogger(CompanyController.class);
	
	//=================Company setting page=====================================
	@RequestMapping(value =  "company_settings", method = RequestMethod.GET)
	public ModelAndView adminPage(HttpServletRequest request)  {
		String username =request.getUserPrincipal().getName();				
		ModelAndView model = new ModelAndView();		
		try{
			loggerconf.saveLogger(username, request.getServletPath(), ConstantValues.FETCH_SUCCESS, null);			
			model.addObject("title", "Company Settings");
			model.addObject("message", "This page is for ROLE_ADMIN only!");
			model.setViewName("Settings/company_settings");			
		} catch (Exception exception) {
			loggerconf.saveLogger(username,  "Admin / ", ConstantValues.LOGGER_STATUS_E, exception);
		}		
		return model;
	}

	//=================Retrieve company details=====================================
	@RequestMapping(value="/company/{id}",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Company> getCompanyDetail(HttpServletRequest request,@PathVariable("id") long id){
		
		Company company=companyDao.getById((int) id);
		if(company==null){
			loggerconf.saveLogger(request.getUserPrincipal().getName(), request.getServletPath(), ConstantValues.FETCH_NOT_SUCCESS, null);
			return new ResponseEntity<Company>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Company>(company,HttpStatus.OK);
	}
	
	//=================Create company details=====================================
	@RequestMapping(value="/companySave" ,method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Void> saveCompanyDetail(@RequestBody Company company,HttpServletRequest request,UriComponentsBuilder ucBuilder){
		
		System.out.println("++inside company");
		try {
			companyDao.saveOrUpdate(company);
			loggerconf.saveLogger(request.getUserPrincipal().getName(), request.getServletPath(), ConstantValues.SAVE_SUCCESS, null);
		} catch (Exception e) {
			loggerconf.saveLogger(request.getUserPrincipal().getName(), request.getServletPath(), ConstantValues.SAVE_NOT_SUCCESS,e);
			e.printStackTrace();
		}
		
		HttpHeaders headers=new HttpHeaders();
		headers.setLocation(ucBuilder.path("/company/{id}").buildAndExpand(company.getCompany_id()).toUri());
		return new ResponseEntity<Void>(headers,HttpStatus.CREATED);
		
	}
}