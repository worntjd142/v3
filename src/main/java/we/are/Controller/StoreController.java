package we.are.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {
		// 출고 페이지
		@RequestMapping("store")
		public String store() {
		return "store";
		}
}
