package we.are.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import we.are.Model.ConnectionDTO;
import we.are.Service.ConnectionService;



@Controller
public class ConnectionController {
	
	@Autowired
	ConnectionService cs;
	

		// 거래처 목록 페이지
		@RequestMapping("connection")
		public String connection_list(Model model) {
			model.addAttribute("c_list", cs.connection_list());
			return "connection";
		}
		
		// 거래처 등록 메소드
		@RequestMapping("connection_insert")
		public String connection_insert(ConnectionDTO cd) {
			cs.connection_insert(cd);
			return "redirect:/connection";
		}
		
		
}
