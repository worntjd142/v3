package we.are.Controller;

import java.io.File;

import javax.activation.FileDataSource;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
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
		
		
		//기본 멘트
		String ment1 = "<img src='cid:cat'/>";
//				+ "안녕하십니까? redstarpharma입니다. "
//				+ "귀사의 일익 번창하심을 진심으로 기원하며 귀사 수주의뢰서를 드립니다."
//				+ "정보를 확인 부탁드립니다."
//				+ "TEL - 1588-1666";
		
		try {
			MimeMessage mimeMessage = mailSender.createMimeMessage();
		    MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
		    messageHelper.setTo(md.getTo()); // 받는사람 이메일
		    messageHelper.setSubject(md.getSubject()); // 메일제목
		    messageHelper.setText(ment1, true); // 메일 내용
		    
		    //첨부파일
		    messageHelper.addInline("cat", new FileDataSource("C:\\Users\\GR\\Desktop\\koo\\cat.jpg")); 
		    
		    
		    mailSender.send(mimeMessage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
	
}
