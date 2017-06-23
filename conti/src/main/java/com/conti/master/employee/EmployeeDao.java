package com.conti.master.employee;

import java.util.List;

/**
 * @Project_Name conti
 * @Package_Name com.conti.master.employee
 * @File_name EmployeeDao.java
 * @author Sankar
 * @Created_date_time Jun 22, 2017 4:31:53 PM
 * @Updated_date_time Jun 22, 2017 4:31:53 PM
 */
public interface EmployeeDao {
	
	public List<EmployeeMaster> getEmployee(int branch_id, String empcategory);
}
