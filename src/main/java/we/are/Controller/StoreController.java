package we.are.Controller;

import java.util.ArrayList;
import java.util.HashMap;

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
		
		//재고 수량 및 발주 확인
		@GetMapping("pstock")
		public ResponseEntity<?> pstock(@RequestParam("pstock") String pstock,@RequestParam("ono") int ono,OrderDTO od){
			od.setOcount(ssi.product_select(pstock));// 재고 수량
		
			od.setSdate(ssi.balju_check(ono)); // 발주 확인
			od.getSdate();
			return new ResponseEntity<>(od,HttpStatus.OK);
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
}		
