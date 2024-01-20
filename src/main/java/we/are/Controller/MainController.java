package we.are.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import we.are.Model.JoinDTO;
import we.are.Service.JoinService;

@Controller
public class MainController {
	
	@Autowired
	JoinService joins;
	
	@RequestMapping("/")
	public String mainLogin() {		
		return "main";
	}
	
	// 로그인하면 수주관리 페이지로
	@RequestMapping("login")
	public String login() {		
		return "redirect:/order";
	}
	
	
	// 회원가입 페이지
	@RequestMapping("join")
	public String join() {		
		return "join";
	}
	
	// 회원가입 INSERT
	@RequestMapping("join_insert")
	public String join_insert(JoinDTO joindto) {
		joins.join_insert(joindto);
		return "main";
	}
	
	
}
	
