package we.are.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
	
}
