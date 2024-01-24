package we.are.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import we.are.Service.TempleService;

@Controller
public class TempleController {
	
	@Autowired
	TempleService ts;
	
	
}
