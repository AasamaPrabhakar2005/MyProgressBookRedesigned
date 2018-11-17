package com.sb.web.redesigned.HelloWorldSB;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class SendMailSSL {
	public static void main(String[] args) {
		
		String to="isanjaykp@gmail.com";
			generateAndSendEmail(to,"");
		
	}
	public static void generateAndSendEmail(String to,String token ){
		
		String emailBody = "Please click "
				+ "<a href='http://myprogresscard.justandroid.in/confirm?token="+token+"'>here</a> to activate your parent account." + "<br><br> Regards, <br>Team ProgressCard";
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		
		Session session = Session.getDefaultInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					//return new PasswordAuthentication("ritaprabhakar2003@gmail.com","bdyadav123");
					return new PasswordAuthentication("medebugx@gmail.com","mebugx1sgr8");
					
				}
			});

		try {

			Message message = new MimeMessage(session);
			
			message.setFrom(new InternetAddress("noreply@myprogresscard.com"));
			
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(to));
			message.setSubject("ProgressCard Parent Email Verification");
		
			message.setContent(emailBody, "text/html");

			Transport.send(message);

			System.out.println("Done");

		} catch (Exception e) {
			e.printStackTrace();
		} 
}
}