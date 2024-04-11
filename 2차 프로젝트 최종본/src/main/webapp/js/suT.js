
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
tableBody
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

// 마이페이지
document.querySelector("#workerName").addEventListener("click", () => {
	window.open("myPage.html", '_blank', 'width = 630, height = 470, top=100, left=100');
});

function search() {
	const searchInput = document.querySelector('.search_text');
	const searchImage = document.querySelector('.glasses');
	const tableRows = document.querySelectorAll('#tableBody tr');

	function filterRows() {
		const searchTerm = searchInput.value.toLowerCase();

		for (let i = 0; i < tableRows.length; i++) {
			const row = tableRows[i];
			const cellValue = row.querySelector('.tableTdTitle').textContent.toLowerCase();

			if (cellValue.includes(searchTerm)) {
				row.style.display = '';
			} else {
				row.style.display = 'none';
			}
		}
	}

	// 검색 이미지를 클릭했을 때 검색 실행
	searchImage.addEventListener('click', filterRows);

	// 또는 Enter 키를 눌렀을 때도 검색 실행 가능
	searchInput.addEventListener('keypress', function(e) {
		if (e.key === 'Enter') {
			filterRows();
		}
	});
}



document.querySelector("#suggestName").value = document.querySelector("#workerName").textContent.trim();

document.querySelector("#anonymous").addEventListener("click", () => {
	if (document.querySelector("#anonymous").checked) {
		document.querySelector("#suggestName").value = "익명";
	} else {
		document.querySelector("#suggestName").value = document.querySelector("#workerName").textContent;
	}
});

// 작업자가 전송버튼을 눌렀을 때
document.querySelector("#sentBtn").addEventListener("click", () => {

	let userTitle = document.querySelector("#suggestTitle").value;
	let userName = document.querySelector("#suggestName").value;
	let userContent = document.querySelector("#suggestContent").value;

	let trCount = document.querySelectorAll("#tableBody tr").length;
	// console.log(trCount);
	let todayTime = new Date();
	let wdate = "";
	let nowYear = todayTime.getFullYear() % 100;
	let nowMonth = ('0' + (todayTime.getMonth() + 1)).slice(-2);
	let nowDate = ('0' + todayTime.getDate()).slice(-2);
	let nowHour = ('0' + todayTime.getHours()).slice(-2);
	let nowMin = ('0' + todayTime.getMinutes()).slice(-2);
	wdate = nowYear + "-" + nowMonth + "-" + nowDate;

	document.querySelector("#nowTime").value = wdate;

	let tableBody = document.querySelector("#tableBody");

	let tableTrContent = `
<tr>
    <td>${trCount + 1}</td>
    <td class="writer">${userName}</td>
    <td class="talbeTdTitle">${userTitle}</td>
    <td style="display: none"><textarea class="contentBox">${userContent}</textarea></td>
    <td>${nowYear}.${nowMonth}.${nowDate} ${nowHour}:${nowMin}</td>
</tr>`;

	tableBody.insertAdjacentHTML("afterbegin", tableTrContent);

	let newRow = tableBody.querySelector("tr"); // 새로 생성된 첫 번째 행 선택
	newEventRow(newRow);
	
});

let titleRow = document.querySelectorAll(".tableTdTitle");
let writerRow = document.querySelectorAll(".writer");
let contentRow = document.querySelectorAll(".contentBox");
for (let i = 0; i < titleRow.length; i++) {
	titleRow[i].addEventListener("click", function() {
		let modal = document.getElementById("myModal");
		let closeModalBtn = document.getElementById("closeModalBtn");

		modal.style.display = "block";
		modal.style.pointerEvents = "auto";
		document.querySelector("#readTitle").value = titleRow[i].textContent;
		document.querySelector("#writer").value = writerRow[i].textContent;
		document.querySelector("#textContentBox").textContent = contentRow[i].value;

		closeModalBtn.addEventListener("click", closeModal);
		modal.addEventListener("click", stopPropagation);
		window.addEventListener("click", windowClickHandler);

		function closeModal() {
			modal.style.display = "none";
			modal.style.pointerEvents = "none";
			removeEventListeners();
		}

		function stopPropagation(event) {
			event.stopPropagation();
		}

		function windowClickHandler(event) {
			if (event.target == modal) {
				closeModal();
			}
		}

		function removeEventListeners() {
			closeModalBtn.removeEventListener("click", closeModal);
			deleteBtn.removeEventListener("click", closeModal);
			modal.removeEventListener("click", stopPropagation);
			window.removeEventListener("click", windowClickHandler);
		}
	});
}

function deletePost(seq) {
	let boardTypeName = document.querySelector('input[name="boardType"]');
	let boardType = boardTypeName.value;
	console.log("boardType : " + boardType);
	window.location.href = "dod?seq=" + seq + "&boardType=" + boardType;
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
		document.querySelector("#totalTable").style.display = "table";
		document.querySelector("#suggestBox").style.display = 'none';
		document.querySelector(".search-container").style.display = 'block';
		document.querySelector(".buttonZip").style.display = 'flex';

	} else {
		document.querySelector("#suggestBox").style.display = 'block';
		document.querySelector(".search-container").style.display = 'none';
		document.querySelector("#totalTable").style.display = "none";
		document.querySelector(".buttonZip").style.display = 'none';

	}
}

document.addEventListener('DOMContentLoaded', function() {
	roleSwitch();
	search();
});

// 마이페이지
document.querySelector("#workerName").addEventListener("click", () => {
	window.open("myPage.html", '_blank', 'width = 630, height = 470, top=100, left=100');
});
