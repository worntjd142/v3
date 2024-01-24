package we.are.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import we.are.Model.CompanyDTO;
import we.are.Model.InventoryDTO;
import we.are.Model.OrderDTO;
import we.are.Service.OrderService;


@Controller
public class OrderController {

	@Autowired
	OrderService os;
	
	//임시등록 수주서1
	@GetMapping("sujuletter1")
	public void sujuletter1(OrderDTO od, CompanyDTO cd, HttpSession session, @RequestParam("bno") int bno, Model model) {
		
		od.setBno(bno); // 번호
		
		model.addAttribute("sujuletter", os.sujuletter_select(od));
		
		cd.setCnumber(od.getBnumber());
			
		model.addAttribute("company", os.sujucom_select(cd.getCnumber()));
		
	}
	
	
	//임시등록 수주서
	@GetMapping("sujuletter")
	public void sujuletter(OrderDTO od, HttpSession session,
			@RequestParam("day") String day, @RequestParam("uuid") String uuid, @RequestParam("name") String name, Model model,
			@RequestParam("count") int count, @RequestParam("total") int total, @RequestParam("product") String product, @RequestParam("price") int price,
			@RequestParam("number") String number, @RequestParam("pcode") String pcode, @RequestParam("bno") int bno, @RequestParam("sujubox") String sujubox) {
		// url 주수로 받아온 값을 DTO에 하나씩 저장
		od.setBaljuday(day); // 발주 일자
		od.setUuid(uuid);// 주문 번호
		od.setBname(name); // 거래처 
		od.setBcount(count);// 물품 갯수
		od.setBsum(total);// 합계
		od.setBproduct(product);// 제품 이름
		od.setPprice(price);// 단가
		od.setBnumber(number);//사업자 번호
		od.setPcode(pcode);// 상품 코드
		od.setBno(bno); // 번호
		od.setSujubox(sujubox);// 발행 여부
		
		// <c:forEach> 를 쓰기위해선 배열형태로 변경해야 하므로 
		ArrayList<OrderDTO> od1 = new  ArrayList<>(); //배열 선언 
		
			od1.add(od); // ot1의 배열 ot값을 넣음.
			
		model.addAttribute("sujuletter", od1);	//배열 ot1에 저장된 값을 model 객체의 "sujuletter"라는 변수로 저장.
	}
	
	//임시등록 수주서 발행
	@GetMapping("issuance")
	public ResponseEntity<?> issuance(OrderDTO od, Model model, HttpSession session,@RequestParam("bno") int bno) {		
		// order dto bno에 bno값을 저장
		od.setBno(bno); // 반환 값 1 or 0
		//bno값으로 업데이트. 
		return new ResponseEntity<>(os.suju_update(od),HttpStatus.OK);
	}
	
	
	
	// 수주 페이지
	@GetMapping("order")
	public String order(Model model) {
		//발주 목록 가져오기
		model.addAttribute("baljulist", os.balju_select());
		return "order";
	}
	
	// 발주 페이지
	@RequestMapping("balju")
	public String balju(Model model) {
		//거래처 목록가져오기
		model.addAttribute("company", os.company_select());
		return "balju";
	}
	
	// 발주 등록 insert
	@RequestMapping("balju_insert")
	public String balju_insert(OrderDTO od) {
		os.balju_insert(od);
		return "redirect:/order";
	}
	
	// 발주 등록 제품 ajax !
	@RequestMapping("product_select.json")
	public ResponseEntity<?> product_select(InventoryDTO id, Model model, HttpSession session) {		
		return new ResponseEntity<>(os.product_select(),HttpStatus.OK);
	}
	
	// 수주내역 날짜 검색
	@RequestMapping("search_day")
	public String search_day (OrderDTO od, Model model, HttpSession session) {
		model.addAttribute("baljulist", os.daysearch(od));
		session.setAttribute("searchday", os.daysearch(od));
		return "order";
	}
	
}
