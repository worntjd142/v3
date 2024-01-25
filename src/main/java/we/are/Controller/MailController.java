package we.are.Controller;

import java.io.File;

import javax.activation.FileDataSource;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import we.are.Model.MailDTO;
import we.are.Service.OrderServiceImpl;

@Controller
public class MailController {

	
	@Autowired
	OrderServiceImpl os;
	
	@Autowired
	private JavaMailSender mailSender;
    
	//파일업로드 
//	@PostMapping("/uplodeFile.do")
//	public String uplodeFile(@ModelAttribute("md") MailDTO md)throws Exception {
//	   //@ModelAttribute는 VO를 객체화 시켜서 jsp로 넘겨줌 
//       //이때 괄호안에 text는 jsp에서 값을 부르는 별명이라고 생각하면 됨
//       //여기서는 VO를 객체로 만들어 줘야해서 @ModelAttribute 지정함
//        
//		String fileName = null;
//		MultipartFile file = md.getUploadFile();//위에 fileVO객체를 통해 MultipartFile 기능을 쓸수 있게 내용을 담아줌
//		if (!file.isEmpty()) { //file객체가 비어있지 않다면
//        
//		String originalFileName = file.getOriginalFilename(); //파일의 실제 이름
//
//		
//		//String ext =FilenameUtils.getExtension(originalFileName); //파일의 확장자
//		//UUID uuid = UUID.randomUUID(); //파일의 새로운 닉네임 같은거....
//		fileName = originalFileName; //랜덤값+파일의 실제 이름+파일의 확장자 이렇게 붙여서 파일명을 새롭게 만들고 
//        							//DB에 담아주는게 좋으나 나는 간단하게 작성을 위하여 파일명만 지정
//		
//		file.transferTo(new File("C:\\upload\\"+fileName)); //new File 객체를 통해 file객체를 만들고
//        							//"c:\\upload\\"지정해준 경로에 파일새로만들기
//		}
//		
//		md.setFileName(fileName); //지정해준 파일명을 vo에 담아줌
//		os.saveFile(md); // 담아준 vo를 비지니스로직에 태워보냄
//		
//		
//		return ""; //특정 jsp페이지로 지정해도되나 나는 따로 지정을 안하여 controller가 실행한뒤 404에러페이지가 나온다
//    
//	}

	
	
	//메일 작성 페이지
	@GetMapping("mail")
	public String mail() {
		return "mail";
	}
	
	
	//메일 작성 패치 형식으로 받음.
	@GetMapping("mailsend")
	public ResponseEntity<?> mailSend(MailDTO md, @RequestParam("uuid") String uuid, @RequestParam("bname") String bname, @RequestParam("text") String text) {
		String image_name = bname +"."+ uuid;  //첨부할 이미지 이름.
		String title = bname + "  (수주번호) : " + uuid; // 제목
		System.out.println(title);
		String to = "goqudeo142@naver.com"; //받는 사람 이메일
		String image = "<img src='cid:mail'/><br>"+text; //첨부 이미지
		
		try {
			MimeMessage mimeMessage = mailSender.createMimeMessage();
		    MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
		    messageHelper.setTo(to); //받는사람 이메일
		    messageHelper.setSubject(title); //메일 제목
		    messageHelper.setText(image, true); // 메일 내용
		    
		    //첨부파일
		    messageHelper.addInline("mail", new FileDataSource("C:\\Users\\GR\\Desktop\\sujubox\\"+image_name+".jpg")); 
		    
		    
		    mailSender.send(mimeMessage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>(1,HttpStatus.OK);
	}
	
}
