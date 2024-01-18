package we.are.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mysql.cj.Session;

import we.are.Model.BaljuDTO;
import we.are.Model.InventoryDTO;
import we.are.Service.BaljuService;

@Controller
public class OrderController {

	@Autowired
	BaljuService bals;
	
	//임시등록 수주서
	@GetMapping("sujuletter")
	public String sujuletter() {
		return "sujuletter";
	}
	
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
	
	// 발주 등록 제품 가져오기
	@RequestMapping("product_select.json")
	public ResponseEntity<?> product_select(InventoryDTO id, Model model, HttpSession session) {		
		System.out.println(bals.product_select());
		return new ResponseEntity<>(bals.product_select(),HttpStatus.OK);
	}
	
}
