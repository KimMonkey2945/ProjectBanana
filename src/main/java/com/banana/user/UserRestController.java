package com.banana.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
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
			,@RequestParam("phoneNumber") String phoneNumber
			,@RequestParam("email") String email
			){
		
		int count = userBO.addUser(loginId, password, nickName, phoneNumber, email);
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
	
	@PostMapping("/signIn")
	public Map<String, String> signIn(
			@RequestParam("loginId") String loginId
			,@RequestParam("password") String password
			,HttpServletRequest request){
		
		User user = userBO.getUser(loginId, password);
		Map<String, String> result = new HashMap<>();
		
		if(user != null) {
			result.put("result", "success");
			
			HttpSession session = request.getSession();
			
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userNickName", user.getNickName());
			session.setAttribute("userPhoneNumber", user.getPhoneNumber());
			session.setAttribute("userEmail", user.getEmail());
			session.setAttribute("userCreatedAt", user.getCreatedAt());
				
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@PostMapping("/findId")
	public Map<String, String> findId(@RequestParam("phoneNumber") String phoneNumber){
		
		User user = userBO.findId(phoneNumber);
		
		Map<String, String> result = new HashMap<>();
		
		if(user != null) {
			result.put("result", "success");	
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
