/**
 * 
 */
// 검색 메소드
document.addEventListener("DOMContentLoaded", function() {
	document.getElementById("SearchEmpNo").focus();
});

// 조회 버튼 이벤트
document.getElementById('search').addEventListener('click', searchEmployee);

function searchEmployee() {
	var empno = document.getElementById('SearchEmpNo').value;
	var searchMessage = document.querySelector('.searchMessage');

	if (!empno) {
		searchMessage.innerHTML = '<span style="color: red; font-size: 13px;">※직원 번호를 입력해주세요.</span>';
		document.getElementById('SearchEmpNo').focus();
		return;
	}

	// AJAX 요청 생성
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/mes_project/signup?action=search&empno=' + encodeURIComponent(empno), true);
	xhr.onload = function() {
		if (this.status == 200) {
			var response = JSON.parse(this.responseText);

			if (response.success === false) {
				// `success`가 false인 경우 오류 메시지 표시 및 이름 필드 비우기
				searchMessage.innerHTML = '<span style="color: red; font-size: 13px;">※' + response.message + '</span>';
				document.getElementById('name').value = ''; // 이름 필드 비우기
				document.getElementById('SearchEmpNo').focus();
				return;
			}

			// 성공적으로 응답을 받았다면, 여기서 실패 메시지창의 내용도 비움
			searchMessage.innerHTML = '';

			// 'name' 필드를 채우는 변수
			var messageData = JSON.parse(response.message);

			document.getElementById('name').value = messageData.name || '';
			document.getElementById('userId').focus();
		} else {
			searchMessage.innerHTML = '<span style="color: red; font-size: 13px;">※직원 정보를 조회하는데 실패했습니다.</span>';
			document.getElementById('name').value = ''; // 조회 실패시 이름 필드 비우기
			document.getElementById('SearchEmpNo').focus();
		}
	};
	xhr.onerror = function() {
		searchMessage.innerHTML = '<span style="color: red; font-size: 13px;">※직원 정보 조회 요청에 실패했습니다.</span>';
		document.getElementById('name').value = ''; // 요청 실패시 이름 필드 비우기
		document.getElementById('SearchEmpNo').focus();
	};
	xhr.send();
}

// 계정 등록 버튼 이벤트
document.getElementById('update').addEventListener('click', updateAccount)
// 계정 등록
function updateAccount() {
	var empno = document.getElementById('SearchEmpNo').value.trim();
	var userId = document.getElementById('userId').value.trim();
	var password = document.getElementById('password').value.trim();
	var confirmPassword = document.getElementById('confirmPassword').value.trim();
	var email = document.getElementById('email-input').value.trim();
	var tel = document.getElementById('tel').value.trim();

	// 폼체크
	var updateMessage = document.getElementById('updateMessage');
	var idError = document.querySelector('.idLength');
	var passError = document.querySelector('.passLength');
	var mailError = document.querySelector('.mailCheck');
	var telError = document.querySelector('.telCheck');
	var searchMessage = document.querySelector('.searchMessage');

	[idError, passError, mailError, telError, searchMessage].forEach(el => el.innerHTML = '');

	// 유효성 검사
	if (!empno) {
		searchMessage.innerHTML = '<span style="color: red; font-size: 13px;">※먼저 직원번호를 조회 해주세요.</span>';
		document.getElementById('SearchEmpNo').focus();
		return;
	}
	if (!userId) {
		idError.innerHTML = '※아이디를 입력해주세요.';
		document.getElementById('userId').focus();
		return;
	}
	if (userId.length < 5 || userId.length > 20) {
		idError.innerHTML = '<span style="color: red; font-size: 13px;">※아이디는 5자 이상, 20자 이하로 해주세요.</span>';
		document.getElementById('userId').focus();
		return;
	}

	if (!password) {
		passError.innerHTML = '※비밀번호를 입력해주세요.';
		document.getElementById('password').focus();
		return;
	}
	if (password.length < 8 || password.length > 20) {
		passError.innerHTML = '<span style="color: red; font-size: 13px;">※비밀번호는 8자 이상, 20자 이하로 해주세요.</span>';
		document.getElementById('password').focus();
		return;
	}

	// 이메일 형식 검증
	var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	if (!emailPattern.test(email)) {
		mailError.innerHTML = "유효하지 않은 이메일 형식입니다.";
		document.getElementById('email-input').focus();
		return;
	}

	// 전화번호 형식 검증
	var telPattern = /^\d{2,3}-\d{3,4}-\d{4}$/;
	if (!telPattern.test(tel)) {
		telError.innerHTML = "유효하지 않은 전화번호 형식입니다. (예: 010-1234-5678)";
		document.getElementById('tel').focus();
		return;
	}

	var formData = JSON.stringify({
		action: "update",
		empno: empno,
		userId: userId,
		password: password,
		confirmPassword: confirmPassword,
		email: email,
		tel: tel,
	});

	var xhr = new XMLHttpRequest();
	xhr.open("POST", "/mes_project/signup?action=update", true);
	xhr.setRequestHeader("Content-Type", "application/json");

	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			var response = JSON.parse(this.responseText);
			if (response.success === true) {
				window.location.href = "/mes_project/login?message=" + encodeURIComponent(response.message); // 회원가입에 성공하셨습니다
			} else {
				// 응답에 실패했을 때의 로직
			if (response.message === "이미 존재하는 아이디 입니다.") {
				idError.innerHTML = '<span style="color: red; font-size: 13px;">※' + response.message + '</span>';
				document.getElementById('userId').select();
			} else if (response.message === "비밀번호가 일치하지 않습니다."){
			 	passError.innerHTML = '<span style="color: red; font-size: 13px;">※' + response.message + '</span>';
			} else {
				updateMessage.innerHTML = '<span style="color: red; font-size: 13px;">※' + response.message + '</span>';
			}
			}
		}
	};
	console.log(formData);
	xhr.send(formData);
};

// 비밀번호 확인
document.addEventListener('DOMContentLoaded', function() {
	const togglePassword = document.getElementById('togglePassword');
	const toggleConfirmPassword = document.getElementById('toggleConfirmPassword');
	const password = document.getElementById('password');
	const confirmPassword = document.getElementById('confirmPassword');
	const confirmPassLength = document.querySelector('.confirmPassLength');

	togglePassword.addEventListener('click', function() {
		const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
		password.setAttribute('type', type);
		this.classList.toggle('fa-eye');
		this.classList.toggle('fa-eye-slash');
	});

	toggleConfirmPassword.addEventListener('click', function() {
		const type = confirmPassword.getAttribute('type') === 'password' ? 'text' : 'password';
		confirmPassword.setAttribute('type', type);
		this.classList.toggle('fa-eye');
		this.classList.toggle('fa-eye-slash');
	});

	confirmPassword.addEventListener('input', function() {
		if (password.value !== confirmPassword.value) {
			confirmPassLength.innerHTML = '<span style="color: red; font-size: 13px;">※비밀번호가 일치하지 않습니다.</span>';
		} else {
			confirmPassLength.innerHTML = '';
		}
	});
});

// 이메일 인풋창 예시 선택
document.addEventListener('DOMContentLoaded', function() {
	var emailInput = document.getElementById('email-input');
	var suggestionsPanel = document.getElementById('suggestions');

	var emailDomains = ['gmail.com', 'naver.com', 'daum.net'];

	emailInput.addEventListener('input', function() {
		var inputVal = this.value;
		suggestionsPanel.innerHTML = '';
		if (inputVal.includes('@')) {
			var filteredDomains = emailDomains.filter(function(domain) {
				return domain.startsWith(inputVal.split('@')[1]);
			});

			filteredDomains.forEach(function(domain) {
				var div = document.createElement('div');
				div.innerHTML = inputVal.split('@')[0] + '@' + domain;
				div.addEventListener('click', function() {
					emailInput.value = this.textContent;
					suggestionsPanel.innerHTML = '';
				});
				suggestionsPanel.appendChild(div);
			});
		}
	});
});