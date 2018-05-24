package mail;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendMail {

    private static String USER_NAME = "javaforall55@gmail.com";  // GMail user name (just the part before "@gmail.com")
    private static String PASSWORD = "zydheepumvfhpfzz"; // GMail password
    private static String RECIPIENT = "iadgroup2017@gmail.com";
    public static void sentMail(String mailTo, String userName, String userPwd) {

		final String username = "iadgroup2017@gmail.com";
		final String password = "2017iadgroup";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });

		try {

			Message message = new MimeMessage(session);
                        message.setContent("<h4>Dear "+userName+", </h4><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Your login password is '<b>"+userPwd+"</b>'. Hope you are happy.<br><br><h4>Thanks & Regards,<br>LandLordTenantSystem Admin.</h4>","text/html; charset=utf-8" );  
                        message.setFrom(new InternetAddress("iadgroup2017@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(mailTo));
			message.setSubject("LandLordTenantSystem response on your request");
			//message.setText("Dear Mail Crawler,"\n\n No spam to my email, please!");

			Transport.send(message);

			System.out.println("Mail send successfully to : "+mailTo);

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
    public static void main(String args[]){
        sentMail("kvr242@gmail.com", "Varun Reddy", "4754498040");
    }    
}