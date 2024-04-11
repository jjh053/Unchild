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
section.addEventListener("click", function() {
	hideMenuBar();
})

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

document.addEventListener('DOMContentLoaded', function() {
	listEmployees(); // 페이지 로드 시 직원 목록을 불러옴

	// 검색 버튼 클릭 이벤트 리스너
	document.getElementById('searchButton').addEventListener('click', function() {
		const searchTerm = document.getElementById('searchInput').value;
		listEmployees(searchTerm); // 검색어를 listEmployees 함수에 전달합니다.
	});

	// 엔터 키 입력 이벤트 리스너 (검색 필드)
	document.getElementById('searchInput').addEventListener('keypress', function(e) {
		if (e.key === 'Enter') {
			e.preventDefault(); // 폼 자동 제출 방지
			const searchTerm = e.target.value;
			listEmployees(searchTerm); // 검색어를 listEmployees 함수에 전달
		}
	});
});

// listEmployees 함수 수정
function listEmployees(searchTerm = '') {
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/mes_project/account?action=list', true);
	xhr.onload = function() {
		if (this.status == 200) {
			var accounts = JSON.parse(this.responseText);
			if (searchTerm) {
				accounts = accounts.filter(account =>
					account.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
					account.userId.toLowerCase().includes(searchTerm.toLowerCase()) ||
					account.empno.toString().includes(searchTerm)
				);
			}
			renderAccounts(accounts); // 필터링된 계정 목록을 렌더링합니다.
		} else {
			openModal('직원 목록을 불러오는 데 실패했습니다.');
		}
	};
	xhr.send();
}

// 계정 목록 렌더링 함수
function renderAccounts(accounts) {
	var tableBody = document.querySelector('.Staff_list tbody');
	tableBody.innerHTML = ''; // 기존 목록을 초기화

	accounts.forEach(function(account) {
		var row = `<tr>
            <td>${account.empno}</td>
            <td>${account.name}</td>
            <td>${account.userId}</td>
            <td>
                <select onchange="updateRole(this, '${account.empno}')" data-empno="${account.empno}">
                    <option value="ADMIN" ${account.role === 'ADMIN' ? 'selected' : ''}>ADMIN</option>
                    <option value="WORKER" ${account.role === 'WORKER' ? 'selected' : ''}>WORKER</option>
                    <option value="UNDEFINED" ${account.role === 'UNDEFINED' ? 'selected' : ''}>UNDEFINED</option>
                </select>
            </td>
        </tr>`;
		tableBody.innerHTML += row;
	});
}

function updateRole(selectElement, empno) {
	var newRole = selectElement.value;
	// 여기서 POST 요청을 보내 서버에서 권한을 
	var xhr = new XMLHttpRequest();
	xhr.open('POST', '/mes_project/account?action=updateRole', true);
	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xhr.onload = function() {
		if (this.status == 200) {
			openModal('권한이 업데이트되었습니다.');
		} else {
			openModal('권한 업데이트에 실패했습니다.');
		}
	};
	xhr.send('empno=' + empno + '&newRole=' + newRole);
}

document.querySelector(".mybutton").addEventListener("click", () => {
	window.open("mypage", '_blank', 'width = 630, height = 470, top=100, left=100');
});

