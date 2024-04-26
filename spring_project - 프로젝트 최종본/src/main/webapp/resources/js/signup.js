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
	var empno = document.getElementById('SearchEmpNo').value;  // 직원 번호 입력 필드에서 값 가져오기
	var searchMessage = document.querySelector('.searchMessage'); // 검색 메시지를 표시할 요소 선택

	if (!empno) { // 직원 번호가 입력되지 않은 경우
		searchMessage.innerHTML = '<span style="color: red; font-size: 13px;">※직원 번호를 입력해주세요.</span>';
		return; // 함수 실행 중단
	}

	// AJAX 요청 생성
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/mes_project/signup/search?empno=' + encodeURIComponent(empno), true);
	xhr.onload = function() { // 요청 완료 시 처리 로직
		if (this.status == 200) { // 성공적으로 응답 받은 경우
			console.log(xhr.responseText);
			var response = JSON.parse(this.responseText); // 응답 텍스트를 JSON 객체로 변환


			if (response.success === false) { // 서버에서 직원 정보를 찾지 못한 경우
				searchMessage.innerHTML = '<span style="color: red; font-size: 13px;">※' + response.message + '</span>';
				document.getElementById('name').value = ''; // 이름 필드 비우기
				document.getElementById('SearchEmpNo').focus();
				return;
			} else {
				// 받은 데이터를 모달창의 입력 필드에 설정
				console.log(response);
				document.getElementById('name').value = response.sname || '';
				document.querySelector('.searchMessage').innerHTML = '';
				document.getElementById('userId').focus();
			}



		} else { // 요청이 실패한 경우
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
	xhr.send(); // 요청 전송
}

// 계정 등록 버튼 이벤트
document.getElementById('update').addEventListener('click', updateAccount)
// 계정 등록

document.addEventListener("DOMContentLoaded", function() {
	// ID Message
	var userIdInput = document.getElementById('userId');
	var userIdMsg = document.getElementById('idMsg');
	userIdInput.addEventListener('focus', function() {
		userIdMsg.style.display = 'block';
	});
	userIdInput.addEventListener('blur', function() {
		userIdMsg.style.display = 'none';
	});

	// Password Info
	var passwordInput = document.getElementById('password');
	var passwordInfo = document.getElementById('passInfo');
	passwordInput.addEventListener('focus', function() {
		passwordInfo.style.display = 'block';
	});
	passwordInput.addEventListener('blur', function() {
		passwordInfo.style.display = 'none';
	});

	// Telephone Type
	var telInput = document.getElementById('tel');
	var telType = document.getElementById('telType');
	telInput.addEventListener('focus', function() {
		telType.style.display = 'block';
	});
	telInput.addEventListener('blur', function() {
		telType.style.display = 'none';
	});

	// Email Type
	var emailInput = document.getElementById('email-input');
	var mailType = document.getElementById('mailType');
	emailInput.addEventListener('focus', function() {
		mailType.style.display = 'block';
	});
	emailInput.addEventListener('blur', function() {
		mailType.style.display = 'none';
	});
});

function updateAccount() {
	var empno = document.getElementById('SearchEmpNo').value.trim();
	var userid = document.getElementById('userId').value.trim();
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

	var userIdMsg = document.getElementById('idMsg');
	var passwordInfo = document.getElementById('passInfo');
	var telType = document.getElementById('telType');
	var mailType = document.getElementById('mailType');

	[idError, passError, mailError, telError, searchMessage].forEach(el => el.innerHTML = '');

	// 유효성 검사
	if (!empno) {
		searchMessage.innerHTML = '<span style="color: red; font-size: 13px;">※먼저 직원번호를 조회 해주세요.</span>';
		setTimeout(() => { searchMessage.innerHTML = ''; }, 3000);
		document.getElementById('SearchEmpNo').focus();
		return;
	}
	if (!userid) {
		idError.innerHTML = '※아이디를 입력해주세요.';
		setTimeout(() => { idError.innerHTML = ''; }, 3000);
		document.getElementById('userId').focus();
		userIdMsg.style.display = 'none';
		return;
	}
	if (userid.length < 5 || userid.length > 20) {
		idError.innerHTML = '<span style="color: red; font-size: 13px;">※아이디는 5자 이상, 20자 이하로 해주세요.</span>';
		setTimeout(() => { idError.innerHTML = ''; }, 3000);
		document.getElementById('userId').focus();
		userIdMsg.style.display = 'none';
		return;
	}

	if (!password) {
		passError.innerHTML = '※비밀번호를 입력해주세요.';
		setTimeout(() => { passError.innerHTML = ''; }, 3000);
		document.getElementById('password').focus();
		passwordInfo.style.display = 'none';
		return;
	}
	if (password.length < 8 || password.length > 20) {
		passError.innerHTML = '<span style="color: red; font-size: 13px;">※비밀번호는 8자 이상, 20자 이하로 해주세요.</span>';
		setTimeout(() => { passError.innerHTML = ''; }, 3000);
		document.getElementById('password').focus();
		passwordInfo.style.display = 'none';
		return;
	}

	var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	if (!emailPattern.test(email)) {
		mailError.innerHTML = "유효하지 않은 이메일 형식입니다.";
		setTimeout(() => { mailError.innerHTML = ''; }, 3000);
		document.getElementById('email-input').focus();
		mailType.style.display = 'none';
		return;
	}

	var telPattern = /^\d{2,3}-\d{3,4}-\d{4}$/;
	if (!telPattern.test(tel)) {
		telError.innerHTML = "유효하지 않은 전화번호 형식입니다. (예: 010-1234-5678)";
		setTimeout(() => { telError.innerHTML = ''; }, 3000);
		document.getElementById('tel').focus();
		telType.style.display = 'none';
		return;
	}

	var formData = JSON.stringify({
		staffno: empno,
		userid: userid,
		password: password,
		smail: email,
		sphone: tel,
	});

	var xhr = new XMLHttpRequest();
	xhr.open("POST", "/mes_project/signup/update", true);
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
				} else if (response.message === "비밀번호가 일치하지 않습니다.") {
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