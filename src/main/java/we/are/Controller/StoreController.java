package we.are.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import we.are.Service.StoreServiceImpl;

@Controller
public class StoreController {
	
	@Autowired
	StoreServiceImpl ssi;
	
		// 출고 페이지
		@RequestMapping("store")
		public String store(Model model) {
			//출고 목록 가져오기 (수주상태 = '수주확인' 인 것만)
			ArrayList<HashMap<String, Object>> store = ssi.store_select(); // 조인된 결과값을 해시맵으로 변경
			model.addAttribute("stroe", store);// 변경 후 모델에 담아서 전달
			return "store";
		}
}
