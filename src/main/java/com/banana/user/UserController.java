package com.banana.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.banana.user.bo.UserBO;
import com.banana.user.model.User;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserBO userBO;
	
	@GetMapping("/sign_up")
	public String signUpView() {
		return "/user/signUp";
	}
	
	@GetMapping("/sign_in")
	public String signInView() {
		return "/user/signIn";
	}
	
	@GetMapping("/findLogin_Info")
	public String findLogin_Info(){
		return "/user/findLoginInfo";
	}
	
	@GetMapping("/findLogin_Id")
	public String findlogindId(@RequestParam("phoneNumber") String phoneNumber, Model model) {
		
		User user = userBO.checkId(phoneNumber);
		model.addAttribute("user", user);
		
		return "/user/findLoginId";
	}
	
}
