
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

const section = document.querySelector('section');

hover.forEach(link => {
    link.addEventListener("click", function (event) {
        event.preventDefault();
        if (nav.classList.contains('active') && window.matchMedia("(max-width: 430px)").matches) {
            nav.style.height = `${section.offsetHeight}px`
        }
    });
});

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

section.addEventListener("click", function () {
    hideMenuBar();
})

function showMenuBar() {
    nav.classList.add('active');
}

function hideMenuBar() {
    nav.classList.remove('active');
}

document.querySelector("#workerName").addEventListener("click", () => {
    window.open("myPage.html", '_blank', 'width = 630, height = 470, top=100, left=100');
});

// 체크박스 관련
document.querySelector("#deleteBtn").addEventListener("click", function () {
    let list_checked = document.querySelectorAll(".chk:checked");
    for (let i = 0; i < list_checked.length; i++) {
        list_checked[i].parentNode.parentNode.remove();
    }
})

document.querySelector("#applyBtn").addEventListener("click", function () {
    let people = document.querySelector("#addTr");
    let list_checked = document.querySelectorAll(".chk:checked");
    for (let i = 0; i < list_checked.length; i++) {
        let rowToAdd = document.createElement('tr');
        let cells = list_checked[i].parentNode.parentNode.querySelectorAll('td');
        for (let j = 1; j < cells.length; j++) {
            let newCell = document.createElement('td');
            newCell.innerHTML = cells[j].innerHTML;
            rowToAdd.appendChild(newCell);
        }
        people.appendChild(rowToAdd);
        list_checked[i].parentNode.parentNode.remove();
    }
});


document.querySelector("#allChkBox").addEventListener("click", function (event) {
    let list_check = document.querySelectorAll(".chk");
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

document.querySelector(".chk").addEventListener("click", function (event) {
    if (!event.target.checked) {
        document.querySelector("#allChkBox").checked = false;
    } else {
        let allCount = document.querySelectorAll(".chk").length;
        let checkedCount = document.querySelectorAll(".chk:checked").length;

        if (allCount == checkedCount) {
            document.querySelector("#allChkBox").checked = true;
        } else {
            document.querySelector("#allChkBox").checked = false;
        }
    }
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

            // 네비5
            for (let i = 0; i < ulLi.length; i++) {
                ulLi[i].style.padding = '7px';

            }
            menuBar.prepend(myPage);
        }
    });
});

document.querySelector("#adminTitle").style.display = 'block';
document.querySelector("#adminNav").style.display = 'block';
document.querySelector(".workerGrade").innerHTML = '작업자<br>';
