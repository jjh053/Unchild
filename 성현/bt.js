
const hover = document.querySelectorAll('a.hover');
const menuBar = document.querySelector('.menu-bar');
const nav = document.querySelector('nav');
const wrap = document.querySelector('.wrap');

// 모바일 스크립트 코드
const hamburgerMenu = document.querySelector('.hamburger-menu');
const myPage = document.querySelector('#myPage');

hamburgerMenu.addEventListener('click', function () {
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

// hamburgerMenu.addEventListener('click', function () {
//     showMenuBar();
// })

// if() {
// document.querySelector("#mainTitle1").style.display = "block";
// } else {
document.querySelector("#mainTitle2").style.display = "block";
// }

let isHovered = false;

hover.forEach(button => {
    button.addEventListener('mouseover', () => {
        showMenuBar();
        isHovered = true;
    });
});

wrap.addEventListener("mouseleave", function () {
    if (!isHovered) {
        hideMenuBar();
    }
});

menuBar.addEventListener("mouseenter", function () {
    isHovered = true;
});

menuBar.addEventListener("mouseleave", function () {
    hideMenuBar();
});

const section = document.querySelector('section');
section.addEventListener("click", function () {
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

document.querySelector("#clearWrite").addEventListener("click", () => {
    let newTrTitle = document.querySelector("#writeTitle").value;
    let newTextBox = document.querySelector("#textBox").value;
    let trCount = document.querySelectorAll("#tableBody tr").length;
    let todayTime = new Date();
    let nowYear = todayTime.getFullYear() % 100;
    let nowMonth = ('0' + (todayTime.getMonth() + 1)).slice(-2);
    let nowDate = ('0' + todayTime.getDate()).slice(-2);
    let nowHour = ('0' + todayTime.getHours()).slice(-2);
    let nowMin = ('0' + todayTime.getMinutes()).slice(-2);

    let tableText = `
    <tr>
        <td>${trCount - 1}</td>
        <td class="tableTdTitle">${newTrTitle}</td>
        <td class="writer">최민수</td>
        <td style="display: none"><textarea class="contentBox">${newTextBox}</textarea></td>
        <td>${nowYear}.${nowMonth}.${nowDate} ${nowHour}:${nowMin}</td>
        <td>0</td>
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
        tableTdTitles[i].addEventListener("click", function () {
            modal.style.display = "block";
            modal.style.pointerEvents = "auto";
            document.querySelector("#readTitle").value = tableTdTitles[i].textContent;
            document.querySelector("#writer").value = document.querySelectorAll(".writer")[i].textContent;
            document.querySelector("#textContentBox").textContent = document.querySelectorAll(".contentBox")[i].value;
        });
    }
    isWriteCompleted = false;
});
isWriteCompleted = true;

document.querySelector("#resetWrite").addEventListener("click", () => {
    document.querySelector("#writeDiv").style.display = "none";
});


// 공지 작성
document.querySelector("#noticeWriteBtn").addEventListener("click", () => {
    document.querySelector("#noticeWriteDiv").style.display = 'block';
});

document.querySelector("#noticeClearWrite").addEventListener("click", () => {
    let newTrTitle = document.querySelector("#noticeWriteTitle").value;
    let newTextBox = document.querySelector("#noticeTextBox").value;

    let todayTime = new Date();
    let nowYear = todayTime.getFullYear() % 100;
    let nowMonth = ('0' + (todayTime.getMonth() + 1)).slice(-2);
    let nowDate = ('0' + todayTime.getDate()).slice(-2);
    let nowHour = ('0' + todayTime.getHours()).slice(-2);
    let nowMin = ('0' + todayTime.getMinutes()).slice(-2);

    let tableText = `
    <tr>
        <td>공지</td>
        <td class="tableTdTitle">${newTrTitle}</td>
        <td class="writer">최민수</td>
        <td style="display: none"><textarea class="contentBox">${newTextBox}</textarea></td>
        <td>${nowYear}.${nowMonth}.${nowDate} ${nowHour}:${nowMin}</td>
        <td>0</td>
    </tr>`;

    document.querySelector("#tableBody").insertAdjacentHTML("beforebegin", tableText);
    document.querySelector("#noticeWriteDiv").style.display = "none";
    document.querySelector("#noticeWriteTitle").value = "";
    document.querySelector("#noticeTextBox").value = "";

    let tableTdTitles = document.querySelectorAll(".tableTdTitle");

    for (let i = 0; i < tableTdTitles.length; i++) {
        tableTdTitles[i].addEventListener("click", function () {
            modal.style.display = "block";
            modal.style.pointerEvents = "auto";
            document.querySelector("#readTitle").value = tableTdTitles[i].textContent;
            document.querySelector("#writer").value = document.querySelectorAll(".writer")[i].textContent;
            document.querySelector("#textContentBox").textContent = document.querySelectorAll(".contentBox")[i].value;
        });
    }
    isWriteCompleted2 = false;
});
isWriteCompleted2 = true;



document.querySelector("#noticeResetWrite").addEventListener("click", () => {
    document.querySelector("#noticeWriteDiv").style.display = "none";
});

// 마이페이지
document.querySelector("#workerName").addEventListener("click", () => {
    window.open("myPage.html", '_blank', 'width = 630, height = 470, top=100, left=100');
});

let openModalBtn = document.querySelectorAll(".tableTdTitle");
var modal = document.getElementById("myModal");
var closeModalBtn = document.getElementById("closeModalBtn");
let deleteBtn = document.querySelector("#deleteBtn");

for (let i = 0; i < openModalBtn.length; i++) {
    openModalBtn[i].addEventListener("click", function () {
        modal.style.display = "block";
        modal.style.pointerEvents = "auto";
        document.querySelector("#readTitle").value = openModalBtn[i].textContent;
        document.querySelector("#writer").value = document.querySelectorAll(".writer")[i].textContent;
        document.querySelector("#textContentBox").textContent = document.querySelectorAll(".contentBox")[i].value;
        return;
    });
}

closeModalBtn.addEventListener("click", function () {
    modal.style.display = "none";
    modal.style.pointerEvents = "none";
});

deleteBtn.addEventListener("click", function () {
    modal.style.display = "none";
    modal.style.pointerEvents = "none";
});

modal.addEventListener("click", function (event) {
    event.stopPropagation();
});

window.addEventListener("click", function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
        modal.style.pointerEvents = "none";
    }
});


// 검색
// 엔터나 클릭을 해야 검색
document.addEventListener('DOMContentLoaded', function () {
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
    searchInput.addEventListener('keypress', function (e) {
        if (e.key === 'Enter') {
            filterRows();
        }
    });
});



hover.forEach(link => {
    link.addEventListener("click", function (event) {
        let myPage = document.querySelector("#myPage");
        // let myPageName = document.querySelector("#workerName");
        // let myPageLogo = document.querySelector("#myPageLogo");
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

document.querySelector("#mainTitle2").style.display = "block";
function toggle() {
    if (document.querySelector("#adminTitle").style.display != 'block') {

        document.querySelector("#adminTitle").style.display = 'block';
        document.querySelector("#adminNav").style.display = 'block';
        document.querySelector("#noticeWriteBtn").style.display = 'inline';
        document.querySelector(".workerGrade").innerHTML = '관리자<br>';
        document.querySelector("#mainTitle1").style.display = "none";
        document.querySelector("#mainTitle2").style.display = "block";
    } else {
        document.querySelector("#noticeWriteBtn").style.display = 'none';
        document.querySelector("#adminTitle").style.display = 'none';
        document.querySelector("#adminNav").style.display = 'none';
        document.querySelector(".workerGrade").innerHTML = '작업자<br>';
        document.querySelector("#mainTitle1").style.display = "block";
        document.querySelector("#mainTitle2").style.display = "none";
    }
}

document.querySelector("#toggle").addEventListener('click', toggle);
