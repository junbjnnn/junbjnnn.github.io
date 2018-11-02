package fasttrackse.ffse1702a.fbms.Security.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageNotFoundController {
	@RequestMapping("/error")
	public String pageNotFound() {
		return "error-403";
	}
}