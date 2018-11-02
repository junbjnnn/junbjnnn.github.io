package fasttrackse.ffse1702a.fbms.Security.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	@RequestMapping(value = { "/login" })
	public String login(@RequestParam(value = "error", required = false) final String error, final Model model,
			final Principal pr) {
		if (error != null) {
			model.addAttribute("message", "Login Failed!");
		}
		if (pr != null) {
			return "redirect:/";
		}
		return "login";
	}

}