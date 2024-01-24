package we.are.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import we.are.Model.CriteriaDTO;
import we.are.Model.OrderDTO;
import we.are.Model.PageDTO;
import we.are.Service.OrderService;

@Controller
public class ReleaseController {
	
	@Autowired
	OrderService os;

	
	@GetMapping("release")
	public String release() {
		
		return "release";
	}
	
	// 출고기간
	@GetMapping("release_day") 
	public String release_day(OrderDTO odto, CriteriaDTO cdto, Model model)	{
		int total = os.total(cdto);	
		model.addAttribute("paging", new PageDTO(cdto, total));
		return "release";
	}
	
	// 운송 위치 팝업
	@GetMapping("mapPopup")
	public String mapPopup() {
		
		return "mapPopup";
	}
}
