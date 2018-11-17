package com.sb.web.redesigned.HelloWorldSB;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WelcomeController {

	@RequestMapping("/")
	public String homepage() {
		return "HomePage";
	}
	@RequestMapping("/about")
	public String about() {
		return "About";
	}
	@RequestMapping("/confirm")
	public String confirm() {
		return "Confirm";
	}
	@RequestMapping("/help")
	public String help() {
		return "Help";
	}
	@RequestMapping("/contact")
	public String contact() {
		return "Contact-feedback";
	}
	@RequestMapping("/donate")
	public String donate() {
		return "Donate";
	}
	@RequestMapping("/login")
	public String login() {
		return "Login1";
	}
	@RequestMapping("/signup")
	public String signup() {
		return "SignUp1";
	}
	@RequestMapping(value="/signup",method = RequestMethod.POST)
	public String signuppost() {
		return "SignUp1";
	}
	@RequestMapping("/termsofuse")
	public String termsofuse() {
		return "TermsOfUse";
	}
	@RequestMapping("/parent")
	public String parent() {
		return "Parent";
	}
	@RequestMapping("/student")
	public String student() {
		return "Student";
	}
	

}
