<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
<style>
@font-face {
	font-family: "SOYOMapleBoldTTF";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/SOYOMapleBoldTTF.woff2")
		format("woff2");
	font-weight: 400;
	font-style: normal;
}
</style>
</head>
<body>
	<header>
		<div class="logo">
			<img src="${pageContext.request.contextPath}/images/logo.png"
				class="logo">
		</div>
	</header>
	<nav>
		<form name="frm" action="login" method="post"
			onsubmit="return fn_action();">
			<div class="loginBox">
				<div class="input">
					<input type="text" name="userid" class="input1" autofocus
						placeholder="아이디"><br> <input
						type="password" name="password" class="input2" placeholder="비밀번호"
						>
				</div>
				<div id="error" style="color: red;">
					<%=request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : ""%>
				</div>
				<button type="submit" name="login" class="btn1">
					<strong>로그인</strong>
				</button>
			</div>
		</form>
		<div class="accountBox">
			<button>아이디 찾기</button>
			<button>비밀번호 찾기</button>
			<button type="button" onclick="location.href='signup'">계정
				등록</button>
		</div>
	</nav>
	<div id="modal-background" class="modal-background"
		style="display: none;">
		<!-- 모달 컨텐츠 -->
		<div class="modal-content">
			<p id="modal-text"></p>
			<span class="close-button">&times;</span>
		</div>
	</div>
	<script>
	// 모달 열기
	function openModal(message) {
		document.getElementById('modal-text').innerText = message;
		document.getElementById('modal-background').style.display = 'block';
	}

	// 모달 닫기
	function closeModal() {
		document.getElementById('modal-background').style.display = 'none';
	}

	// 닫기 버튼에 이벤트 리스너 추가
	document.querySelector('.close-button').addEventListener('click', closeModal);

	// 배경 클릭시 모달 닫기
	window.onclick = function(event) {
		if (event.target == document.getElementById('modal-background')) {
			closeModal();
		}
	}
	
	 function getQueryParam(param) {
	        var searchParams = new URLSearchParams(window.location.search);
	        return searchParams.get(param);
	    }

	    // 페이지 로딩 시 메시지 처리
	    window.onload = function() {
	        var message = getQueryParam("message");
	        if (message) {
	            openModal(decodeURIComponent(message));
	            // 현재 URL에서 message 파라미터 제거
	            var newUrl = window.location.pathname;
	            var searchParams = new URLSearchParams(window.location.search);
	            searchParams.delete("message"); // message 파라미터 삭제
	            if (searchParams.toString().length > 0) {
	                newUrl += "?" + searchParams.toString();
	            }
	            window.history.pushState({}, '', newUrl); // URL 상태 업데이트
	        }
	    };
	</script>
	<script src="js/login.js"></script>
</body>

</html>