<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl코어 라이브러리 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
	
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Black+Han+Sans&family=Bungee&family=Bungee+Shade&family=Gugi&family=Lobster&family=Pacifico&family=Single+Day&family=Yeon+Sung&display=swap" rel="stylesheet">

<link rel="stylesheet" href="/static/css/style.css" type="text/css">

<title>Banana 로그인</title>
</head>
<body>
	
	<div id="signInWrap">
		<h1 class="bananaLogoSignIn mt-3 ml-3">Banana</h1>
		
			<div>
				<img alt="여기에 이미지가 들어갑니다." src=""/>
			</div>
		
		<div class="d-flex justify-content-center">	
			<div class="login my-3">
				<input class="form-control" id="idInput" type="text" placeholder="아이디를 입력하세요" >
				<input class="form-control mt-3" id="passwordInput" type="password" placeholder="비밀번호를 입력하세요" >
				
				<div class="mt-3">
					<input class="form-control btn" id="loginBtn" type="button" value="로그인">
				</div>
				
				<hr>
				
				<div class="mt-3 d-flex justify-content-center">
					<a class="signInLink" href="/user/sign_up">아직 <span class="banana">Banana</span> 회원이 아니신가요?</a>
				</div>
				<div>
					<a href=""></a>
				</div>
				
			</div>
		</div>
		
	</div>
	
	
	
	
	
	
</body>
</html>