<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 등록</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/signup.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<style>
@font-face {
	font-family: "SOYOMapleBoldTTF";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/SOYOMapleBoldTTF.woff2")
		format("woff2");
	font-weight: 400;
	font-style: normal;
}

body {
	font-family: "SOYOMapleBoldTTF";
}

.search {
	cursor: pointer;
}

#emailConfirmCheck {
	display: none;
}

#mailConfirmCode {
	width: 314px;
}
</style>
</head>
<body>
	<h1>계정 등록</h1>
	<div class="signupBox">
		<div class="searchBox">
			<label for="SearchEmpNo">직원번호 검색</label><input type="text"
				id="SearchEmpNo" name="SearchEmpNo">
			<div class="searchMessage"></div>
			<button type="button" name="action" value="search" class="search" id="search">조회</button>
		</div>
		<div class="nameBox">
			<label for="name">성명</label> <input type="text" id="name" name="name"
				readonly placeholder="&nbsp; 직원 번호를 조회하면, 해당하는 직원의 이름이 표시됩니다.">
		</div>
	</div>
	<div id="account-form">
		<div class="idBox">
			<label for="userId">아이디</label> <input type="text" id="userId"
				name="userId">
			<div class="idLength"></div>
		</div>
		<div class="passBox">
			<label for="password">비밀번호</label> <input type="password"
				id="password" name="password"> <i id="togglePassword"
				class="fas fa-eye"></i>
			<div class="passLength"></div>
		</div>
		<div class="confirmPassBox">
			<label for="confirmPassword">비밀번호 확인</label> <input type="password"
				id="confirmPassword" name="confirmPassword"> 
				<i id="toggleConfirmPassword" class="fas fa-eye"></i>
			<div class="confirmPassLength"></div>
		</div>
		<div id="email-input-container">
			<label for="email-input">Email</label> <input type="email"
				id="email-input" name="email" autocomplete="off"
				placeholder="ex.jcompany@example.com">
			<div id="suggestions"></div>
			<div class="mailCheck">
				<button type="button" name="sendConfirm" class="search"
					id="sendConfirm">인증번호</button>
			</div>
		</div>
		<div id="emailConfirmCheck">
			<label for="email-keyCode">인증번호</label> <input type="text"
				id="mailConfirmCode" name="confirm" autocomplete="off"
				placeholder="인증번호를 입력해주세요">
			<div class="keyCodeCheck">
				<button type="button" name="conBtn" class="search" id="conBtn">인증확인</button>
			</div>
		</div>
		<div class="telBox">
			<label for="tel">전화번호</label> <input type="text" id="tel" name="tel"
				placeholder="ex.010-1234-5678">
			<div class="telCheck"></div>
		</div>
		<div class="submitArea">
			<div id="updateMessage"></div>
			<button type="submit" id="update" name="action" value="update"
				class="update" onclick="updateAccount()">계정 등록</button>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/signup.js"></script>

	<script>
	
		let mailComfirm = document.querySelector("#sendConfirm");
		let emailInput = document.querySelector("#email-input");
		let emailConfirmCheck = document.querySelector("#emailConfirmCheck");
		let mailConfirmCode = document.querySelector("#mailConfirmCode");
		let userId = document.querySelector("#id");
		let conBtn = document.querySelector("#conBtn");
		
		mailComfirm.addEventListener("click", () => {
			if(emailInput.value.trim() != "") {
				if(emailInput.value.indexOf("@") > -1 && emailInput.value.indexOf(".") > -1) {
					emailConfirmCheck.style.display = "flex";
					document.querySelector("#account-form").style.height = "280px";
					doConfirm();
				} else {
					alert("이메일 양식을 확인해주세요.");
				}
			} else {
				alert("이메일을 입력해주세요.");
			}	
		});
		
		conBtn.addEventListener("click", () => {
			if(mailConfirmCode.value.trim() != "") {
				confirmChk();
			} else {
				alert("인증번호를 확인해주세요.");
			}
			
		});
		
		function doConfirm() {
			let xhr = new XMLHttpRequest();
			xhr.open("post", "mailGo", true);
		    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	        
		    console.log(emailInput.value);
		    let param = "email=" + emailInput.value;
            if(document.querySelector("#userId").value.trim() != "") {
            	
            }
		    xhr.send(param);
		    
		    xhr.onload = function() {
	            if (xhr.readyState === 4) {
	                if (xhr.status === 200) {
	                    console.log('이메일이 성공적으로 전송되었습니다.');
	                } else {
	                    console.error('이메일 전송 실패:', xhr.statusText);
	                }
	            }
	        };
		}
		
		function confirmChk() {
			let xhr = new XMLHttpRequest();
			
			xhr.open("post", "mailGo", true);
		    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			let param = "confirm=" + document.querySelector("#mailConfirmCode").value;
			console.log("param : " + param);
			console.log("confirm.value : " + document.querySelector("#mailConfirmCode").value);
			
			xhr.send(param);
		    xhr.onload = function() {
		        let data = xhr.responseText;
		        console.log("data : " + data);
		        if(0 == data) {
					alert("인증이 완료되었습니다!");
					document.querySelector("#account-form").style.height = "";
					emailConfirmCheck.style.display = "none";
		        } else {
		        	alert("인증번호를 확인해주세요.");
		        }
	        };
		}
	</script>
</body>
</html>