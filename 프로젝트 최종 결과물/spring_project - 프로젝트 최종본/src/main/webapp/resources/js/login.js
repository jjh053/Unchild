/**
 * 로그인 스크립트
 */
function fn_action() {
	var userId = document.frm.userid.value;
	var password = document.frm.password.value;

	var maxLength = 20;

	if (userId == "") {
		document.getElementById("error").innerHTML = "아이디를 입력 해주세요.";
		document.frm.userid.focus();
		return false;
	}

	if (userId.includes(' ')) {
		document.getElementById("error").innerHTML = "아이디에 공백을 사용할 수 없습니다.";
		document.frm.userid.focus();
		return false;
	}

	if (userId.length > maxLength) {
		document.frm.userid.focus();
		return false;
	}

	if (password == "") {
		document.getElementById("error").innerHTML = "비밀번호를 입력 해주세요.";
		document.frm.password.focus();
		return false;
	}

	if (password.includes(' ')) {
		document.getElementById("error").innerHTML = "비밀번호에 공백을 사용할 수 없습니다.";
		document.frm.password.focus();
		return false;
	}

	// 모든 검증을 통과했다면, 폼 제출을 진행
	return true;
}

