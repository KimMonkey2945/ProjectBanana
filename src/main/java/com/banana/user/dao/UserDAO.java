package com.banana.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.banana.user.model.User;

@Repository
public interface UserDAO {

	public int insertUser(
			@Param("loginId") String loginId
			,@Param("password") String password
			,@Param("nickName") String nickName
			,@Param("phoneNumber") String phoneNumber
			,@Param("email") String email);
	
	public User selectPossibleId(@Param("loginId") String loginId);
	
	public User selectUser(@Param("loginId") String loginId
							,@Param("password") String password);
	
	public User selectLoginId(@Param("phoneNumber") String phoneNumber);
	
}
