package we.are.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import we.are.Service.InventoryService;

@Controller
public class InventoryController {
	
	@Autowired
	InventoryService is;
	
	@GetMapping("inventory")
	public String inventory() {
		return "inventory";
	}
	
	//제품 등록 팝업창
	@GetMapping("p_insert")
	public String p_insert() {
		return "p_insert";
	}
	
	//제품 입고 팝업창
	@GetMapping("p_quantity")
	public String p_quantity() {
		return "p_quantity";
	}
	
	
}
	
