package com.conti.master.employee;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.conti.setting.usercontrol.User;

/**
 * @Project_Name conti
 * @Package_Name com.conti.master.employee
 * @File_name EmployeeDaoImp.java
 * @author Sankar
 * @Created_date_time Jun 22, 2017 4:39:08 PM
 * @Updated_date_time Jun 22, 2017 4:39:08 PM
 */
@Repository
public class EmployeeDaoImp implements EmployeeDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	/* (non-Javadoc)
	 * @see com.conti.master.employee.EmployeeDao#getEmployee()
	 */
	
	@Override
	@Transactional
	public List<EmployeeMaster> getEmployee(int branch_id, String empcategory) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<EmployeeMaster> listemp = (List<EmployeeMaster>) sessionFactory.getCurrentSession()
				.createQuery("from EmployeeMaster WHERE branch_id = " + branch_id + " AND empcategory = '" + empcategory + "'").list();
		return listemp;
		
		/*String queryString = "FROM EmployeeMaster WHERE branch_id = " + branch_id + " AND empcategory = '" + empcategory + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(queryString);
		
		@SuppressWarnings("unchecked")
		List<EmployeeMaster> listemp = (List<EmployeeMaster>) query.list();
				
		return listemp;*/
	}
	
	@Override
	@Transactional
	public List<EmployeeMaster> getAllEmployees() {
		@SuppressWarnings("unchecked")
		List<EmployeeMaster> listEmployee = (List<EmployeeMaster>) sessionFactory.getCurrentSession()
				.createQuery("from EmployeeMaster where obsolete ='N' and active ='Y'").list();
		return listEmployee;
	}

	
	@Override
	@Transactional
	public void saveOrUpdate(EmployeeMaster employee) {
		sessionFactory.getCurrentSession().saveOrUpdate(employee);
	}
}
