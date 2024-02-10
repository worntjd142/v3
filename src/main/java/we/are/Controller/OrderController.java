package we.are.Controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import we.are.Model.CartDTO;
import we.are.Model.ConnectionDTO;
import we.are.Model.CriteriaDTO;
import we.are.Model.InventoryDTO;
import we.are.Model.OrderDTO;
import we.are.Model.PageDTO;
import we.are.Service.OrderService;


@Controller
public class OrderController {

	@Autowired
	OrderService os;



	// 수주등록 버튼을 누르면
	@RequestMapping("order_insert")
	public String order_insert(@RequestParam("cno") String cno, @RequestParam("cname") String cname,
							   @RequestParam("ceo") String ceo, @RequestParam("pcount") int pcount,
							   @RequestParam("pproduct") String pproduct[], @RequestParam("pprice") String pprice[],
							   @RequestParam("ocount") int ocount[], @RequestParam("osum") String osum,
							   @RequestParam("omanager") String omanager, @RequestParam("otext") String otext) {
		
		// OrderDTO = 새로운 OrderDTO 배열선언;
		OrderDTO od = new OrderDTO();
		CartDTO cd = new CartDTO();
		
		od.setCno(cno);
		od.setCname(cname);
		od.setCeo(ceo);
		od.setPcount(pcount);
		od.setOmanager(omanager);
		od.setOtext(otext);		
		cd.setOsum(osum);
		
		os.order_insert(od); // 거래처 입력 하고 ono 값이 DB에 생성
		int oono = os.ono_select(od); // 생성한 ono값을 가져와서 int oono에 초기화
	
		cd.setOno(oono); // oono를 cd의 ono값에 저장
		
		for(int i = 0; i < pcount; i++) { //PCOUNT의 갯수만큼 반복
			
			cd.setPproduct(pproduct[i]); //배열
			cd.setPprice(pprice[i]); //배열
			cd.setOcount(ocount[i]); // 배열
			
			os.cart_insert(cd); // 장바구니에 인서트
		}	

		return "redirect:/order";
	}


	// 수주 목록 select
	@RequestMapping("order")
	public String order_list (CriteriaDTO cd, Model model, InventoryDTO id) {
		
		// Join된 결과 값 select
		ArrayList<HashMap<String, Object>> olist = os.order_select(cd);		
		
		// order.jsp 실행할때 제품리스트(product) select결과를 "plist"에 저장해서 가져와
		model.addAttribute("plist", os.product_select());
		// order.jsp 실행할때 select된 결과를 "olist"에 저장해서 가져와
		model.addAttribute("olist", olist);
		// 수주 테이블에 전체 건수(total select해서)를 아래 190대신 대입
		int total = os.total(cd);
		// order.jsp 실행할때 PageDTO에 저장되있는 데이터를 가져와
									// 생성자 호출(매개변수가 2개인 생성자)
									// new PageDTO(cdto, 190));
		model.addAttribute("paging", new PageDTO(cd, total));
		return "order";
	}
	
	
	// 수주 상세정보
	@RequestMapping("order/order_detail_popup")
	public String order_detail (OrderDTO od, Model model) {
		model.addAttribute("orderdetail", os.order_detail(od));
		return "order/order_detail_popup";
	}
	

	// 발주 등록 제품 ajax
	@RequestMapping("/autoproduct")
	public ResponseEntity<?> product(@RequestParam (value="pname") String pname, 											
											InventoryDTO id, Model model, HttpSession session) {
		
		id.setPname(pname); // DTO에 저장하는 방식		
		return new ResponseEntity<>(os.product_select(),HttpStatus.OK);
	}
	
	
	// 거래처명 자동완성 ajax
	@RequestMapping("/autocomplete") //@RequestParam(value="변수명" 데이터타입 데이터변수명)
	public ResponseEntity<?> auto (@RequestParam(value="cname") String cname, ConnectionDTO cdt, Model model, HttpSession session) {
		
		return new ResponseEntity<>(os.autocomplete(cname), HttpStatus.OK);
	}	

	
	// 일괄 수주 
	 @GetMapping("all_issuance")
     public ResponseEntity<?> issuance(@RequestParam(value="ono[]") List<Integer> ono) {  //배열값을 받고
		 	
		 int result = 0; // 업데이트가 되면 1 아니면 0		 
		 //* size() == length
		 for(int i=0; i < ono.size(); i++) { //ono 배열의 길이만큼 반복			 
			result = os.suju_update(ono.get(i)); // 반복하면서 하나씩 업데이트.			
		 }		 
		 // 결과값 반환 ('0' or '1')
        return new ResponseEntity<>(result,HttpStatus.OK);
        }

	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 


		/*	//임시등록 수주서1
		@GetMapping("sujuletter1")
		public void sujuletter1(OrderDTO od, CompanyDTO cd, HttpSession session, @RequestParam("bno") int bno, Model model) {

			OrderDTO ood = new OrderDTO();//다른 주소의 OrderDTO타입 ood변수 생성		
			od.setOno(bno);	//parameter로 bno값을 받고 OrderDTO od bno변수에 저장		
			ood = os.sujuletter_select(od); // od변수에 있는 값을 이용해서 DB의 orders 테이블에서 셀렉하고 결과값을 ood에 저장
			model.addAttribute("sujuletter", os.sujuletter_select(od)); //셀렉한 값을 model 객체 "sujuletter"변수에 저장
			cd.setCnumber(ood.getOnumber()); // ood의 저장된 값중 bnumber를 CompanyDTO cd변수 안의 number에 저장
			model.addAttribute("company", os.sujucom_select(cd.getCnumber())); // 저장받은 number값을 이용해서 DB company에서 결과값을 model 객체 "company"에 저장
		}



		//임시등록 수주서 발행
		@GetMapping("issuance")
		public ResponseEntity<?> issuance(OrderDTO od, Model model, HttpSession session,@RequestParam("bno") int bno) {		
			// order dto bno에 bno값을 저장
			od.setBno(bno); // 반환 값 1 or 0
			//bno값으로 업데이트. 
			return new ResponseEntity<>(os.suju_update(od),HttpStatus.OK);
		}*/
		

}
