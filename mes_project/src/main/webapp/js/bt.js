
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

const section = document.querySelector('section');
section.addEventListener("click", function() {
	hideMenuBar();
})

function showMenuBar() {
	nav.classList.add('active');
}

function hideMenuBar() {
	nav.classList.remove('active');
}

document.querySelector("#writeBtn").addEventListener("click", () => {
	document.querySelector("#writeDiv").style.display = "block";
});


function sendData() {
	// 전송할 데이터를 객체로 생성
	var data = {
		num: document.getElementById("num").value,
		title: document.getElementById("title").value,
		content: document.getElementById("content").value,
		writer: document.getElementById("writer").value,
		wdate: document.getElementById("wdate").value,
		hits: document.getElementById("hits").value
	};

	// AJAX 요청 생성
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "/setting", true);
	xhr.setRequestHeader("Content-Type", "application/json");

	xhr.onload = function() {
		if (xhr.status === 200) {
			console.log("전송성공");
		} else {
			console.error("전송실패");
		}
	};
	xhr.send(JSON.stringify(data));
}

document.querySelector("#crystalBtn").addEventListener("click", () => {
	document.querySelector("#readTitle").readOnly = false;
	document.querySelector("#writer").readOnly = false;
	document.querySelector("#textContentBox").readOnly = false;
	document.querySelector("#crystalBtn").style.display = "none";
	document.querySelector("#jewelerBtn").style.display = "inline";
})

document.querySelector("#clearWrite").addEventListener("click", () => {
	let todayTime = new Date();
	let wdate = "";
	let nowYear = todayTime.getFullYear() % 100;
	let nowMonth = ('0' + (todayTime.getMonth() + 1)).slice(-2);
	let nowDate = ('0' + todayTime.getDate()).slice(-2);
	
	let nowHour = ('0' + todayTime.getHours()).slice(-2);
	let nowMin = ('0' + todayTime.getMinutes()).slice(-2);
	
	wdate = nowYear + "-" + nowMonth + "-" + nowDate;

	document.querySelector("#nowTime").value = wdate;

	let tableText = `
    <tr>
        <td>${num}</td>
        <td class="tableTdTitle">${title}</td>
        <td class="writer">${writer}</td>
        <td style="display: none"><textarea class="contentBox">${content}</textarea></td>
        <td>${wdate}</td>
        <td>${viewCount}</td>
    </tr>`;
	let noticeTrs = document.querySelectorAll(".noticeTr");
	let lastNoticeTr = noticeTrs[noticeTrs.length - 1];

	if (lastNoticeTr) {
		lastNoticeTr.insertAdjacentHTML("afterend", tableText);
	} else {
		document.querySelector("#tableBody").insertAdjacentHTML("beforeend", tableText);
	}


	document.querySelector("#writeDiv").style.display = "none";
	document.querySelector("#writeTitle").value = "";
	document.querySelector("#textBox").value = "";

	let tableTdTitles = document.querySelectorAll(".tableTdTitle");

	for (let i = 0; i < tableTdTitles.length; i++) {
		tableTdTitles[i].addEventListener("click", function(event) {
			document.querySelector("#seq").value = event.target.getAttribute('data-seq');
			modal.style.display = "block";
			modal.style.pointerEvents = "auto";
			document.querySelector("#readTitle").value = tableTdTitles[i].textContent;
			document.querySelector("#writer").value = document.querySelectorAll(".writer")[i].textContent;
			document.querySelector("#textContentBox").textContent = document.querySelectorAll(".contentBox")[i].value;
		});
	}
	isWriteCompleted = false;
	fnSend();
});
isWriteCompleted = true;

document.querySelector("#resetWrite").addEventListener("click", () => {
	document.querySelector("#writeDiv").style.display = "none";
});

// 마이페이지
document.querySelector("#workerName").addEventListener("click", () => {
	window.open("myPage.html", '_blank', 'width = 630, height = 470, top=100, left=100');
});

let openModalBtn = document.querySelectorAll(".tableTdTitle");
var modal = document.getElementById("myModal");
var closeModalBtn = document.getElementById("closeModalBtn");


for (let i = 0; i < openModalBtn.length; i++) {
	openModalBtn[i].addEventListener("click", function() {

		const viewCount = openModalBtn[i].closest('tr').querySelector('.viewCount');
		if (viewCount) {
			viewCount.textContent = parseInt(viewCount.textContent) + 1;
		}

		document.querySelector("#seq").value = event.target.getAttribute('data-seq');
		modal.style.display = "block";
		modal.style.pointerEvents = "auto";
		document.querySelector("#readTitle").value = openModalBtn[i].textContent;
		document.querySelector("#writer").value = document.querySelectorAll(".writer")[i].textContent;
		document.querySelector("#textContentBox").textContent = document.querySelectorAll(".contentBox")[i].value;

		return;
	});
}

function countPlus(seq) {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (xhr.readyState === XMLHttpRequest.DONE) {
			if (xhr.status === 200) {
				console.log("ViewPlusServlet 호출 성공");
			} else {
				console.error("서블릿 호출 실패");
			}
		}
	};
	xhr.open("GET", "vcp?seq=" + seq, true);
	xhr.send();
}

closeModalBtn.addEventListener("click", function() {
	modal.style.display = "none";
	modal.style.pointerEvents = "none";
	location.reload();
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





function deletePost(seq) {
	let boardTypeName = document.querySelector('input[name="boardType"]');
	let boardType = boardTypeName.value;
	console.log("boardType : " + boardType);
	window.location.href = "dod?seq=" + seq + "&boardType=" + boardType;
}

function fnNumSend() {
	let xhr = new XMLHttpRequest();
	xhr.open("POST", "setting", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.onreadystatechange = function() {
		if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
			console.log("responseText : " + xhr.responseText);
		}
	};
	xhr.send("num=" + seq);
}


// 검색
// 엔터나 클릭을 해야 검색
document.addEventListener('DOMContentLoaded', function() {
	roleSwitch();
	const searchInput = document.querySelector('.search_text');
	const searchImage = document.querySelector('.glasses');
	const tableRows = document.querySelectorAll('#tableBody tr');

	function filterRows() {
		const searchTerm = searchInput.value.toLowerCase();
		console.log('검색내용 : ', searchTerm);

		tableRows.forEach(row => {
			const cellValue = row.querySelector('.tableTdTitle').textContent.toLowerCase();

			if (cellValue.includes(searchTerm)) {
				row.style.display = '';
			} else {
				row.style.display = 'none';
			}
		});
	}

	// 검색 이미지를 클릭했을 때 검색 실행
	searchImage.addEventListener('click', filterRows);

	// 또는 Enter 키를 눌렀을 때도 검색 실행 가능
	searchInput.addEventListener('keypress', function(e) {
		if (e.key === 'Enter') {
			filterRows();
		}
	});
});



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

			// 네비5
			for (let i = 0; i < ulLi.length; i++) {
				ulLi[i].style.padding = '7px';

			}
			menuBar.prepend(myPage);
		}
	});
});




function roleSwitch() {
	console.log("userRole : " + userRole)
	if ("ADMIN" == (userRole)) {
		document.querySelector("#writeBtn").innerHTML = "공지작성";
		document.querySelector("#writeBtn").style.backgroundColor = "red";
		
		document.querySelector("#writeBtn").addEventListener("mouseenter", function() {
			this.style.backgroundColor = "rgb(163, 6, 6)";
		});
		document.querySelector("#writeBtn").addEventListener("mouseleave", function() {
			this.style.backgroundColor = "red"; // 원래 배경색으로 돌아가도록 빈 문자열을 설정
		});
		
	} else if ("WORKER" == (userRole)) {
		document.querySelector("#writeBtn").style.backgroundColor = "#3498DB";
		document.querySelector("#writeBtn").addEventListener("mouseenter", function() {
			this.style.backgroundColor = "blue";
		});
		document.querySelector("#writeBtn").addEventListener("mouseleave", function() {
			this.style.backgroundColor = "#3498DB"; // 원래 배경색으로 돌아가도록 빈 문자열을 설정
		});
		document.querySelector("#writeBtn").style.display = "inline";
		document.querySelector("#writeBtn").innerHTML = "글쓰기";

	}
}
