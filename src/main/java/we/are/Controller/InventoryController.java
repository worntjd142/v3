package we.are.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	public String p_insertform() {
		return "p_manage";
	}
	
	
	//제품 등록
	@GetMapping("p_insert")
	public String p_insert(InventoryDTO id) {
		is.p_insert(id);
		return "p_manage";
	}

}
	
