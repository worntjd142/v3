package we.are.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
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
		public String store_release(Model model,OrderDTO od) {
			model.addAttribute("count", ssi.storerelease_count()); //셀렉트 된 리스트의 갯수 
			
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
											   @RequestParam("amount") int amount,
											   OrderDTO od){
			
			od.setOno(ono);//주문 번호
			od.setOcount(ocount); //수주 수량
			od.setOday(pcode); // *제품코드 (담을 DTO안에 pcode 변수가없어서 oday에 담음)
			od.setAamount(amount);
			int result = ssi.balju_update(od);
			
			return new ResponseEntity<>(result,HttpStatus.OK);
		}
		
		@GetMapping("pcode")
		public ResponseEntity<?> pcode(@RequestParam("pcode") String pcode){
			return new ResponseEntity<>(ssi.product_select(pcode),HttpStatus.OK);
		}
		
		//견적서 발행
		@GetMapping("issuance")
		public ResponseEntity<?> issuance(@RequestParam("ono[]") List<Integer> ono) {	
			
			int rusult = 0;
			for(int i = 0; i < ono.size(); i++) {
				
				rusult = ssi.osuju_update(ono.get(i));
				
			}
			return new ResponseEntity<>(rusult,HttpStatus.OK);
		}
		
		//견적서 발행 하기전 리스트 출력
		@GetMapping("issuance_select")
		public ResponseEntity<?> issuance_select(@RequestParam("ono[]") List<Integer> ono) {		
			ArrayList<HashMap<String, Object>>  issuance_select = ssi.store_select();
			for(int i = 0; i < ono.size(); i++) {
				issuance_select.addAll(ssi.issuance_select(ono.get(i)));
			}
			return new ResponseEntity<>(issuance_select,HttpStatus.OK);
		}
		
}		
