package com.conti.userlog;

/**
 * @Project_Name conti
 * @Package_Name com.conti.userlog
 * @File_name UserLogDao.java
 * @author Sankar
 * @Created_date_time Jun 27, 2017 3:43:37 PM
 * @Updated_date_time Jun 27, 2017 3:43:37 PM
 */
public interface UserLogDao {
	
	public void saveorupdate(UserLogModel userLogModel);
	public UserLogModel passwordResetConf(int user_id, String link);
}
