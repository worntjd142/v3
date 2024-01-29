package we.are.Controller;

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
			model.addAttribute("stroe", ssi.store_select());
		return "store";
		}
}
