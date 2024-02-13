package we.are.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.AfterReturning;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
				model.addAttribute("stroe", ssi.storerelease_select());// 발행 전 리스트
				model.addAttribute("Management",ssi.management_select());// 발행 후 리스트 , osuju = "견적서 발행"
				//출하수량과 요청잔량 
			return "store_release";
		}
		
		//재고 수량 업데이트
		@GetMapping("pstock_update")
		public ResponseEntity<?> pstock_update(@RequestParam("update_ono") int ono,
																			   @RequestParam("update_tcount") int tcount,
																			   @RequestParam("update_tscount") int tscount,
																			   @RequestParam("update_tamount") int tamount,
																			   @RequestParam("update_ocount[]") int ocount[],
																			   @RequestParam("update_pcode[]") String pcode[],
																			   @RequestParam("update_amount[]") int amount[],
																			   @RequestParam("update_pname[]") String pname[],
																			   @RequestParam("update_scount[]") int scount[])
							
		{
			OrderDTO od = new OrderDTO();
			
			int result = 0;
			for(int i = 0 ; i < pcode.length; i++ ) { // pcode 배열의 길이만큼 반복 ;
				od.setOno(ono);
				od.setTcount(tcount);
				od.setOcount(ocount[i]);
				od.setAmount(amount[i]);
				od.setUuid(pcode[i]);
				od.setPproduct(pname[i]);
				od.setScount(scount[i]);
				od.setTscount(tscount);
				od.setTamount(tamount);
				result = ssi.balju_update(od);
			}
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
		public ResponseEntity<?> issuance(@RequestParam("ono")int ono) {	
			System.out.println(ono);
			HashMap<String, Object>  issuance= new HashMap<String, Object>();
			
			ssi.osuju_update(ono); // osuju -> '견적서 발행' 변경
			
			issuance = ssi.osuju_select(ono); // 
				
			return new ResponseEntity<>(issuance,HttpStatus.OK);
		}
		
		//견적서 발행 하기전 리스트 출력
		@GetMapping("issuance_pdf")
		public ResponseEntity<?> issuance_select(@RequestParam("ono") int ono) {	
			
			HashMap<String, Object>  pdf= new HashMap<String, Object>();
			
			pdf = ssi.issuance_pdf(ono);
			return new ResponseEntity<>(pdf,HttpStatus.OK);
		}
		
		@GetMapping("Shipment")
		public String Shipment(@RequestParam("ono")int ono, Model model) {
		model.addAttribute("shipment", ssi.shipment_select(ono));
			return "Shipment";
		}
		
		@GetMapping("shipment_insert")
		@ResponseBody
		public ResponseEntity<?> Shipment_insert(@RequestParam("ono")int ono , @RequestParam("result")String snumber) {
			
			OrderDTO od = new OrderDTO();
			int val = 0; //
				val =	 ssi.shipment_cselect(ono); // shipment db에 ono의 값이 저장되어있는지 확인 있으면 1이상 없으면 0
			if(val == 0) {// 정보가 없다면
				ssi.shipment_insert(ono); // 정보를 넣어라
				ssi.shipment_delivery(ono);//마감상태 = "출고 중"에서 "배달 중"으로 변경
			}
			val = ssi.snumber_select(ono);	//shipment db의 컬럼 중 snumber의 값이 저장되어있는지 확인 > 있으면 1 없으면 0
			
			if(val == 0) { 
			od.setOno(ono);
			od.setCeo(snumber);
			
			ssi.snumber_update(od);
			
		}
			return new ResponseEntity<>(1,HttpStatus.OK);
		}
		
}		
