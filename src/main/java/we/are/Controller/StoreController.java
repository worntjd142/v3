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
		//출하 페이지
		@RequestMapping("store_release")
		public String store_release(Model model,OrderDTO od) {
			int size = ssi.storerelease_count();
			
			model.addAttribute("count", ssi.storerelease_count()); //셀렉트 된 리스트의 갯수 
			
			for(int i = 0; i < size; i++ ) {
				ssi.storerelease_select().get(i).get("scount");
			}
			
			
				model.addAttribute("stroe", ssi.storerelease_select());
			return "store_release";
		}
		
		//재고 수량 업데이트
		@GetMapping("pstock_update")
		public ResponseEntity<?> pstock_update(@RequestParam("update_ono") int ono,
																			   @RequestParam("update_tcount") int tcount,
																			   @RequestParam("update_ocount[]") int ocount[],
																			   @RequestParam("update_pcode[]") String pcode[],
																			   @RequestParam("update_amount[]") int amount[],
																			   @RequestParam("update_pname[]") String pname[]){
			
			OrderDTO od = new OrderDTO();
			
			int result = 0;
			for(int i = 0 ; i < pcode.length; i++ ) {
				od.setOno(ono);
				od.setScount(tcount);
				od.setOcount(ocount[i]);
				od.setAamount(amount[i]);
				od.setUuid(pcode[i]);
				od.setPproduct(pname[i]);
				
				result = ssi.balju_update(od);
			}
				System.out.println(result);
			return new ResponseEntity<>(result,HttpStatus.OK);
		}
		//출하 상세
		@GetMapping("ono_balju")
		public ResponseEntity<?> ono_balju(@RequestParam("ono") String ono){
			return new ResponseEntity<>(ssi.product_select(ono),HttpStatus.OK);
		}
		// 재고
		@GetMapping("ono_stock")
		public ResponseEntity<?> ono_stock(@RequestParam("ono") String ono){
			return new ResponseEntity<>(ssi.product_List(ono),HttpStatus.OK);
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
			
			for(int i = 0; i < ono.size(); i++) {
				
				
			}
			return new ResponseEntity<>(1,HttpStatus.OK);
		}
		
}		
