package com.banana.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.banana.common.EncryptUtils;
import com.banana.user.dao.UserDAO;
import com.banana.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public int addUser(String loginId, String password, String nickName, String email) {
		
		String encPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(loginId, encPassword, nickName, email);
	}
	
	
	public User checkId(String loginId) {
		return userDAO.selectPossibleId(loginId);
	}
}
