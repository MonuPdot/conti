package com.conti.others;



import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

/**
 * @Project_Name conti
 * @Package_Name com.conti.others
 * @File_name SendMailSMSImpl.java
 * @author Sankar
 * @Created_date_time Jun 23, 2017 2:34:59 PM
 * @Updated_date_time Jun 23, 2017 2:34:59 PM
 */
@Service("sendmailSMS")
public class SendMailSMSImpl implements SendMailSMS {

	
	Loggerconf loggerconf = new Loggerconf();
	ConstantValues constantVal = new ConstantValues();
	UserInformation userInformation;
	/* (non-Javadoc)
	 * @see com.conti.others.SendMailSMS#send_Mail()
	 */

	@Override
	public void send_Mail(String[] email, String subject, String message) {
		// TODO Auto-generated method stub
		
		Properties properties;
		Session session;
		MimeMessage mimeMessage;
		final int email_port = 587;
		properties = System.getProperties();
		properties.put("mail.smtp.port", email_port);
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		
		String[] to_mail =  email;
		String mail_subject = subject;
		String mail_body = message;
		
		String emailHost = "smtp.gmail.com";
		/*String fromUser = "pointdot2016@gmail.com";
		String fromUserEmailPassword = "pointdot@123";*/
		
		
		session = Session.getDefaultInstance(properties, null);
		mimeMessage = new MimeMessage(session);
		
		
		
		for(int i=0; i < to_mail.length; i++) {
			try {
				mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to_mail[i]));				
				mimeMessage.setSubject(mail_subject);
				mimeMessage.setContent(mail_body, "text/html");
				
				Transport transport = session.getTransport("smtp");
				transport.connect(emailHost, constantVal.MAIL_ID, constantVal.MAIL_PASSWORD);
				transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
				
				
				
			} catch (AddressException exception) {
				// TODO Auto-generated catch block
				
				
			} catch (MessagingException exception) {
				// TODO Auto-generated catch block
				
			}
		}
		
	}

}
