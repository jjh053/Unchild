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

var currentPage = 1;
var totalPages = 1;

function setupPagination() {
	listEmployees();
	attachSearchEventListeners(); // 검색 관련 이벤트 리스너 설정
}

document.querySelector(".showAll").addEventListener("click", listEmployees);

// 직원 전체 목록
function listEmployees() {
	var sortParams = document.getElementById("sortField").value.split(",");
	var xhr = new XMLHttpRequest();
	xhr.open('GET', `/mes_project/staffmgmt/list?page=${currentPage}&size=10&sortField=${sortParams[0]}&sortOrder=${sortParams[1]}`, true);

	xhr.onload = function() {
		if (this.status === 200) {
			var response = JSON.parse(this.responseText);
			totalPages = response.totalPages;
			renderEmployees(response.items);
			renderPagination();
		} else {
			alert('직원 목록을 불러오는 데 실패했습니다.');
		}
	};

	xhr.onerror = function() {
		alert('네트워크 오류가 발생했습니다. 다시 시도해 주세요.');
	};

	xhr.send();
}
// end

// 페이징
function renderPagination() {
	const container = document.getElementById('pagination');
	container.innerHTML = '';

	const maxButtons = 5; // 한 번에 표시할 페이지 버튼 수

	// 시작 페이지와 끝 페이지 계산
	let startPage = Math.max(1, currentPage - Math.floor(maxButtons / 2));
	let endPage = Math.min(startPage + maxButtons - 1, totalPages);

	// 이전 버튼
	const prevButton = document.createElement('button');
	prevButton.textContent = '< 이전';
	prevButton.onclick = function() { changePage(currentPage - 1); };
	prevButton.disabled = currentPage === 1;
	container.appendChild(prevButton);

	// 페이지 버튼 그리기
	for (let i = startPage; i <= endPage; i++) {
		const pageButton = document.createElement('button');
		pageButton.textContent = i;
		pageButton.onclick = function() { changePage(i); };
		pageButton.style.background = i === currentPage ? '#3498DB' : '#fff';
		pageButton.style.color = i === currentPage ? '#fff' : '#000';

		// 마우스가 버튼 위에 있을 때의 이벤트 핸들러
		pageButton.onmouseover = function() {
			this.style.backgroundColor = '#95a5a6'; // 마우스 호버 시 색상 변경
		};

		// 마우스가 버튼을 떠났을 때의 이벤트 핸들러
		pageButton.onmouseout = function() {
			this.style.background = i === currentPage ? '#3498DB' : '#fff'; // 원래 색상으로 복귀
		};
		
		container.appendChild(pageButton);
	}

	// 다음 버튼
	const nextButton = document.createElement('button');
	nextButton.textContent = '다음 >';
	nextButton.onclick = function() { changePage(currentPage + 1); };
	nextButton.disabled = currentPage === totalPages;
	container.appendChild(nextButton);
}

// 페이지 함수
function changePage(newPage) {
	if (newPage < 1 || newPage > totalPages) {
		console.error("그런 페이지 없다");
		alert("잘못된 요청");
		return;
	}
	currentPage = newPage;
	listEmployees();
}

// 리스트 그리는거
function renderEmployees(employees) {
	var tableBody = document.querySelector('.Staff_list tbody');
	tableBody.innerHTML = employees.map(emp => `
        <tr>
            <td class="empno">${emp.staffno}</td>
            <td>${emp.sname}</td>
            <td>${emp.hiredate}</td>
            <td>${emp.sduty}</td>
            <td>${emp.sal}</td>
            <td>${emp.offino}</td>
        </tr>
    `).join('');
	attachEventListeners();
}

function attachEventListeners() {
	document.querySelectorAll('.empno').forEach(cell => {
		cell.onclick = handleEmpnoClick; // 리스너 재설정 방식 변경
	});
}

// 직원번호 클릭이벤트 조회창으로
function handleEmpnoClick() {
	var empno = this.textContent;
	console.log("Employee Number:", empno);
	showModalWithEmpNo(empno);
}

// 엔터키로 검색할수 있게 하는 함수
function attachSearchEventListeners() {
	document.querySelector('.glasses').addEventListener('click', filterEmployees);
	document.querySelector('.search_text').addEventListener('keypress', function(e) {
		if (e.key === 'Enter') {
			filterEmployees();
		}
	});
}

document.addEventListener('DOMContentLoaded', setupPagination);

// 검색 함수 수정 필요 검색할 전달인자 전달해야함
function filterEmployees() {
    var searchInput = document.querySelector('.search_text');
    var searchTerm = searchInput.value.trim().toLowerCase();
    var searchField = document.getElementById("searchField").value;
    var sortParams = document.getElementById("sortField").value.split(",");
    var xhr = new XMLHttpRequest();

    // 검색 필드와 검색어를 검증하고 URL 구성
    var queryString = `page=${currentPage}&size=10&sortField=${sortParams[0]}&sortOrder=${sortParams[1]}`;
    if (searchField && searchTerm) {
        queryString += `&${searchField}=${encodeURIComponent(searchTerm)}`;
    }
    var url = `/mes_project/staffmgmt/list?${queryString}`;

    xhr.open('GET', url, true);
    xhr.onload = function() {
        if (this.status == 200) {
            var response = JSON.parse(this.responseText);
            totalPages = response.totalPages;
            renderEmployees(response.items);
            renderPagination();
        } else {
            try {
                var errorResponse = JSON.parse(this.responseText);
                alert(errorResponse.message);
            } catch(e) {
                alert('직원 목록을 불러오는 데 실패했습니다.');
            }
        }
    };
    xhr.send();
}


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
	var empno = document.getElementById('SearchEmpNo').value;  // 직원 번호 입력 필드에서 값 가져오기
	var searchMessage = document.querySelector('.searchMessage'); // 검색 메시지를 표시할 요소 선택

	if (!empno) { // 직원 번호가 입력되지 않은 경우
		searchMessage.innerHTML = '<span style="color: red; font-size: 13px;">※직원 번호를 입력해주세요.</span>';
		return; // 함수 실행 중단
	}

	// AJAX 요청 생성
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/mes_project/staffmgmt/search?empno=' + encodeURIComponent(empno), true);
	xhr.onload = function() { // 요청 완료 시 처리 로직
		if (this.status == 200) { // 성공적으로 응답 받은 경우
			var response = JSON.parse(this.responseText); // 응답 텍스트를 JSON 객체로 변환

			if (response.success === false) { // 서버에서 직원 정보를 찾지 못한 경우
				searchMessage.innerHTML = '<span style="color: red; font-size: 13px;">※' + response.message + '</span>';
				return; // 함수 실행 중단
			}
			// 받은 데이터를 모달창의 입력 필드에 설정
			console.log(response);
			document.getElementById('editName').value = response.sname || ''; // 이름 설정
			document.getElementById('editDuty').value = response.sduty || ''; // 직책 설정
			document.getElementById('editSal').value = response.sal || ''; // 급여 설정
			document.getElementById('editDeptno').value = response.offino || ''; // 부서 번호 설정
		} else { // 요청이 실패한 경우
			searchMessage.innerHTML = '<span style="color: red; font-size: 13px;">※직원 정보를 조회하는데 실패했습니다.</span>';
		}
	};
	xhr.onerror = function() { // 요청 처리 중 오류 발생 시
		searchMessage.innerHTML = '<span style="color: red; font-size: 13px;">※직원 정보 조회 요청에 실패했습니다.</span>';
	};
	xhr.send(); // 요청 전송
}

// 수정하기 버튼 이벤트 리스너
document.querySelector(".edit").addEventListener("click", function(event) {
	event.preventDefault(); // 폼 제출을 방지
	updateEmployee(); // 직원 수정 함수를 호출
});


function updateEmployee() {
	var empno = document.getElementById('SearchEmpNo').value;
	var data = {
		staffno: empno,
		sname: document.getElementById('editName').value,
		sduty: document.getElementById('editDuty').value,
		sal: document.getElementById('editSal').value,
		offino: document.getElementById('editDeptno').value
	};

	if (data.sname === document.getElementById('editName').getAttribute('data-original')) {
		delete data.sname;
	}
	if (data.sduty === document.getElementById('editDuty').getAttribute('data-original')) {
		delete data.sduty;
	}
	if (data.sal === document.getElementById('editSal').getAttribute('data-original')) {
		delete data.sal;
	}
	if (data.deptno === document.getElementById('editDeptno').getAttribute('data-original')) {
		delete data.deptno;
	}

	// AJAX 요청을 생성
	var xhr = new XMLHttpRequest();
	xhr.open('POST', '/mes_project/staffmgmt/update', true);
	xhr.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');

	xhr.onload = function() {
		if (xhr.status === 200) {
			var response = JSON.parse(xhr.responseText);
			var editMessage = document.querySelector('.editMessage');
			var editFailMessage = document.querySelector('.editFailMessage');

			// 성공 여부에 따라 메시지 처리
			if (response.success) {
				closeModal();
				editMessage.innerHTML = `<span style="color: green; font-size: 15px;">※${response.message}</span>`;
				listEmployees();
				setTimeout(function() {
					editMessage.innerHTML = '';
				}, 3000);
			} else {
				editFailMessage.innerHTML = `<span style="color: red; font-size: 13px;">※${response.message}</span>`;
			}
		} else {
			console.error('An error occurred:', xhr.responseText);
		}
	};

	xhr.onerror = function() {
		console.error('An error occurred during the request.');
	};

	xhr.send(JSON.stringify(data));
}

function deleteEmployee() {
	var empno = document.getElementById('SearchEmpNo').value; // 삭제할 직원 번호를 입력받음
	var searchMessage = document.querySelector('.searchMessage');
	if (empno == "") {
		searchMessage.innerHTML = '<span style="color: red; font-size: 13px;">※직원 번호를 입력해주세요.</span>';
		return;
	}
	var queryString = 'empno=' + encodeURIComponent(empno);
	var editMessage = document.querySelector('.editMessage');
	var editFailMessage = document.querySelector('.editFailMessage');

	// AJAX 요청을 생성하고 설정
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/mes_project/staffmgmt/delete?' + queryString, true);

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

	// 인풋 창 비우기
	document.getElementById("sname").value = "";
	document.getElementById("hireDate").value = "";
	document.getElementById("sduty").value = "";
	document.getElementById("sal").value = "";
	document.getElementById("offino").value = "";

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
	var sname = document.getElementById("sname").value.trim();
	var hireDate = document.getElementById("hireDate").value.trim();
	var sduty = document.getElementById("sduty").value.trim();
	var sal = document.getElementById("sal").value.trim();
	var offino = document.getElementById("offino").value.trim();

	// 입력값이 비어 있는지 확인

	if (sname == "") {
		displayErrorMessage(".error2", "※성명을 입력해주세요.");
		return false;
	}

	if (hireDate == "") {
		displayErrorMessage(".error3", "※채용 일자를 선택해주세요");
		return false;
	}

	if (sduty == "") {
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

	if (offino == "") {
		displayErrorMessage(".error6", "※부서 번호를 입력해주세요");
		return false;
	} else if (!isNumeric(offino)) {
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

window.onload = function() {
	setTimeout(function() {
		var messageContainer = document.querySelector('.addInfo');
		if (messageContainer) {
			messageContainer.textContent = '';
		}
	}, 3000);
};

document.querySelector(".mybutton").addEventListener("click", () => {
	window.open("/mes_project/mypage", '_blank', 'width = 630, height = 470, top=100, left=100');
});
