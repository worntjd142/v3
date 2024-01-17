package we.are.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReleaseController {

	@GetMapping("release")
	public String release() {
		return "release";
	}
	
}
