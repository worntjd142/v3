package we.are.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import we.are.Mapper.LoginMapper;
import we.are.Model.LoginDTO;
import we.are.Service.LoginService;

@Controller
public class MainController {
	
	@Autowired
	LoginService ls;
	
	
	
	@RequestMapping("/")
	public String mainLogin() {		
		return "main";
	}
	
	// 로그인버튼 누르면
	@RequestMapping("login")
	public String loginpage(LoginDTO ld, HttpServletRequest request, HttpSession session) {	

		// 만약에 login값이 null이 아니면
		if (ls.login(ld) != null) {
			// 세션값을 생성한다.
			session.setAttribute("login", ls.login(ld));
			// 세션값 생성후 order.jsp로 페이지로 이동한다.
			return "redirect:/order";
			// login값이 null이면
		} else {
			// 세션값이 null값을 넣는다.
			session.setAttribute("login", null);
			// 세션값이 null이면 main.jsp 페이지로 이동한다.
			return "redirect:/main";
		}
		
	}
	
	
/*	// 로그인하면 수주관리 페이지로 이동
	@RequestMapping("login")
	public String login(LoginDTO joindto, Model model, HttpSession session) {
		
		if(joins.login(joindto) != null) { // 로그인을 하면 DB에 있는 값과 입력한 값 비교해서 일치하면
		session.setAttribute("login", joins.login(joindto));
		return "redirect:/order";
		}else {
			System.out.println("fail");// session객체 변수login에 저장
			return "main";
		}
	}	*/
	
	// 회원가입 페이지
	@RequestMapping("join")
	public String join() {		
		return "join";
	}
	
	// 회원가입 INSERT
	@RequestMapping("login_insert")
	public String login_insert(LoginDTO ld) {
		ls.login_insert(ld);
		return "main";
	}
	
	// 로그아웃버튼 누르면 메인으로 이동
	@RequestMapping("logout")
	public String logout (HttpSession session) {
		session.invalidate(); //invalidate > 세션 데이터 무효
		return "redirect:/";
	}
	

		
	}

	
	
