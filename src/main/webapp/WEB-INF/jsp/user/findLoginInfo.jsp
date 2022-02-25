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

<title>아이디/비밀번호 찾기</title>
</head>

<body>

	<div class="fidWrap">
		<div class="d-flex justify-content-center">
			<h1 class="bananaTitle text-center">Banana</h1>
		</div>
		<div class="d-flex justify-content-center mt-5">
			<h3>아이디 / 비밀번호 찾기</h3>
		</div>
		<div class="findLogin d-flex justify-content-center mt-3">
			<div>
				<label class="mr-5">아이디<input type="radio" name="findLogin" value="loginId" checked="checked"/></label>
				<label>비밀번호<input type="radio" name="findLogin" value="LoginPw"/></label>
					
					<div id="findId">
						<input class="form-control" id="phoneNumberInput" type="text" placeholder="전화번호를 입력하세요.">
						<input class="btn form-control" id="findIdBtn" type="button" value="확인"/>
						<div> ${user.loginId}</div>
					</div>
					
					<div class="d-none" id="findPw">	
						<input class="form-control" id="loginIdInput" type="text" placeholder="아이디를 입력하세요.">
						<input class="form-control mt-3" id="emailInput" type="text" placeholder="이메일을 입력하세요.">
						<input class="btn form-control" id="findPwBtn" type="button" value="확인"/>
					</div>
					
					<div>
					</div>
			</div>
		</div>
		
	</div>
	
	
	<script>
		
		$(document).ready(function(){
			
			$("input[name=findLogin]").on("change", function(){
				
				if($(this).val() == "loginId"){
					$("#findId").removeClass("d-none");
					$("#findPw").addClass("d-none");
				}else{
					$("#findId").addClass("d-none");
					$("#findPw").removeClass("d-none");
				}
				
			});
			
			
			function checkPhoneNumber(){
				var phoneNumber = $("#phonNumberInput").val();
				var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
				return(regPhone.test(phoneNumber));
			}
			
			$("#phonNumberInput").blur(function(){
				var phoneNumber = $("#phonNumberInput").val();
			
				if(!checkPhoneNumber(phoneNumber)){
					alert("잘못된 전화번호 입니다.");
					return false;
				}
			
			});
			
			$("#findIdBtn").on("click", function(){
				var phoneNumber = $("#phoneNumberInput").val();
				
				if(phoneNumber == ""){
					alert("전화번호를 입력해주세요.")
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/findId",
					data:{"phoneNumber":phoneNumber},
					success:function(data){
						if(data.result == "success"){
							
						}else{
							alert("일치하는 아이디가 없습니다.")
						}
					},
					error:function(){
						
					}
					
				});
				
			});
			
			
			
		});
		
	
	</script>

</body>

</html>