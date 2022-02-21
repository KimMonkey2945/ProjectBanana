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

<title>Banana 회원가입</title>
</head>
<body>

	<div id="signUpWrap">
		<div class="content mt-5">
			<h1 class="bananaTitle text-center">Banana</h1>
				<hr class="signUpHr">
			
				<div class="d-flex justify-content-center">
					<div>
						<div>
							<input class="form-control" type="text" id="loginIdInput" placeholder="아이디입력"/>
							<div id="possibleId">사용 가능한 아이디입니다.</div> 
							<div id="impossibleId">이미 사용중인 아이디입니다.</div>
						</div>
						<input class="form-control my-3" type="text" id="nickNameInput" placeholder="사용자이름" />
						<input class="form-control my-3" type="password" id="passwordInput" placeholder="비밀번호" />
						<input class="form-control my-3" type="password" id="passwordCheck" placeholder="비밀번호 확인" />
						<div class="passwordCheck small text-danger">비밀번호가 일치하지 않습니다.</div>
						<input class="form-control my-3" type="email" id="emailInput" placeholder="이메일" />
						<button class="form-control btn btn-block" id="joinBtn" type="button">가입</button>
					</div>
				</div>

			<div class="mt-3 d-flex align-items-center justify-content-center">
				Banana 회원이신가요??</div>
			<div class="d-flex align-items-center justify-content-center">
				<a class="mt-2" href="/user/signin_view">로그인</a>
			</div>
		</div>
		
		<footer class=" mt-3 d-flex justify-content-center align-items-end">
			<div class="mt-5 small text-secondary">© 2022 Banana from KimMonkey</div>
		</footer>
	</div>
		

	<script>
	
	
		$(document).ready(function(){
			$("#possibleId").hide();
			$("#impossibleId").hide();
			$(".passwordCheck").hide();
			
			$("#loginIdInput").keyup(function(){
				
				var loginId = $("#loginIdInput").val();
				
				$.ajax({
					type:"post",
					url:"/user/checkId",
					data:{"loginId":loginId},
					success:function(data){
						if(data.result == "success"){
							$("#possibleId").show();
							 $("#impossibleId").hide();
						}else{
							 $("#impossibleId").show();
							 $("#possibleId").hide();
						}
					},
					error:function(){
						alert("에러발생!!!");
					}
				});
			});
			
			$("#passwordCheck").keyup(function(){
				var password = $("#passwordInput").val();
				var passwordCheck = $("#passwordCheck").val();
				
				if(!(password == passwordCheck)){
					$(".passwordCheck").show();					
					return false;
				}else{
					$(".passwordCheck").hide();
				}
			});
			
			
			
			$("#joinBtn").on("click", function(){
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				var passwordCheck = $("#passwordCheck").val();
				var nickName = $("#nickNameInput").val();
				var email = $("#emailInput").val();
				
				
				if(loginId == ""){
					alert("아이디를 입력해주세요!!");
					return;
				}
				
				if(password == ""){
					alert("비밀번호를 입력하세요!!");
					return;
				}
				
				if(passwordCheck == ""){
					alert("비밀번호 확인을 입력하세요!!");
					return;
				}
								
				if(nickName == ""){
					alert("바나나에서 사용 할 이름을 입력하세요!!");
					return;
				}
				
				if(email == ""){
					alert("이메일을 입력하세요!!")
					return false;
				}
				
				
				$.ajax({
					type:"post",
					url:"/user/signUp",
					data:{"loginId":loginId, "password":password, "name":name, "nickName":nickName, "email":email},
					success:function(data){
						if(data.result == "success"){
							location.href="/user/signin_view";
						}else{
							
							alert("회원가입 실패!!");
						}
					},
					error:function(){
						alert("에러발생!!");
						}
					
				});	
					
			});
			
		});
	
	
	
	</script>
</body>
</html>
