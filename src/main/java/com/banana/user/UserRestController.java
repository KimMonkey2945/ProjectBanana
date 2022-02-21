package com.banana.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.banana.user.bo.UserBO;
import com.banana.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	@PostMapping("/signUp")
	public Map<String, String> singUp(
			@RequestParam("loginId") String loginId
			,@RequestParam("password") String password
			,@RequestParam("nickName") String nickName
			,@RequestParam("email") String email
			){
		
		int count = userBO.addUser(loginId, password, nickName, email);
		Map<String, String> result = new HashMap<>();
		
		if(count != 0) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@PostMapping("/checkId")
	public Map<String, String> checkId(@RequestParam("loginId") String loginId) {
		
		User user = userBO.checkId(loginId);
		Map<String, String> result = new HashMap<>();
		
		if(user == null) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	
}
