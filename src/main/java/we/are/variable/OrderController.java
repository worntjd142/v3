package we.are.variable;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrderController {

	@GetMapping("order")
	public String mainLogin() {
		return "order";
	}
	
}
