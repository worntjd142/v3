package we.are.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import we.are.Model.BaljuDTO;
import we.are.Model.InventoryDTO;
import we.are.Service.BaljuService;
import we.are.Service.SujuService;


@Controller
public class OrderController {

	@Autowired
	BaljuService bals;
	
	@Autowired
	SujuService ss;
	
	//임시등록 수주서
	@GetMapping("sujuletter")
	public void sujuletter(BaljuDTO bt, HttpSession session,
			@RequestParam("day") String day, @RequestParam("number") String bno, @RequestParam("name") String name, Model model,
			@RequestParam("count") int count, @RequestParam("total") int total, @RequestParam("product") String product, @RequestParam("price") int price,
			@RequestParam("number") String number) {
		// url 주수로 받아온 값을 DTO에 하나씩 저장
		bt.setBaljuday(day); // 발주 일자 or 수주 일자
		bt.setBno(bno); // 수주번호
		bt.setBname(name); // 거래처 
		bt.setBcount(count);// 물품 갯수
		bt.setBsum(total);// 합계
		bt.setBproduct(product);// 제품 이름
		bt.setPprice(price);// 단가
		bt.setBnumber(number);//사업자 번호
		
		// <c:forEach> 를 쓰기위해선 배열형태로 변경해야 하므로 
		ArrayList<BaljuDTO> bt1 = new  ArrayList<>(); //배열 선언 
		
			bt1.add(bt); // bt1의 배열 인덱스 0번에 BaljuDTO타입 bt값을 넣음.
			
		model.addAttribute("sujuletter", bt1);	//배열 bt1에 저장된 값을 model 객체의 "sujuletter"라는 변수로 저장.
		session.setAttribute("maillist",  bt1);
	}
	
	//임시등록 수주서함
	@GetMapping("sujubox")
	public String sujubox(Model model) {
		//수주 박스에 리스트 출력
		  model.addAttribute("list", ss.suju_select()); 
		return "sujubox";
	}
	
	// 수주 페이지
	@GetMapping("order")
	public String order(Model model) {
		//발주 목록 가져오기
		model.addAttribute("baljulist", bals.balju_select());
		return "order";
	}
	
	// 발주 페이지
	@RequestMapping("balju")
	public String balju(Model model) {
		//거래처 목록가져오기
		model.addAttribute("company", bals.company_select());
		return "balju";
	}
	
	// 발주 등록 insert
	@RequestMapping("balju_insert")
	public String balju_insert(BaljuDTO baldto) {
		bals.balju_insert(baldto);
		return "redirect:/order";
	}
	
	// 발주 등록 제품 ajax !
	@RequestMapping("product_select.json")
	public ResponseEntity<?> product_select(InventoryDTO id, Model model, HttpSession session) {		
		return new ResponseEntity<>(bals.product_select(),HttpStatus.OK);
	}
	
	
}
