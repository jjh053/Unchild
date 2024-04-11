/**
 * 
 */
function showClock() {
	var currentDate = new Date();
	var divClock = document.getElementById('divClock');
	var msg = " ";
	if (currentDate.getHours() > 12) {      //시간이 12보다 크다면 오후 아니면 오전
		msg += "오후 ";
		msg += currentDate.getHours() - 12 + "시 ";
	}
	else {
		msg += "오전 ";
		msg += currentDate.getHours() + "시 ";
	}

	msg += currentDate.getMinutes() + "분 ";
	msg += currentDate.getSeconds() + "초";

	divClock.innerText = msg;

	setTimeout(showClock, 1000);  //1초마다 갱신
}

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
console.log(1);
	const ctx = document.getElementById('productionChart').getContext('2d');
	const productionChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: ['9월', '10월', '11월', '12월', '1월', '2월'],
			datasets: [{
				label: '퍼포먼스',
				data: [400, 470, 670, 720, 550, 670],
				backgroundColor: 'rgba(255, 99, 132, 0.2)',
				borderColor: 'rgba(255, 99, 132, 1)',
				borderWidth: 2,
				pointRadius: 3,
			}, {
				label: '메인 스트림',
				data: [900, 850, 700, 830, 1000, 1002],
				backgroundColor: 'rgba(54, 162, 235, 0.2)',
				borderColor: 'rgba(54, 162, 235, 1)',
				borderWidth: 2,
				pointRadius: 3,
			}, {
				label: '엔트리',
				data: [1100, 900, 1100, 1300, 1200, 1390],
				backgroundColor: 'rgba(75, 192, 192, 0.2)',
				borderColor: 'rgba(75, 192, 192, 1)',
				borderWidth: 2,
				pointRadius: 3,
			}]
		},
		options: {
			scales: {
				y: {
					beginAtZero: true
				}
			}
		}
	});

	const levelColors = [
		"#ff0000",
		"#f9c802",
		"#32CD32"
	];



	const performanceGage = new JustGage({
		id: "performanceGage",
		value: a,
		min: 0,
		max: 100,
		title: "퍼포먼스",
		label: "개",
		levelColors: levelColors
	});


	const mainStreamGage = new JustGage({
		id: "mainStreamGage",
		value: b,
		min: 0,
		max: 100,
		title: "메인 스트림",
		label: "개",
		levelColors: levelColors
	});


	const entryGage = new JustGage({
		id: "entryGage",
		value: c,
		min: 0,
		max: 100,
		title: "엔트리",
		label: "개",
		levelColors: levelColors
	});


	const cpuStatus = document.getElementById('cpu-status');
	const cpuOperations = document.getElementById('cpu-operations');
	const cpuDefectRateElement = document.getElementById('cpu-defect-rate');
	const cpuDefectCountElement = document.getElementById('cpu-defect-count');
	const cpuGoodCountElement = document.getElementById('cpu-good-count');

	let cpuOperationsCount = 0;
	let cpuDefectCount = 0;
	let iteration = 0;
	const maxIterations = 50;

	function simulateDefects(defectRate) {
		return Math.random() < defectRate ? 1 : 0;
	}

	function calculateDefectRate(operationsCount, defectCount) {
		if (operationsCount === 0) return "0.00";
		const rate = (defectCount / operationsCount) * 100;
		return rate.toFixed(2);
	}

	function updateCountsAndRates() {
		cpuOperations.textContent = `사이클 횟수: ${cpuOperationsCount}`;
		cpuDefectCountElement.textContent = `불량: ${cpuDefectCount}`;
		cpuGoodCountElement.textContent = `통과: ${Math.max(0, cpuOperationsCount - cpuDefectCount)}`;
		cpuDefectRateElement.textContent = `불량률: ${calculateDefectRate(cpuOperationsCount, cpuDefectCount)}%`;
	}

	function runProcess() {
		if (iteration < maxIterations) {
			cpuStatus.textContent = 'Running';
			cpuStatus.style.color = 'red';

			setTimeout(() => {
				cpuStatus.textContent = 'Completed';
				cpuStatus.style.color = 'green';
				cpuOperationsCount++;
				cpuDefectCount += simulateDefects(0.01);  // 1% defect rate for illustration
				updateCountsAndRates();

				setTimeout(() => {
					iteration++;
					runProcess();
				}, 3000);
			}, 3000);
		}
	}

	runProcess();
});

const vacationLink = document.getElementById('vacationLink');


/////////////// 휴가 신청 내역 로드
function fetchAbsentList() {
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "updateabsent?action=list", true); // 주소 수정
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

	var limitedData = data.slice(0, 3);

	limitedData.forEach(function(absent) {
		var statusKorean = getStatusKorean(absent.status);
		var row = `<tr>
            <td style="display: none;"><input type="checkbox" name="requestId" id="checkBox" value="${absent.id}"></td>
            <td>${absent.empno}</td>
            <td>${absent.startDate}<br> ~ <br> ${absent.endDate}</td>
            <td>${absent.reason}</td>
            <td>${statusKorean}</td>
        </tr>`;
		tableBody.innerHTML += row;
	});
}

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
//////////////////




// 마이페이지
document.querySelector(".mybutton").addEventListener("click", () => {
	window.open("mypage", '_blank', 'width=630,height=470,top=100,left=0');
});
