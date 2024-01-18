package we.are.Controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import we.are.Model.MailDTO;

@Controller
public class MailController {

	
	@Autowired
	private JavaMailSender mailSender;
    
	//메일 작성 페이지
	@GetMapping("mail")
	public String mail() {
		return "mail";
	}
	
	
	//메일 작성 패치 형식으로 받음.
	@PostMapping("mailsend")
	public String mailSend(MailDTO md) {
		System.out.println(md.getSubject());
		System.out.println(md.getTo());
		System.out.println(md.getText());
		try {
			MimeMessage mimeMessage = mailSender.createMimeMessage();
		    MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
 
		    messageHelper.setTo(md.getTo()); // 받는사람 이메일
		    messageHelper.setSubject(md.getSubject()); // 메일제목
		    messageHelper.setText(md.getText()); // 메일 내용
 
		    mailSender.send(mimeMessage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
	
}
