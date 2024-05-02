/**
 * 
 */
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

const section = document.querySelector('section');

hover.forEach(link => {
	link.addEventListener("click", function(event) {
		event.preventDefault();
		if (nav.classList.contains('active') && window.matchMedia("(max-width: 430px)").matches) {
			nav.style.height = `${section.offsetHeight}px`
		}
	});
});

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

section.addEventListener("click", function() {
	hideMenuBar();
})

function showMenuBar() {
	nav.classList.add('active');
}

function hideMenuBar() {
	nav.classList.remove('active');
}

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

document.querySelector(".mybutton").addEventListener("click", () => {
	window.open("/mes_project/mypage", '_blank', 'width = 630, height = 470, top=100, left=100');
});

// 휴가 신청 내역 로드
function fetchAbsentList() {
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "/mes_project/absent/list", true); // 주소 수정
	xhr.onload = function() {
		if (xhr.status >= 200 && xhr.status < 300) {
			// 서버 응답 처리
			var response = JSON.parse(xhr.responseText);
			updateVacationTable(response);
		} else {
			console.error("Request failed: ", xhr.statusText);
		}
	};
	xhr.onerror = function() {
		console.error("Request failed");
	};
	xhr.send();
}
document.addEventListener("DOMContentLoaded", function() {
	fetchAbsentList();
});

// 상태 업데이트
function updateVacationTable(data) {
	var tableBody = document.getElementById("vacationTableBody");
	tableBody.innerHTML = ""; // 테이블 내용 초기화
	data.forEach(function(absent) {
		var statusKorean = getStatusKorean(absent.status);
		var row = `<tr>
            <td><input type="checkbox" name="requestId" id="checkBox" value="${absent.id}"></td>
            <td>${absent.staffno}</td>
            <td>${absent.start_date} ~ ${absent.end_date}</td>
            <td>${absent.reason}</td>
            <td>${statusKorean}</td>
        </tr>`;
		tableBody.innerHTML += row;
	});
	checkboxEvent();
}

// 체크 박스 이벤트
function checkboxEvent() {
	const checkboxes = document.querySelectorAll('input[name="requestId"]');
	checkboxes.forEach(function(checkbox) {
		checkbox.addEventListener("change", function() {
			let allChecked = true;
			checkboxes.forEach(function(checkbox) {
				if (!checkbox.checked) {
					allChecked = false;
				}
			});

			const allChkBox = document.getElementById("allChkBox");
			allChkBox.checked = allChecked;
		});
	});
}
// 전체 선택 체크박스
const allChkBox = document.getElementById("allChkBox");

// 전체 선택 체크박스 클릭 시 처리
allChkBox.addEventListener("click", function() {
	const checkboxes = document.querySelectorAll('input[name="requestId"]');
	checkboxes.forEach(function(checkbox) {
		checkbox.checked = allChkBox.checked;
	});
});

// status 한국어 전환
function getStatusKorean(status) {
	switch (status) {
		case 'Pending':
			return '대기';
		case 'approve':
			return '승인';
		case 'deny':
			return '반려';
		default:
			return status;
	}
}


function updateStatusXHR(status) {
	// 체크된 박스 호출
	var selectedIds = Array.from(document.querySelectorAll('input[name="requestId"]:checked')).map(function(checkbox) {
		return checkbox.value;
	});

	// 최소한 하나의 체크박스가 선택되었는지 확인
	if (selectedIds.length === 0) {
		openModal('체크리스트에서 최소 한 항목을 선택해주세요.');
		return; // 함수가 진행되는 것을 중단
	}

	var xhr = new XMLHttpRequest();
	xhr.open("POST", "/mes_project/absent/update", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			var response = JSON.parse(xhr.responseText);
			console.log(response);
			openModal(response.message);
			fetchAbsentList();
		}
	};

	// 요청 파라미터를 적절히 인코딩
	var params = 'status=' + status + '&absentIds=' + JSON.stringify(selectedIds);
	console.log(params);
	xhr.send(params);
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

			// 네비4
			// for (let i = 0; i < ulLi.length; i++) {
			//     ulLi[i].style.padding = '10px';
			//     ulLi[i].style.margin = '0px';
			// }

			// 네비5
			for (let i = 0; i < ulLi.length; i++) {
				ulLi[i].style.padding = '7px';

			}
			menuBar.prepend(myPage);
		}
	});
});