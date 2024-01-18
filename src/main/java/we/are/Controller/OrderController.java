package we.are.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import we.are.Model.BaljuDTO;
import we.are.Service.BaljuService;

@Controller
public class OrderController {

	@Autowired
	BaljuService bals;
	
	// 수주 페이지
	@GetMapping("order")
	public String order() {
		return "order";
	}
	
	// 발주 페이지
	@RequestMapping("balju")
	public String balju() {
		return "balju";
	}
	
	// 발주 등록 insert
	@RequestMapping("balju_insert")
	public String balju_insert(BaljuDTO baldto) {
		System.out.println(baldto);
		bals.balju_insert(baldto);
		return "redirect:/order";
	}
	
	
}
