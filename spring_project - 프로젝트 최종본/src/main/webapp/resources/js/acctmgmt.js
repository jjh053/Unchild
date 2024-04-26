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
	document.getElementById('searchButton').addEventListener('click', filterEmployees);

	document.querySelector('#searchInput').addEventListener('keypress', function(e) {
		if (e.key === 'Enter') {
			filterEmployees();
		}
	});
});

/*
// 엔터 키 입력 이벤트 리스너 (검색 필드)
document.getElementById('searchInput').addEventListener('keypress', function(e) {
	if (e.key === 'Enter') {
		e.preventDefault(); // 폼 자동 제출 방지
		const searchTerm = e.target.value;
		listEmployees(searchTerm); // 검색어를 listEmployees 함수에 전달
	}
});
*/

var currentPage = 1;
var totalPages = 1;

function setupPagination() {
	listEmployees();
	attachSearchEventListeners(); // 검색 관련 이벤트 리스너 설정
}
function listEmployees() {
	var sortParams = document.getElementById("sortField").value.split(",");
	var xhr = new XMLHttpRequest();
	xhr.open('GET', `/mes_project/staffacat/list?page=${currentPage}&size=10&sortField=${sortParams[0]}&sortOrder=${sortParams[1]}`, true);

	xhr.onload = function() {
		if (this.status === 200) {
			var response = JSON.parse(this.responseText);
			totalPages = response.totalPages;
			renderAccounts(response.items); 
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

// 계정 목록 렌더링 함수
function renderAccounts(accounts) {
    var tableBody = document.querySelector('.Staff_list tbody');
    var rows = ''; // 모든 행을 하나의 문자열로 만들기 위해 초기화

    accounts.forEach(function(account) {
            var row = `<tr>
                <td>${account.staffno}</td>
                <td>${account.sname}</td>
                <td>${account.userid}</td>
                <td>
                    <select onchange="updateRole(this, '${account.staffno}')" data-empno="${account.staffno}">
                        <option value="ADMIN" ${account.role === 'ADMIN' ? 'selected' : ''}>ADMIN</option>
                        <option value="WORKER" ${account.role === 'WORKER' ? 'selected' : ''}>WORKER</option>
                        <option value="UNDEFINED" ${account.role === 'UNDEFINED' ? 'selected' : ''}>UNDEFINED</option>
                    </select>
                </td>
            </tr>`;
            rows += row; // 문자열에 행 추가
    });

    tableBody.innerHTML = rows; // 생성된 모든 행을 한 번에 추가
}

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
            renderAccounts(response.items);
            renderPagination();
        } else {
            try {
                var errorResponse = JSON.parse(this.responseText);
                openModal(errorResponse.message);
            } catch(e) {
                openModal('직원 목록을 불러오는 데 실패했습니다.');
            }
        }
    };
    xhr.send();
}

document.querySelector('.showAll').addEventListener('click', listEmployees);

function updateRole(selectElement, staffno) {
	var newRole = selectElement.value;
	// 여기서 POST 요청을 보내 서버에서 권한을 
	var xhr = new XMLHttpRequest();
	xhr.open('POST', '/mes_project/role/update', true);
	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xhr.onload = function() {
		if (this.status == 200) {
			openModal('권한이 업데이트되었습니다.');
		} else {
			openModal('권한 업데이트에 실패했습니다.');
		}
	};
	xhr.send('staffno=' + staffno + '&newRole=' + newRole);
}

document.querySelector(".mybutton").addEventListener("click", () => {
	window.open("/mes_project/mypage", '_blank', 'width = 630, height = 470, top=100, left=100');
});

