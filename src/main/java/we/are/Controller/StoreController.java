package we.are.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import we.are.Model.OrderDTO;
import we.are.Service.StoreServiceImpl;

@Controller
public class StoreController {
	
	@Autowired
	StoreServiceImpl ssi;
	
		// 출고 페이지
		@RequestMapping("store")
		public String store(Model model) {
			//출고 목록 가져오기 (수주상태 = '수주확인' 인 것만)
			ArrayList<HashMap<String, Object>> store = ssi.store_select(); // 조인된 결과값을 해시맵에 저장
			model.addAttribute("stroe", store);// 변경 후 모델에 담아서 전달
			return "store";
	
		}
		
		@RequestMapping("store_release")
		public String store_release(Model model) {
			ArrayList<HashMap<String, Object>> store = ssi.storerelease_select(); // 조인된 결과값을 해시맵에 저장
			model.addAttribute("stroe", store);// 변경 후 모델에 담아서 전달
			
			model.addAttribute("Management" ,ssi.management_select());
			return "store_release";
		}
		
		//재고 수량 업데이트
		@GetMapping("pstock_update")
		public ResponseEntity<?> pstock_update(@RequestParam("ono") int ono,
											   @RequestParam("ocount") int ocount,
											   @RequestParam("pcode") String pcode,
											   OrderDTO od){
			
			od.setOno(ono);//주문 번호
			od.setOcount(ocount); //수주 수량
			od.setOday(pcode); // *제품코드 (담을 DTO안에 pcode 변수가없어서 oday에 담음)
			int result = ssi.balju_update(od);
			
			return new ResponseEntity<>(result,HttpStatus.OK);
		}
		
		@GetMapping("pcode")
		public ResponseEntity<?> pcode(@RequestParam("pcode") String pcode){
			return new ResponseEntity<>(ssi.product_select(pcode),HttpStatus.OK);
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


			*/
		//견적서 발행
		@GetMapping("issuance")
		public ResponseEntity<?> issuance(OrderDTO od, Model model, HttpSession session,@RequestParam("ono") int ono) {		
			
			int result = ssi.osuju_update(ono); //수주상태 업데이트 - > '견적서 발행'
			System.out.println(result);
			if(result == 1) {
				od = ssi.check(ono);
			}
			
			return new ResponseEntity<>(od,HttpStatus.OK);
		}
		
}		
