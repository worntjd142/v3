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

import we.are.Model.InventoryDTO;
import we.are.Service.InventoryService;

@Controller
public class InventoryController {
	
	@Autowired
	InventoryService is;
	
	@GetMapping("inventory")
	public String inventory() {
		return "inventory";
	}
	
	//제품 관리화면
	@GetMapping("p_manage")
	public String p_list(Model model, InventoryDTO id) {
		model.addAttribute("p_list", is.p_list(id));
		return "p_manage";
	}
	
	
	//제품 등록
	@PostMapping("p_insert")
	public String p_insert(InventoryDTO id) {
		is.p_insert(id);
		return "redirect:/p_manage";
	}
	
	@PostMapping("p_detail")
	public ResponseEntity<?> p_detail(InventoryDTO id, Model model, HttpSession session) {
		
		System.out.println(is.p_detail());
		return new ResponseEntity<>(is.p_detail(),HttpStatus.OK);
	}
	
	
}
	
