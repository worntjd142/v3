package we.are.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import we.are.Model.InventoryDTO;
import we.are.Model.TempleDTO;
import we.are.Service.InventoryService;
import we.are.Service.TempleService;

@Controller
public class InventoryController {
	
	@Autowired
	InventoryService is;
	
	@Autowired
	TempleService ts;
	
	@GetMapping("inventory")
	public String inventory() {
		return "inventory";
	}
	
	//제품 관리화면
	@GetMapping("p_manage")
	public String p_list(Model model, InventoryDTO id) {
//		model.addAttribute("p_temp", ts.p_temp());
		model.addAttribute("p_list", is.p_list(id));
		return "p_manage";
	}
	

	//제품 등록
	@PostMapping("p_insert")
	public String p_insert(InventoryDTO id) {
		is.p_insert(id);
		return "redirect:/p_manage";
	}
	
	//제품 상세보기
	@PostMapping("p_detail")
	public ResponseEntity<?> p_detail(InventoryDTO id, Model model, HttpSession session, @PathVariable String pcode) {
		
		System.out.println(is.p_detail(pcode));
		return new ResponseEntity<>(is.p_detail(pcode),HttpStatus.OK);
	}
	//창고 온도 실시간 변동
	@RequestMapping(value = "w_temple", method = RequestMethod.GET)
	public ResponseEntity<?> w_temple(TempleDTO td, Model model, HttpSession session) {
		return new ResponseEntity<>(ts.w_temple(), HttpStatus.OK);
	}
	
//	//입고 팝업창
//	@GetMapping("house")
//	public String house(InventoryDTO id, Model model) {
//		model.addAttribute("house", is.house(id));
//		return "house";
//	}
	
//	//추가입고 버튼
//	@RequestMapping(value = "housing", method = RequestMethod.GET)
//	public ResponseEntity<?> housing(InventoryDTO id, Model model, HttpSession session, @RequestParam(value = "dlstn")String dlstn) {
//		
//		return new ResponseEntity<>(is.housing(id), HttpStatus.OK);
//	}
	
}
