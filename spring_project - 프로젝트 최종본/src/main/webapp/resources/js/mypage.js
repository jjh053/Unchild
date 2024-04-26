var CDate = new Date();
var today = new Date();
var selectCk = 0;

var buildcalendar = function() {
	var htmlDates = '';
	var prevLast = new Date(CDate.getFullYear(), CDate.getMonth(), 0);
	var thisFirst = new Date(CDate.getFullYear(), CDate.getMonth(), 1);
	var thisLast = new Date(CDate.getFullYear(), CDate.getMonth() + 1, 0);
	document.querySelector(".year").innerHTML = CDate.getFullYear() + "년";
	document.querySelector(".month").innerHTML = (CDate.getMonth() + 1) + "월";
	const dates = [];
	if (thisFirst.getDay() != 0) {
		for (var i = 0; i < thisFirst.getDay(); i++) {
			dates.unshift(prevLast.getDate() - i);
		}
	}
	for (var i = 1; i <= thisLast.getDate(); i++) {
		dates.push(i);
	}
	var nextMonthStart = 1;
	for (var i = thisFirst.getDay() + thisLast.getDate(); i < 42; i++) {
		dates.push(nextMonthStart++);
	}

	for (var i = 0; i < 42; i++) {
		var classList = 'date';
		if (i % 7 === 0) classList += ' red';
		if (i % 7 === 6) classList += ' blue';

		if (i < thisFirst.getDay()) {
			htmlDates += '<div class="' + classList + ' last">' + dates[i] + '</div>';
		}
		else if (i < thisFirst.getDay() + thisLast.getDate()) {
			if (today.getDate() === dates[i] && today.getMonth() === CDate.getMonth() && today.getFullYear() === CDate.getFullYear()) {
				htmlDates += '<div id="date_' + dates[i] + '" class="' + classList + ' current-month today" style="background-color: lightblue;">' + dates[i] + '</div>';
			} else {
				htmlDates += '<div id="date_' + dates[i] + '" class="' + classList + ' current-month" onclick="fn_selectDate(' + dates[i] + ');">' + dates[i] + '</div>';
			}
		}
		else {
			if (i % 7 === 0 || i % 7 === 6) {
				htmlDates += '<div class="' + classList + ' next-month gray">' + dates[i] + '</div>';
			} else {
				htmlDates += '<div class="' + classList + ' next-month">' + dates[i] + '</div>';
			}
		}
	}
	document.querySelector(".dates").innerHTML = htmlDates;
}

function prevCal() {
	CDate.setMonth(CDate.getMonth() - 1);
	buildcalendar();
}
function nextCal() {
	CDate.setMonth(CDate.getMonth() + 1);
	buildcalendar();
}

function fn_selectDate(date) {
	var clickedDateElement = document.getElementById('date_' + date);
	var monthAttribute = clickedDateElement.getAttribute('data-month');

	if (monthAttribute !== 'current') {
		return;
	}

	var year = CDate.getFullYear();
	var month = CDate.getMonth() + 1;
	var date_txt = "";
	if (CDate.getMonth() + 1 < 10) {
		month = "0" + (CDate.getMonth() + 1);
	}
	if (date < 10) {
		date_txt = "0" + date;
	}

	if (selectCk == 0) {
		$(".date.current-month").css("background-color", "");
		$(".date.current-month").css("color", "");
		$("#date_" + date + ".current-month").css("background-color", "red");
		$("#date_" + date + ".current-month").css("color", "white");

		$("#period_1").val(year + "-" + month + "-" + date);
		$("#period_2").val("");
		selectCk = date;
	} else {
		$("#date_" + date + ".current-month").css("background-color", "red");
		$("#date_" + date + ".current-month").css("color", "white");
		for (var i = selectCk + 1; i < date; i++) {
			$("#date_" + i + ".current-month").css("background-color", "#FFDDDD");
		}

		$("#period_2").val(year + "-" + month + "-" + date);
		selectCk = 0;
	}
}

// 프로필 수정
let openModalBtn = document.querySelector("#modify-profile");
var modal = document.getElementById("myModal");
var closeModalBtn = document.getElementById("closeModalBtn");
let deleteBtn = document.querySelector("#delete-btn");

// Open the modal
openModalBtn.addEventListener("click", function() {
	modal.style.display = "block";
	modal.style.pointerEvents = "auto";
});

closeModalBtn.addEventListener("click", function() {
	modal.style.display = "none";
	modal.style.pointerEvents = "none";
	document.getElementById('userId').value = '';
	document.getElementById('password').value = '';
	document.getElementById('tel').value = '';
	document.getElementById('email').value = '';
	document.querySelector('.errorMessage').innerHTML = '';
	
});

deleteBtn.addEventListener("click", function() {
	modal.style.display = "none";
	modal.style.pointerEvents = "none";
	document.getElementById('userId').value = '';
	document.getElementById('password').value = '';
	document.getElementById('tel').value = '';
	document.getElementById('email').value = '';
	document.querySelector('.errorMessage').innerHTML = '';
});

modal.addEventListener("click", function(event) {
	event.stopPropagation();
});


window.addEventListener("click", function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
		modal.style.pointerEvents = "none";
	}
});

buildcalendar();

function userInfo() {
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/mes_project/mypage/userInfo', true);

	xhr.onload = function() {
		if (xhr.status >= 200 && xhr.status < 300) {
			var response = JSON.parse(xhr.responseText);

			document.querySelector('#myprofliePic div').innerHTML = '아이디 : ' + response.userid + '<br> 이름 : ' + response.sname; // userId로 수정
			document.querySelector('#mycard').innerHTML = '전화번호 : ' + response.sphone + '<br> 이메일 : ' + response.smail;
		} else {
			// 요청이 실패했을 때 실행될 코드
			console.error('The request failed!');
		}
	};

	xhr.onerror = function() {
		// 요청이 실패했을 때 실행될 코드
		console.error('The request failed!');
	};

	xhr.send();
}

// 모달 열기
function openModal2(message2) {
	document.getElementById('modal-text2').innerText = message2;
	document.getElementById('modal-background2').style.display = 'block';	
}

// 모달 닫기
function closeModal2() {
	document.getElementById('modal-background2').style.display = 'none';
	document.getElementById('userId').value = '';
	document.getElementById('password').value = '';
	document.getElementById('tel').value = '';
	document.getElementById('email').value = '';
	fetchAbsentList();
}

// 닫기 버튼에 이벤트 리스너 추가
document.querySelector('.close-button2').addEventListener('click', closeModal2);

// 배경 클릭시 모달 닫기
window.onclick = function(event) {
	if (event.target == document.getElementById('modal-background2')) {
		closeModal2();
	}
}

function updateAccount() {
	var userId = document.getElementById('userId').value.trim();
	var password = document.getElementById('password').value.trim();
	var email = document.getElementById('email').value.trim();
	var tel = document.getElementById('tel').value.trim();

	var formData = JSON.stringify({
		userid : userId,
		password: password,
		smail: email,
		sphone: tel
	});
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "/mes_project/mypage/updateAccount", true);
	xhr.setRequestHeader("Content-Type", "application/json");

	xhr.onreadystatechange = function() {
		errorMessage = document.querySelector(".errorMessage");
		
		if (xhr.readyState === 4 && xhr.status === 200) {
			console.log(xhr.responseText)
			var response = JSON.parse(this.responseText);
			if (response.success === true) {
				openModal2(response.message);
				userInfo();
				fetchAbsentList();
				errorMessage.innerHTML = "";
				modal.style.display = "none";
				workPage.style.display = "none";
				workPage.style.pointerEvents = "none";
			} else {
				errorMessage.innerHTML = response.message;
			}
		}
	};

	xhr.send(formData);
};

document.getElementById('close-btn').addEventListener('click', function() {
	window.close();
})


let openVacationPopup = document.querySelector("#vacationCard");
let closeVacationPopup = document.querySelector("#closeVacationBtn");
let deleteVacationPopup = document.querySelector("#deleteVacationBtn");
let vacationWeek = document.querySelector("#vacationWeek");

closeVacationPopup.addEventListener("click", () => {
	openVacationPopup.style.display = "none";
	openVacationPopup.style.pointerEvents = "none";
})

deleteVacationPopup.addEventListener("click", () => {
	openVacationPopup.style.display = "none";
	// Re-enable the click event on other shadow parts
	openVacationPopup.style.pointerEvents = "none";
})

let vacationSchedule = document.querySelector("#vacationSchedule");

// 휴가신청
document.querySelector("#vacation-btn").addEventListener("click", function(event) {
	let selectedStartDate = null;

	function resetSelection() {
		selectedStartDate = null;
		selectedEndDate = null;
		document.querySelectorAll(".date.current-month.selected").forEach(function(element) {
			element.style.backgroundColor = "#fc5555";
			element.classList.remove("selected");
		});
		document.querySelector(".vacation-word").innerHTML = "휴가 신청일을 선택해주세요.";
	}

	resetSelection();

	document.querySelector(".dates").addEventListener("click", function(event) {
		let clickedDate = event.target;
		if (clickedDate.classList.contains("current-month")) {
			if (!selectedStartDate) {
				// 시작일
				selectedStartDate = clickedDate;
				selectedStartDate.classList.add("selected");
				document.querySelector(".vacation-word").innerHTML = "휴가 복귀일을 선택해주세요.";
			} else {
				// Select return date
				selectedEndDate = clickedDate;
				let currentDate = parseInt(clickedDate.innerText);
				let startDate = parseInt(selectedStartDate.innerText);

				if (currentDate >= startDate) {

					for (let i = startDate; i <= currentDate; i++) {
						let dateElement = document.getElementById('date_' + i);
						if (dateElement) {
							dateElement.style.borderRadius = "0px"
							dateElement.style.backgroundColor = "#fc5555";
							document.querySelector(`#date_${startDate}`).style.borderTopLeftRadius = "20px";
							document.querySelector(`#date_${startDate}`).style.borderBottomLeftRadius = "20px";
							document.querySelector(`#date_${currentDate}`).style.borderTopRightRadius = "20px";
							document.querySelector(`#date_${currentDate}`).style.borderBottomRightRadius = "20px";
						}
					}
				}
				resetSelection();
				document.querySelector(".vacation-word").innerHTML = '';
				openVacationPopup.style.display = 'inline-block';
				vacationWeek.innerHTML = `휴가 : ${document.querySelector(".month").innerText} ${startDate}일 ~ 
                    ${document.querySelector(".month").innerText} ${currentDate}일`;
				document.querySelector("#applyVacationBtn").addEventListener("click", () => {
					openVacationPopup.style.display = "none";
					openVacationPopup.style.pointerEvents = "none";
					vacationSchedule.style.display = 'block';
					vacationSchedule.innerHTML = `휴가 기간 : ${document.querySelector(".month").innerText} ${startDate}일 ~ 
                    ${document.querySelector(".month").innerText} ${currentDate}일<br>휴가 사유 : ${reasonBox.value}`;
				})
			}
		}

	});
});

let reasonBtn = document.querySelectorAll(".vacationReason");
let reasonBox = document.querySelector(".reasonBox");

reasonBtn[0].addEventListener("click", function(event) {
	console.log(event.target);
	reasonBtn[0].style.backgroundColor = "#999";
	reasonBtn[1].style.backgroundColor = "#ccc";
	reasonBtn[2].style.backgroundColor = "#ccc";
	reasonBtn[3].style.backgroundColor = "#ccc";
	reasonBtn[4].style.backgroundColor = "#ccc";
	reasonBtn[5].style.backgroundColor = "#ccc";
	reasonBox.value = "연차";
	reasonBox.readOnly = true;
});

reasonBtn[1].addEventListener("click", function(event) {
	console.log(event.target);
	reasonBtn[1].style.backgroundColor = "#999";
	reasonBtn[0].style.backgroundColor = "#ccc";
	reasonBtn[2].style.backgroundColor = "#ccc";
	reasonBtn[3].style.backgroundColor = "#ccc";
	reasonBtn[4].style.backgroundColor = "#ccc";
	reasonBtn[5].style.backgroundColor = "#ccc";
	reasonBox.value = "월차";
	reasonBox.readOnly = true;
});

reasonBtn[2].addEventListener("click", function(event) {
	console.log(event.target);
	event.target.style.backgroundColor = "#999";
	reasonBtn[1].style.backgroundColor = "#ccc";
	reasonBtn[0].style.backgroundColor = "#ccc";
	reasonBtn[3].style.backgroundColor = "#ccc";
	reasonBtn[4].style.backgroundColor = "#ccc";
	reasonBtn[5].style.backgroundColor = "#ccc";
	reasonBox.value = "반차";
	reasonBox.readOnly = true;
});

reasonBtn[3].addEventListener("click", function(event) {
	console.log(event.target);
	event.target.style.backgroundColor = "#999";
	reasonBtn[1].style.backgroundColor = "#ccc";
	reasonBtn[2].style.backgroundColor = "#ccc";
	reasonBtn[0].style.backgroundColor = "#ccc";
	reasonBtn[4].style.backgroundColor = "#ccc";
	reasonBtn[5].style.backgroundColor = "#ccc";
	reasonBox.value = "포상";
	reasonBox.readOnly = true;
});

reasonBtn[4].addEventListener("click", function(event) {
	console.log(event.target);
	event.target.style.backgroundColor = "#999";
	reasonBtn[1].style.backgroundColor = "#ccc";
	reasonBtn[2].style.backgroundColor = "#ccc";
	reasonBtn[3].style.backgroundColor = "#ccc";
	reasonBtn[0].style.backgroundColor = "#ccc";
	reasonBtn[5].style.backgroundColor = "#ccc";
	reasonBox.value = "외출";
	reasonBox.readOnly = true;
});

reasonBtn[5].addEventListener("click", function(event) {
	console.log(event.target);
	event.target.style.backgroundColor = "#999";
	reasonBtn[1].style.backgroundColor = "#ccc";
	reasonBtn[2].style.backgroundColor = "#ccc";
	reasonBtn[3].style.backgroundColor = "#ccc";
	reasonBtn[4].style.backgroundColor = "#ccc";
	reasonBtn[0].style.backgroundColor = "#ccc";

	reasonBox.value = "";
	reasonBox.placeholder = "직접 작성";
	reasonBox.readOnly = false;
});

document.querySelector("#applyVacationBtn").addEventListener("click", () => {
	// vacationWeek에서 날짜 정보 추출
	const vacationText = document.querySelector("#vacationWeek").innerText;
	const monthText = document.querySelector(".month").innerText; // 월 정보 추출
	const datePattern = /휴가 : (\d+)월 (\d+)일 ~ (\d+)월 (\d+)일/;
	const matches = vacationText.match(datePattern);

	if (matches) {
		const startMonth = matches[1];
		const startDay = matches[2];
		const endMonth = matches[3];
		const endDay = matches[4];

		// 현재 연도 사용
		const currentYear = new Date().getFullYear();

		// 날짜 포맷팅 (YYYY-MM-DD)
		const startDate = `${currentYear}-${startMonth.padStart(2, '0')}-${startDay.padStart(2, '0')}`;
		const endDate = `${currentYear}-${endMonth.padStart(2, '0')}-${endDay.padStart(2, '0')}`;

		// 사유 추출
		let reason = document.querySelector(".reasonBox").value;

		// 서버로 전송할 데이터 객체 구성
		let requestData = {
			start_date: startDate,
			end_date: endDate,
			reason: reason
		};
		console.log(requestData);
		// AJAX 요청 실행
		console.log("서버로 전송되는 데이터:", requestData); // 데이터 로깅

		fetch('/mes_project/absent/insert', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify(requestData)
		})
			.then(response => response.json())
			.then(data => {
				console.log('Success:', data); // 성공 로그
				openModal2('휴가 신청이 성공적으로 처리되었습니다.');
			})
			.catch((error) => {
				openModal2('휴가 신청 처리 중 오류가 발생했습니다.');
			});
	} else {
		console.error("날짜 정보를 추출할 수 없습니다.");
		openModal2("휴가 기간 정보를 올바르게 인식할 수 없습니다.");
	}
});

/////////////// 휴가 신청 내역 로드
function fetchAbsentList() {
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "/mes_project/mypage/list", true); // 주소 수정
	xhr.onload = function() {
		if (xhr.status >= 200 && xhr.status < 300) {
			// 서버 응답 처리
			var response = JSON.parse(xhr.responseText);
			updateVacationTable(response);
			updateVacationTable2(response);
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
	userInfo();
});


function updateVacationTable(data) {
	var tableBody = document.getElementById("vacationTableBody");
	tableBody.innerHTML = ""; // 테이블 내용 초기화

	var limitedData = data.slice(0, 1);

	limitedData.forEach(function(absent) {
		var statusKorean = getStatusKorean(absent.status);
		var row = `<tr>
            <td style="display: none;"><input type="checkbox" name="requestId" id="checkBox" value="${absent.id}"></td>
            <td class="empno">${absent.staffno}</td>
            <td>${absent.start_date}<br>${absent.end_date}</td>
            <td>${absent.reason}</td>
            <td>${statusKorean}</td>
        </tr>`;
		tableBody.innerHTML += row;
	});
}

function updateVacationTable2(data) {
	var tableBody = document.getElementById("vacationTableBody2");
	tableBody.innerHTML = ""; // 테이블 내용 초기화
	data.forEach(function(absent) {
		var statusKorean = getStatusKorean(absent.status);
		var row = `<tr>
            <td style="display: none;"><input type="checkbox" name="requestId" id="checkBox" value="${absent.id}"></td>
            <td class="empno">${absent.staffno}</td>
            <td>${absent.start_date} ~ ${absent.end_date}</td>
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

let openWorkPopup = document.querySelector(".absentInfo");
let closeWorkPopup = document.querySelector("#closeWorkBtn");
let closeWorkBox = document.querySelector("#closeWorkBox");
let workPage = document.querySelector("#todayWorkPage");
let todayWorkZip = document.querySelector(".today-work-zip")

openWorkPopup.addEventListener("click", function() {
	workPage.style.display = "block";
	workPage.style.pointerEvents = "auto";
});

closeWorkPopup.addEventListener("click", function() {
	workPage.style.display = "none";
	workPage.style.pointerEvents = "none";
});

deleteBtn.addEventListener("click", function() {
	workPage.style.display = "none";
	workPage.style.pointerEvents = "none";
});

workPage.addEventListener("click", function(event) {
	event.stopPropagation();
});

window.addEventListener("click", function(event) {
	if (event.target == workPage) {
		workPage.style.display = "none";
		workPage.style.pointerEvents = "none";
	}
});

let openMailBtn = document.querySelector(".suggestInfo");
var mailPopup = document.getElementById("mailPage");
var closeMailBtn = document.getElementById("closeMailBtn");
let mailCloseBtn = document.querySelector("#mailCloseBtn");

openMailBtn.addEventListener("click", function(event) {
	mailPopup.style.display = "block";
	mailPopup.style.pointerEvents = "auto";

	document.querySelector("#allCheckBox").addEventListener("click", function(event) {
		let list_check = document.querySelectorAll(".isCheckedBox");
		if (event.target.checked) {
			for (let i = 0; i < list_check.length; i++) {
				list_check[i].checked = true;
			}
		} else {
			for (let i = 0; i < list_check.length; i++) {
				list_check[i].checked = false;
			}
		}
	});

	document.querySelector(".isCheckedBox").addEventListener("click", function(event) {
		if (!event.target.checked) {
			document.querySelector("#allCheckBox").checked = false;
		} else {
			let allCount = document.querySelectorAll(".isCheckedBox").length;
			let checkedCount = document.querySelectorAll(".isCheckedBox:checked").length;

			if (allCount == checkedCount) {
				document.querySelector("#allCheckBox").checked = true;
			} else {
				document.querySelector("#allCheckBox").checked = false;
			}
		}
	})

	document.querySelector("#mailDeleteBtn").addEventListener("click", function() {
		let list_checked = document.querySelectorAll(".isCheckedBox:checked");
		for (let i = 0; i < list_checked.length; i++) {
			list_checked[i].parentNode.parentNode.remove();
		}
	})
});

closeMailBtn.addEventListener("click", function() {
	mailPopup.style.display = "none";
	mailPopup.style.pointerEvents = "none";
});

mailCloseBtn.addEventListener("click", function() {
	mailPopup.style.display = "none";
	mailPopup.style.pointerEvents = "none";
});

mailPopup.addEventListener("click", function(event) {
	event.stopPropagation();
});

window.addEventListener("click", function(event) {
	if (event.target == mailPopup) {
		mailPopup.style.display = "none";
		mailPopup.style.pointerEvents = "none";
	}
});

let openWriteMail = document.querySelector("#writeMailPage");
var mailWrite = document.getElementById("mailWrite");
var closeWriteBtn = document.getElementById("closeWriteBtn");
let deleteWriteBtn = document.querySelector("#delete-write-btn");
let applyMailBtn = document.querySelector("#apply-write-btn");

openWriteMail.addEventListener("click", function() {
	mailWrite.style.display = "block";
	mailWrite.style.pointerEvents = "auto";
});

closeWriteBtn.addEventListener("click", function() {
	mailWrite.style.display = "none";
	mailWrite.style.pointerEvents = "none";
});

applyMailBtn.addEventListener("click", function() {
	mailWrite.style.display = "none";
	mailWrite.style.pointerEvents = "none";
});

deleteWriteBtn.addEventListener("click", function() {
	mailWrite.style.display = "none";
	mailWrite.style.pointerEvents = "none";
});

mailWrite.addEventListener("click", function(event) {
	event.stopPropagation();
});

window.addEventListener("click", function(event) {
	if (event.target == mailWrite) {
		mailWrite.style.display = "none";
		mailWrite.style.pointerEvents = "none";
	}
});

let orderDetail = document.querySelector(".suggestInfo");
var orderPage = document.getElementById("orderPage");
var closeOrderBtn = document.getElementById("closeOrderBtn");
let orderCloseBtn = document.querySelector("#orderCloseBtn");

orderDetail.addEventListener("click", function() {
	orderPage.style.display = "block";
	orderWritePage.style = "none";
	orderPage.style.pointerEvents = "auto";
});

closeOrderBtn.addEventListener("click", function() {
	orderPage.style.display = "none";
	orderPage.style.pointerEvents = "none";
});

orderCloseBtn.addEventListener("click", function() {
	orderPage.style.display = "none";
	orderPage.style.pointerEvents = "none";
});

orderPage.addEventListener("click", function(event) {
	event.stopPropagation();
});

let orderWriteBtn = document.querySelector("#orderWriteBtn");
var orderWritePage = document.getElementById("orderWritePage");
var closeOrderWriteBtn = document.getElementById("closeOrderWriteBtn");
let orderWriteCancelbtn = document.querySelector("#orderWriteCancelbtn");

orderWriteBtn.addEventListener("click", function() {
	orderWritePage.style.display = "block";
	orderWritePage.style.pointerEvents = "auto";
});

closeOrderWriteBtn.addEventListener("click", function() {
	orderWritePage.style.display = "none";
	orderWritePage.style.pointerEvents = "none";
});

orderWriteCancelbtn.addEventListener("click", function() {
	orderWritePage.style.display = "none";
	orderWritePage.style.pointerEvents = "none";
});

orderWritePage.addEventListener("click", function(event) {
	event.stopPropagation();
});

window.addEventListener("click", function(event) {
	if (event.target == orderPage) {
		orderPage.style.display = "none";
		orderPage.style.pointerEvents = "none";
	}
});

document.querySelector("#orderWriteApplyBtn").addEventListener("click", () => {
	let orderTableBody = document.querySelector("#orderTableBody");
	let orderWriteTitle = document.querySelector(".orderWriteTitle");
	let bodyChild = document.createElement('tr');
	bodyChild.innerHTML = `
            <td>02.09</td>
            <td><a href="#">${orderWriteTitle.value}</a></td>
            <td>최민수</td>
            <td></td>
        `;
	orderTableBody.prepend(bodyChild);
	orderWritePage.style.display = 'none';

});



let vacationBtn = document.querySelector("#vacation-btn");
let myMailPage = document.querySelector("#my-mail-page");
let todayWork = document.querySelector("#todayWork");


// 작업자
orderWriteBtn.style.display = "none";
vacationBtn.style.display = "block";
myMailPage.style.display = "none";
todayWork.style.display = "block";