package com.banana.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	
	@GetMapping("/sign_up")
	public String signUpView() {
		return "/user/signUp";
	}
	
	@GetMapping("/sign_in")
	public String signInView() {
		return "/user/signIn";
	}
	
}
