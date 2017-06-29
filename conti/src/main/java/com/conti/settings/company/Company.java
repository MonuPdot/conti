package com.conti.settings.company;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonManagedReference;
import org.codehaus.jackson.annotate.JsonProperty;

import com.conti.setting.usercontrol.User;

/**
 * @Project_Name conti
 * @Package_Name com.conti.settings.company  com.conti.settings.company
 * @File_name Company.java com.conti.settings.company
 * @author Monu.C
 * @Created_date_time Jun 22, 2017 3:20:24 PM
 */

@Entity
@Table(name="a_generalsetting")
@JsonIgnoreProperties(ignoreUnknown=true)
public class Company {
	
	private int company_id,expct_deliverydate,company_apptimeout,created_by,updated_by,company_city;
	private String company_name,company_address1,company_address2,company_location,
	company_state,company_country,
	company_pincode,TIN_number,GST_number,company_email;
	private  byte[] company_logo;
	private String created_datetime,updated_datetime;
	private float Tax_GST;
	private long company_landlineno,company_alternateno;
	


	public Company() {
	}
	//======================one to one mapping=============================
/*	@OneToOne
	@JsonProperty("created_by")
	@JsonBackReference(value="userid")
	@JoinColumn(name="created_by")
	private User userCreatedBy;
	
	public User getUserCreatedBy() {
		return this.userCreatedBy;
	}


	public void setUserCreatedBy(User userCreatedBy) {
		this.userCreatedBy = userCreatedBy;
	}

	@OneToOne	
	@JsonProperty("created_by")
	@JsonBackReference(value="userid")
	@JoinColumn(name="updated_by")
	private User userUpdatedBy;
	

	
	public User getUserUpdatedBy() {
		return this.userUpdatedBy;
	}
	
	public void setUserUpdatedBy(User userUpdatedBy) {
		this.userUpdatedBy = userUpdatedBy;
	}*/
	//====================================================================
	@Id
	/*@GeneratedValue*/
	@Column(name="company_id")
	
	public int getCompany_id() {
		return this.company_id;
	}
	 
	@Column(name="created_by")
	public int getCreated_by() {
		return this.created_by;
	}


	@Column(name="updated_by")
	public int getUpdated_by() {
		return this.updated_by;
	}


	@Column(name="expct_deliverydate")
	
	public int getExpct_deliverydate() {
		return this.expct_deliverydate;
	}
	
	@Column(name="company_apptimeout")
	
	public int getCompany_apptimeout() {
		return this.company_apptimeout;
	}
	
	@Column(name="company_landlineno")
	public long getCompany_landlineno() {
		return this.company_landlineno;
	}
	
	
	@Column(name="company_alternateno")
	public long getCompany_alternateno() {
		return this.company_alternateno;
	}



	@Column(name="company_name")
	
	public String getCompany_name() {
		return this.company_name;
	}
	
	@Column(name="company_address1")
	
	public String getCompany_address1() {
		return this.company_address1;
	}
	
	@Column(name="company_address2")
	
	public String getCompany_address2() {
		return this.company_address2;
	}
	
	@Column(name="company_location")
	
	public String getCompany_location() {
		return this.company_location;
	}
	
	
	@JsonProperty("company_city")
	@Column(name="company_city")
	public int getCompany_city() {
		return this.company_city;
	}

	@Column(name="company_state")
	
	public String getCompany_state() {
		return this.company_state;
	}
	
	@Column(name="company_country")
	
	public String getCompany_country() {
		return this.company_country;
	}
	
	@Column(name="company_pincode")
	
	public String getCompany_pincode() {
		return this.company_pincode;
	}
	
	@Column(name="TIN_number")
	
	public String getTIN_number() {
		return this.TIN_number;
	}
	
	@Column(name="GST_number")
	
	public String getGST_number() {
		return this.GST_number;
	}
	
	@Column(name="company_email")
	
	public String getCompany_email() {
		return this.company_email;
	}
	
	@Column(name="company_logo")
	
	public byte[] getCompany_logo() {
		return this.company_logo;
	}
	
	@Column(name="created_datetime")
	public String getCreated_datetime() {
		return this.created_datetime;
	}
	
	@Column(name="updated_datetime")
	public String getUpdated_datetime() {
		return this.updated_datetime;
	}

	
	@Column(name="Tax_GST")
	
	public float getTax_GST() {
		return this.Tax_GST;
	}
	
	



	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}
	public void setExpct_deliverydate(int expct_deliverydate) {
		this.expct_deliverydate = expct_deliverydate;
	}
	public void setCompany_apptimeout(int company_apptimeout) {
		this.company_apptimeout = company_apptimeout;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public void setCompany_address1(String company_address1) {
		this.company_address1 = company_address1;
	}
	public void setCompany_address2(String company_address2) {
		this.company_address2 = company_address2;
	}
	public void setCompany_location(String company_location) {
		this.company_location = company_location;
	}
	public void setCompany_city(int company_city) {
		this.company_city = company_city;
	}
	public void setCompany_landlineno(long company_landlineno) {
		this.company_landlineno = company_landlineno;
	}
	public void setCompany_alternateno(long company_alternateno) {
		this.company_alternateno = company_alternateno;
	}
	public void setCompany_state(String company_state) {
		this.company_state = company_state;
	}
	public void setCompany_country(String company_country) {
		this.company_country = company_country;
	}
	public void setCompany_pincode(String company_pincode) {
		this.company_pincode = company_pincode;
	}
	public void setTIN_number(String tIN_number) {
		this.TIN_number = tIN_number;
	}
	public void setGST_number(String gST_number) {
		this.GST_number = gST_number;
	}
	public void setCompany_email(String company_email) {
		this.company_email = company_email;
	}
	public void setCompany_logo(byte[] company_logo) {
		this.company_logo = company_logo;
	}
	public void setCreated_datetime(String created_datetime) {
		this.created_datetime = created_datetime;
	}
	public void setUpdated_datetime(String updated_datetime) {
		this.updated_datetime = updated_datetime;
	}
	public void setTax_GST(float tax_GST) {
		this.Tax_GST = tax_GST;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}
	public void setUpdated_by(int updated_by) {
		this.updated_by = updated_by;
	}

	
}
