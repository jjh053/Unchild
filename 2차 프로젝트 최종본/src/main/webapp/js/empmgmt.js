const hover = document.querySelectorAll('a.hover');
const menuBar = document.querySelector('.menu-bar');
const nav = document.querySelector('nav');
const wrap = document.querySelector('.wrap');

// 모바일 스크립트 코드
const hamburgerMenu = document.querySelector('.hamburger-menu');
const myPage = document.querySelector('#myPage');

hamburgerMenu.addEventListener('click', function() {
	nav.classList.toggle('active');

	if (nav.classList.contains('active')) {
		nav.prepend(myPage);
		myPage.style.display = 'flex';
		myPage.style.padding = '5px 0';
		myPage.style.backgroundColor = '#dde';

		let sectionHeight = section.offsetHeight;
		nav.style.height = `${sectionHeight}px`;
	} else {
		workerTitle.appendChild(myPage);
		myPage.style.display = '';
		nav.style.height = '';
	}
});
// 미디어테그, 네비게이션바 조작
const section = document.querySelector('section');

hover.forEach(link => {
	link.addEventListener("click", function(event) {
		event.preventDefault();
		if (nav.classList.contains('active') && window.matchMedia("(max-width: 430px)").matches) {
			nav.style.height = `${section.offsetHeight}px`
		}
	});
});

// 미디어테그 끝

let isHovered = false;

hover.forEach(button => {
	button.addEventListener('mouseover', () => {
		showMenuBar();
		isHovered = true;
	});
});

wrap.addEventListener("mouseleave", function() {
	if (!isHovered) {
		hideMenuBar();
	}
});

menuBar.addEventListener("mouseenter", function() {
	isHovered = true;
});

menuBar.addEventListener("mouseleave", function() {
	hideMenuBar();
});

section.addEventListener('click', function() {
	hideMenuBar();
})

function showMenuBar() {
	nav.classList.add('active');
}

function hideMenuBar() {
	nav.classList.remove('active');
}

hover.forEach(link => {
	link.addEventListener("click", function(event) {
		let myPage = document.querySelector("#myPage");
		let menuBar = document.querySelector(".menu-bar");
		let mainPage = document.querySelector(".wrap");
		let companyLogo = document.querySelector("#workerLogo");
		let ulLi = document.querySelectorAll(".menu-bar-content ul li");

		event.preventDefault();
		if (nav.classList.contains('active') && window.matchMedia("(max-width: 430px)").matches) {
			nav.style.height = `${section.offsetHeight}px`

			for (let i = 0; i < ulLi.length; i++) {
				ulLi[i].style.padding = '7px';
			}
			menuBar.prepend(myPage);
		}
	});
});

document.addEventListener('DOMContentLoaded', function() {
	// 폼 선택
	const form = document.querySelector('form');
	if (form) {
		form.addEventListener('keydown', function(event) {
			// 엔터 키가 눌렸을 때
			if (event.key === 'Enter') {
				// 이벤트의 기본 동작을 방지 (폼 제출 방지)
				event.preventDefault();
				console.log('폼 내에서 엔터 키 입력이 방지되었습니다.');
			}
		});
	}
})

function listEmployees() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/mes_project/emp?action=list', true);
    xhr.onload = function() {
        if (this.status == 200) {
            var employees = JSON.parse(this.responseText);
            renderEmployees(employees);
        } else {
            alert('직원 목록을 불러오는 데 실패했습니다.');
        }
    };
    xhr.send();
}

function renderEmployees(employees) {
    var tableBody = document.querySelector('.Staff_list tbody');
    tableBody.innerHTML = ''; // 기존 목록을 초기화

    employees.forEach(function(emp) {
        var row = `<tr>
            <td class="empno">${emp.empno}</td>
            <td>${emp.name}</td>
            <td>${emp.hiredate}</td>
            <td>${emp.duty}</td>
            <td>${emp.sal}</td>
            <td>${emp.deptno}</td>
        </tr>`;
        tableBody.innerHTML += row; // 테이블에 새로운 행을 추가
    });

    // 각 행의 empno에 대한 이벤트 리스너 설정
    document.querySelectorAll('.empno').forEach(function(cell) {
        cell.addEventListener('click', function() {
            var empno = cell.textContent;
            console.log(empno); // 로직 수행
            showModalWithEmpNo(empno);
        });
    });
}

function filterEmployees() {
    var searchInput = document.querySelector('.search_text');
    var searchTerm = searchInput.value.toLowerCase();
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/mes_project/emp?action=list', true);
    xhr.onload = function() {
        if (this.status == 200) {
            var employees = JSON.parse(this.responseText);
            var filteredEmployees = employees.filter(function(emp) {
                return emp.name.toLowerCase().includes(searchTerm) ||
                       emp.empno.toString().includes(searchTerm) ||
                       emp.deptno.toString().includes(searchTerm);
            });
            renderEmployees(filteredEmployees);
        } else {
            alert('직원 목록을 불러오는 데 실패했습니다.');
        }
    };
    xhr.send();
}

document.addEventListener('DOMContentLoaded', function() {
    listEmployees(); // 페이지 로딩 시 직원 목록을 불러옴

    var searchImage = document.querySelector('.glasses');
    searchImage.addEventListener('click', filterEmployees);

    document.querySelector('.search_text').addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            filterEmployees();
        }
    });
});

function showModalWithEmpNo(empno) {
    // 모달 창을 열고, 직원 번호를 입력 필드에 설정
    let modal = document.querySelector(".popup"); // 수정 모달 창의 선택자
    let modalOverlay = document.querySelector(".modal-overlay"); // 모달 오버레이의 선택자
    modalOverlay.style.display = "flex";
    modal.style.display = "inline-block";

    // 입력 필드에 직원 번호 설정
    document.getElementById('SearchEmpNo').value = empno;
}

// 목록 수정 창 열기
document.querySelector(".edit_button").addEventListener("click", function() {
	let EAI1 = document.querySelector(".popup");
	let modal_overlay = document.querySelector(".modal-overlay");
	modal_overlay.style.display = "flex";
	EAI1.style.display = "inline-block";
});

// 목록 수정 닫기
document.querySelector(".cancel").addEventListener("click", function() {
	let EAI1 = document.querySelector(".popup");
	EAI1.style.display = "none";
	let modal_overlay = document.querySelector(".modal-overlay");
	modal_overlay.style.display = "none";
	document.getElementById('SearchEmpNo').value = '';
	document.getElementById('editName').value = '';
	document.getElementById('editDuty').value = '';
	document.getElementById('editSal').value = '';
	document.getElementById('editDeptno').value = '';
	document.querySelector('.editMessage').innerHTML = '';
	document.querySelector('.searchMessage').innerHTML = '';
	document.querySelector('.editFailMessage').innerHTML = '';
});

function searchEmployee() {
	var empno = document.getElementById('SearchEmpNo').value;
	var searchMessage = document.querySelector('.searchMessage');

	if (!empno) {
		searchMessage.innerHTML = '<span style="color: red; font-size: 13px;">※직원 번호를 입력해주세요.</span>';
		return;
	}

	// AJAX 요청 생성
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/mes_project/emp?action=search&empno=' + encodeURIComponent(empno), true);
	xhr.onload = function() {
		if (this.status == 200) {
			var response = JSON.parse(this.responseText);

			// 서버에서 직원 정보가 없는 경우 오류 메시지 처리
			if (response.success === false) {
				searchMessage.innerHTML = '<span style="color: red; font-size: 13px;">※' + response.message + '</span>';
				return;
			}

			// 받은 데이터를 모달창의 입력 필드에 설정
			document.getElementById('editName').value = response.name || '';
			document.getElementById('editDuty').value = response.duty || '';
			document.getElementById('editSal').value = response.sal || '';
			document.getElementById('editDeptno').value = response.deptno || '';
		} else {
			searchMessage.innerHTML = '<span style="color: red; font-size: 13px;">※직원 정보를 조회하는데 실패했습니다.</span>';
		}
	};
	xhr.onerror = function() {
		searchMessage.innerHTML = '<span style="color: red; font-size: 13px;">※직원 정보 조회 요청에 실패했습니다.</span>';
	};
	xhr.send();
}

// 수정하기 버튼 이벤트 리스너
document.querySelector(".edit").addEventListener("click", function(event) {
	event.preventDefault(); // 폼 제출을 방지합니다.
	updateEmployee(); // 직원 수정 함수를 호출합니다.
});


function updateEmployee() {
	var empno = document.getElementById('SearchEmpNo').value;
	var queryString = 'action=edit&empno=' + encodeURIComponent(empno);

	// 수정할 필드의 값이 원본과 다른 경우에만 쿼리 문자열에 추가
	var nameField = document.getElementById('editName');
	if (nameField && nameField.value !== nameField.getAttribute('data-original')) {
		queryString += '&name=' + encodeURIComponent(nameField.value);
	}

	var dutyField = document.getElementById('editDuty');
	if (dutyField && dutyField.value !== dutyField.getAttribute('data-original')) {
		queryString += '&duty=' + encodeURIComponent(dutyField.value);
	}

	var salField = document.getElementById('editSal');
	if (salField && salField.value !== salField.getAttribute('data-original')) {
		queryString += '&sal=' + encodeURIComponent(salField.value);
	}

	var deptnoField = document.getElementById('editDeptno');
	if (deptnoField && deptnoField.value !== deptnoField.getAttribute('data-original')) {
		queryString += '&deptno=' + encodeURIComponent(deptnoField.value);
	}

	// AJAX 요청을 생성하고 설정합니다.
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/mes_project/emp?' + queryString, true);

	xhr.onload = function() {
		var editMessage = document.querySelector('.editMessage');
		var editFailMessage = document.querySelector('.editFailMessage');

		// 서버로부터 받은 응답을 JSON 객체로 파싱
		var response = JSON.parse(this.responseText);

		// 성공 여부에 따라 메시지 처리
		if (response.success) {
			closeModal();
			editMessage.innerHTML = `<span style="color: green; font-size: 15px;">※${response.message}</span>`;
			listEmployees();
			setTimeout(function() {
				// Clear the success message after 3 seconds
				editMessage.innerHTML = '';
			}, 5000);
		} else {
			// Display failure message
			editFailMessage.innerHTML = `<span style="color: red; font-size: 13px;">※${response.message}</span>`;
		}
	}

	xhr.send(); // GET 방식에서는 send 메소드에 본문을 전달하지 않습니다.
}

function deleteEmployee() {
	var empno = document.getElementById('SearchEmpNo').value; // 삭제할 직원 번호를 입력받음
	var searchMessage = document.querySelector('.searchMessage');
	if (empno == "") {
		searchMessage.innerHTML = '<span style="color: red; font-size: 13px;">※직원 번호를 입력해주세요.</span>';
		return;
	}
	var queryString = 'action=delete&empno=' + encodeURIComponent(empno);
	var editMessage = document.querySelector('.editMessage');
	var editFailMessage = document.querySelector('.editFailMessage');

	// AJAX 요청을 생성하고 설정
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/mes_project/emp?' + queryString, true);

	xhr.onload = function() {
		if (this.status == 200) {
			// 서버로부터 받은 응답을 JSON으로 파싱
			var response = JSON.parse(this.responseText);

			// 성공 여부에 따라 메시지 처리
			if (response.success) {
				closeModal();
				editMessage.innerHTML = '<span style="color: green; font-size: 15px;">※' + response.message + '</span>';
				listEmployees();
				setTimeout(function() {
					editMessage.innerHTML = '';
				}, 5000);
			} else {
				// 성공하지 못한 경우, 실패 메시지를 표시
				searchMessage.innerHTML = '<span style="color: red; font-size: 13px;">※' + response.message + '</span>';
			}
		} else {
			// HTTP 상태 코드가 200이 아닌 경우, 일반적인 실패 메시지를 표시
			editFailMessage.innerHTML = '<span style="color: red; font-size: 13px;">※직원 삭제에 실패했습니다.</span>';
		}
	};

	xhr.send();
}

function closeModal() {
	document.querySelector(".popup").style.display = "none";
	document.querySelector(".modal-overlay").style.display = "none";
	document.getElementById('SearchEmpNo').value = '';
	document.getElementById('editName').value = '';
	document.getElementById('editDuty').value = '';
	document.getElementById('editSal').value = '';
	document.getElementById('editDeptno').value = '';
	document.querySelector('.editMessage').innerHTML = '';
	document.querySelector('.searchMessage').innerHTML = '';
	// 페이지를 새로고침합니다.
	//location.reload();
}

// 직원 추가 창 열기
document.querySelector(".add_button").addEventListener("click", function() {
	let EAI2 = document.querySelector(".popup2");
	let modal_overlay = document.querySelector(".modal-overlay");
	modal_overlay.style.display = "flex";
	EAI2.style.display = "inline-block";
})

// 직원추가 취소
document.querySelector(".cancel2").addEventListener("click", function() {

	//창 닫기
	document.querySelector(".error2").innerHTML = "";
	document.querySelector(".error3").innerHTML = "";
	document.querySelector(".error4").innerHTML = "";
	document.querySelector(".error5").innerHTML = "";
	let EAI2 = document.querySelector(".popup2");
	EAI2.style.display = "none";
	let modal_overlay = document.querySelector(".modal-overlay");
	modal_overlay.style.display = "none";
});

// 숫자 체크
function isNumeric(value) {
	return /^-?\d+$/.test(value);
}

function validateForm() {
	var ename = document.getElementById("ename").value.trim();
	var hireDate = document.getElementById("hireDate").value.trim();
	var job = document.getElementById("job").value.trim();
	var sal = document.getElementById("sal").value.trim();
	var deptno = document.getElementById("deptno").value.trim();

	// 입력값이 비어 있는지 확인

	if (ename == "") {
		displayErrorMessage(".error2", "※성명을 입력해주세요.");
		return false;
	}

	if (hireDate == "") {
		displayErrorMessage(".error3", "※채용 일자를 선택해주세요");
		return false;
	}

	if (job == "") {
		displayErrorMessage(".error4", "※직책을 입력해주세요");
		return false;
	}

	if (sal == "") {
		displayErrorMessage(".error5", "※연봉을 입력해주세요");
		return false;
	} else if (!isNumeric(sal)) {
		displayErrorMessage(".error5", "※숫자만 입력하세요.");
		return false;
	}

	if (deptno == "") {
		displayErrorMessage(".error6", "※부서 번호를 입력해주세요");
		return false;
	} else if (!isNumeric(deptno)) {
		displayErrorMessage(".error6", "※숫자만 입력하세요.");
		return false;
	}

	// 모든 조건이 충족되면 유효한 입력이므로 true 반환
	return true;
}

function displayErrorMessage(selector, message) {
	let errorDiv = document.querySelector(selector);
	errorDiv.innerHTML = message;
	errorDiv.style.color = "red";

	// 3초 후에 오류 메시지를 지움
	setTimeout(function() {
		errorDiv.innerHTML = "";
	}, 3000);
}

document.addEventListener('DOMContentLoaded', (event) => {
	setTimeout(function() {
		var messageElement = document.getElementById('error-message');
		if (messageElement) {
			messageElement.style.display = 'none';
		}
	}, 3000); // 3초 후 실행
});

// 직원추가
document.querySelector(".add_eaib").addEventListener("click", function() {

	if (validateForm()) {
		// 입력값이 유효할 경우 모달 창 닫기
		let EAI2 = document.querySelector(".popup2");
		EAI2.style.display = "none";
		let modal_overlay = document.querySelector(".modal-overlay");
		modal_overlay.style.display = "none";
	}
});

document.querySelector(".mybutton").addEventListener("click", () => {
	window.open("mypage", '_blank', 'width = 630, height = 470, top=100, left=100');
});
